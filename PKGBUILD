# Maintainer: somekool <somekool _ at _ gmail _ dot _com>

pkgname=netvirt-agent-git
srcgiturl=https://github.com/netvirt/netvirt
pkgver=v0.6.r593.g9b8c178
pkgrel=1
pkgdesc="NetVirt is an open source network virtualization platform (NVP)."
arch=('i686' 'x86_64')
url="http://netvirt.org"
license=('GPLv3')
depends=('jansson' 'curl' 'libevent')
optdepends=()
makedepends=('git' 'scons' 'cmake' 'libcap') # 'libqt4-dev' 'libssl-dev')
source=("${pkgname}::git+${srcgiturl}.git")
md5sums=('SKIP')

pkgver() {
  gitinfo=`git ls-remote ${srcgiturl} | sort -Vk2`
  sha=`echo "$gitinfo" | head -n 1 | cut -c -7`
  tag=`echo "$gitinfo" | tail -n 1 | awk -F "/" {'print $3'}`
  commits=`curl -s ${srcgiturl}/releases/tag/${tag} | grep -o "[0-9]* commits" | awk {'print $1'}`
  printf "%s.r%s.g%s" $tag $commits $sha
}

prepare() {
  cd ${srcdir}/${pkgname}
  set -e
  git submodule update --init --recursive

  pushd tapcfg
  ./buildall.sh linuxonly || true > /dev/null
  popd
  set +e
  echo ======================== prepare completed ========================
}

build() {
  [ -d ${srcdir}/${pkgname}/build ] && rm -fr ${srcdir}/${pkgname}/build
  mkdir ${srcdir}/${pkgname}/build
  cd ${srcdir}/${pkgname}/build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr -DWITH_GUI=OFF -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so -DOPENSSL_ROOT_DIR=/usr/lib/openssl-1.0 -DOPENSSL_LIBRARIES=/usr/lib/openssl-1.0
  make nvagent
  echo ======================== build completed ========================
}

package() {
  cd ${srcdir}/${pkgname}/build
  make install

  #TODO: this could/should become a post_install item
  echo "#!/bin/sh
  sudo chmod 666 /dev/net/tun
  sudo setcap cap_net_bind_service,cap_net_admin=ep /usr/bin/netvirt-agent
  " > ${pkgdir}/usr/bin/netvirt-allow_user

  # restartd on ubuntu allow to easily create a daemon with any command,
  # but unfortunatelly, it does not look to be available under arch linux
  #echo "#!/bin/sh
  #sudo pacman -S restartd
  #echo 'netvirt-agent \"netvirt-agent\" \"sleep 20 && su - \$USER -c netvirt-agent &\" \"\"' | sudo tee -a /etc/restartd.conf
  #" > ${pkgdir}/usr/bin/netvirt-daemonize

  mkdir -p ${pkgdir}/usr/lib/systemd/system

  # ArchLinux uses SystemD, Yeah
  cat << EOF > ${pkgdir}/usr/lib/systemd/system/netvirt-agent.service
[Unit]
Description=Netvirt Agent
After=network.target

[Service]
Environment="HOME=/root"
ExecStart=/usr/bin/netvirt-agent
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target

EOF

}

