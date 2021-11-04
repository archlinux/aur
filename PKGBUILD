# Maintainer: SamuelLira99 <samuellira99@bol.com.br>

pkgname='azerothcore-wotlk-git'
pkgver=1.3
pkgrel=1
arch=('x86_64')
pkgdesc="Open-source game-server application for World of Warcraft, currently supporting the 3.3.5a game version"
url="http://www.azerothcore.org"
license=('AGPL3')
depends=('mariadb' 'boost' 'cmake' 'clang')
makedepends=('git')
install="${pkgname}.install"
conflicts=('azerothcore')
source=(
"${pkgname}::git+https://github.com/azerothcore/azerothcore-wotlk.git"
"https://github.com/wowgaming/client-data/releases/download/v12/data.zip"
"git+https://github.com/SamuelLira99/azerothcore-systemd-units.git"
)
sha1sums=(
"SKIP"
"SKIP"
"SKIP"
)

_SERVER_ROOT=/opt/azeroth-server
_SRC_DIR=/opt/azerothcore

prepare() {
  # Start mysql services
  sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
  sudo systemctl start mariadb.service

  # Create needed directories and copy azerothcore-wotlk to /opt/azerothcore
  sudo mkdir -p ${_SERVER_ROOT}
  sudo cp -rv ${srcdir}/${pkgname} ${_SRC_DIR}

  # Change ownership for needed directories
  sudo chown ${USER}:${USER} ${_SERVER_ROOT}
  sudo chown ${USER}:${USER} ${_SRC_DIR}

  cd ${_SRC_DIR}
  mkdir -p build
	cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=${_SERVER_ROOT}/ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DWITH_WARNINGS=1 -DTOOLS=0 -DSCRIPTS=static
}

build() {
  cd ${_SRC_DIR}/build
	make -j $(nproc --all)
}

package() {
  # Install azerothcore to /opt/azeroth-server
	cd ${_SRC_DIR}/build
	make install

  # Extract data folder into azeroth-server
  mkdir -p ${_SERVER_ROOT}/data
  cp -rv ${srcdir}/Cameras ${srcdir}/dbc ${srcdir}/maps ${srcdir}/mmaps ${srcdir}/vmaps ${_SERVER_ROOT}/data

  # create authserver.conf and worldserver.conf
  cp ${_SERVER_ROOT}/etc/authserver.conf.dist ${_SERVER_ROOT}/etc/authserver.conf
  cp ${_SERVER_ROOT}/etc/worldserver.conf.dist ${_SERVER_ROOT}/etc/worldserver.conf

  # set DataDir = /opt/azeroth-server/data on worldserver.conf
  sed -i 's@DataDir\s=\s"\."@DataDir = "'"${_SERVER_ROOT}"'/data"@' ${_SERVER_ROOT}/etc/worldserver.conf

  # Setup database
  sudo mysql -u root < ${srcdir}/${pkgname}/data/sql/create/create_mysql.sql

  # Install systemd units
  sed -i 's@/home/samuel/azeroth-server@'"${_SERVER_ROOT}"'@' ${srcdir}/azerothcore-systemd-units/acore-{auth,world}-server.service
  sudo cp ${srcdir}/azerothcore-systemd-units/acore-{auth,world}-server.service /etc/systemd/system
  sudo systemctl daemon-reload

  # Run authserver in order to generate database tables
  echo ''
  echo 'generating database tables, please wait... (it may take 60 seconds)'
  sudo systemctl start acore-auth-server.service

  sleep 60

  # Create default user
  echo ''
  echo 'creating default user' # it has security level 4 in order to create other accounts
  _last_insert_id=$(sudo mysql -u root -e "INSERT INTO acore_auth.account(username, salt, verifier) VALUES('SECURITY4', X'955adb649b38c472805ee6adc002dad1f553b85254bfdd21b930c940d1e17fd1', X'4f9c575b09104c08fd3d41e93b115028486ce72a315b51e58c25effd61debb17'); SELECT LAST_INSERT_ID()")
  sudo mysql -u root -e "INSERT INTO acore_auth.account_access(id, gmlevel, RealmID) VALUES(${_last_insert_id:17}, 4, -1)"

  # Networking
  current_ip=$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep 192)
  echo ''
  echo "Your current IP over LAN is ${current_ip}"

  echo ''
  echo "will other computers play on this server? (if so, don't forget to set ${current_ip} as static IP address to this computer) [y/n]"
  read will_other_pcs_connect

  realmlist_ip='127.0.0.1' # default
	if [[ "$will_other_pcs_connect" == "y" ]]; then
		sudo mysql -u root -e "UPDATE acore_auth.realmlist SET address = '${current_ip}' WHERE id = 1"
    realmlist_ip=${current_ip}
	fi

  echo ${realmlist_ip} | sudo tee /tmp/azerothcore-wotlk-git-realmlist-ip

  echo ""
	echo "enter the name you want for your realm (leave blank for default)"
	read realm_name
	if [[ -n $realm_name ]]; then
		sudo mysql -u root -e "UPDATE acore_auth.realmlist SET name = '${realm_name}' WHERE id = 1"
	fi


}
