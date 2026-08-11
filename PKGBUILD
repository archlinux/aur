# Maintainer: mrbass21 <jbeck@bumpsk.com>
# Contributor: June <zanthed@riseup.net>
# Submitter: Viste <viste02@gmail.com>

## Put in any extra CMake arguments here.
## See https://www.azerothcore.org/wiki/cmake-options
_extraargs=''

## If you want to add in your own arguments entirely and replace the default below, fill this in.
_cmakeargs=''

pkgdesc="AzerothCore - MMORPG Server - continuous build from master branch"
_pkgname='azerothcore-wotlk'
pkgname=('azerothcore-wotlk-git')
pkgver=r19137.1883e5c5e0
pkgrel=1
arch=('x86_64')
url="http://www.azerothcore.org"
license=('AGPL3')

source=("git+https://github.com/azerothcore/${_pkgname}.git#branch=master"
		"acore-auth-server.service"
		"acore-world-server.service"
		"acore_setup"
		"attach-world")
sha512sums=('SKIP'
            'b71132ace8a0710b22038716258ed4ecaba81074c7a9c69951440049b955d95e3dd1f8ca81305832ec8f2bea32672f06a19a3b5a569ca3152eb9a4e7a1f7d72c'
            '40fa719a7fc331210eb12266717e8cd8789390462f3cdd026a6917b0f15f177708dbf6e524b26dc0523381fa51901d21000c49132c27643a48cb9a592856adca'
            'e2507661acdc8eef4dc733dc945e4e6bac188694f103dff2c165e8812a61a1196038cc31f602c5f89df2723d70c9fddbef0f35b4af698b17c74cab2d5a86cba9'
            'b284a274735c3d7217743753091a0fc2936b270bf80f9fd6909ccf6fe13d35329e13b768bd90b16ffd87a2cdd9c600b157593a6a7c117335fc0b945d8d7edce5')

install='azerothcore-wotlk-git.install'
#backup=('usr/share/azerothcore/acore.json')
makedepends=('git' 'cmake' 'clang' 'boost' 'openssl' 'lld')
# Core execution dependencies
depends=('boost-libs' 'readline' 'openssl' 'openbsd-netcat')
optdepends=('azerothcore-clientdata: To automatically provision pre-extracted map assets')
options=(!lto !debug strip)
provides=('azerothcore')
conflicts=('azerothcore')


pkgver() {
	cd "${srcdir}/${_pkgname}"
	# Get the latest tag and count the number of commits since that tag
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

	# Why don't I just use `depends=('mysql')`? Because MariaDB is a conflicting implementation of MySQL, 
	# and AzerothCore requires the Oracle MySQL ecosystem to be installed. Because the dependencies can
	# be satisfied by either MariaDB or MySQL, pacman will happily install MariaDB. Further, Mysql will 
	# claim it offers MariaDB and its libraries, so using `conflicts` will cause the installation to fail.
	# So I have to do this hackery just so I can make sure the _actual_ mysql server and libraries are 
	# installed.
	#
	# I wish I still had my sanity.
	if pacman -Qq | grep -E '^mariadb(-libs|-clients)?$' >/dev/null 2>&1; then 
		echo "======================================================================="
		echo " ERROR: MariaDB is installed!"
		echo "======================================================================="
		echo " AzerothCore requires the Oracle MySQL ecosystem to be installed,"
		echo " and MariaDB is a conflicting implementation. Please uninstall "
		echo " MariaDB and install the full MySQL development stack instead."
		echo ""
		echo " Uninstall MariaDB using the following command:"
		echo "   pacman -Qq | grep -E '^mariadb(-libs|-clients)?$' | xargs -r sudo pacman -Rns"
		echo ""
		echo " Please verify or install all three components manually before continuing:"
		echo "   1. libmysqlclient  (The C API development connector libraries)"
		echo "   2. mysql-clients   (The CLI tooling suite like mysqldump)"
		echo "   3. mysql           (The background SQL database server daemon)"
		echo ""
		echo " Execution example using the MySQL 8.4 LTS tracking tree to resolve this:"
		echo "   yay -S libmysqlclient84 mysql-clients84 mysql84"
		echo ""
		echo " Once those three components are fully active, re-run 'yay -S azerothcore-wotlk-git'."
		echo "======================================================================="
		exit 1
	
	fi

	# Enforce rigid filesystem tracking for all 3 critical MySQL 8.4 packages
	if ! pacman -Qq | grep -E '^mysql[0-9]*$' >/dev/null 2>&1 || \
	   ! pacman -Qq | grep -E '^libmysqlclient[0-9]*$' >/dev/null 2>&1 || \
	   ! pacman -Qq | grep -E '^mysql-clients[0-9]*$' >/dev/null 2>&1; then
		echo "======================================================================="
		echo " ERROR: Required Oracle MySQL Package Ecosystem is Incomplete!"
		echo "======================================================================="
		echo " To shield your system from upstream dependency bugs that pull in"
		echo " conflicting MariaDB environments, AzerothCore requires you to have"
		echo " the full MySQL development stack pre-installed."
		echo ""
		echo " Please verify or install all three components manually before continuing:"
		echo "   1. libmysqlclient  (The C API development connector libraries)"
		echo "   2. mysql-clients   (The CLI tooling suite like mysqldump)"
		echo "   3. mysql           (The background SQL database server daemon)"
		echo ""
		echo " Execution example using the MySQL 8.4 LTS tracking tree to resolve this:"
		echo "   yay -S libmysqlclient84 mysql-clients84 mysql84"
		echo ""
		echo " Once those three components are fully active, re-run 'yay -S azerothcore-wotlk-git'."
		echo "======================================================================="
		exit 1
	fi

	# Apply any patches here, if needed
	cd "${srcdir}/${_pkgname}"

	# jemalloc is broken in master. AzerothCore is replacing jemalloc, so this is temporary.
	# Skip the patch when the source tree is already in the patched state.
	if ! grep -q 'throw std::bad_alloc();' deps/jemalloc/src/jemalloc_cpp.cpp; then
		patch --forward -Np1 -i "${startdir}/jemalloc.patch"
	fi
}

build() {
	# Force-disable Link-Time Optimization (LTO)
    # This strips the heavy symbol tables, capping lld's peak RAM usage at ~3.5 GB
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    export LDFLAGS="${LDFLAGS/-flto=auto/}"

	# Clean build sandbox creation using the native, modern CMake wrapper
    # Fixed the installation target directories to proper Linux standards
	CC=clang CXX=clang++ cmake -B build -S "${_pkgname}" \
	-DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCONF_DIR=/etc/azerothcore \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
	-DWITH_WARNINGS=1 \
	-DTOOLS_BUILD=all \
    -DSCRIPTS=static \
	-DMODULES=static \
	-DMYSQL_INCLUDE_DIR=/usr/include/mysql \
	-DMYSQL_LIBRARY=/usr/lib/libmysqlclient.so \
    ${_extraargs}
    
  	# Respects the user's /etc/makepkg.conf CPU core limits cleanly
  	cmake --build build
}

package() {
	# Directs files into Arch's strict isolated filesystem staging area
  	DESTDIR="${pkgdir}" cmake --install build

	install -d "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/attach-world" "${pkgdir}/usr/bin/attach-world"

	install -m755 "${srcdir}/acore_setup" "${pkgdir}/usr/bin/acore_setup"
	chmod +x "${pkgdir}/usr/bin/acore_setup"
	chmod +x "${pkgdir}/usr/bin/attach-world"

	# Copies the runtime helper script into the package
  	#install -Dm755 "${srcdir}/${_pkgname}/acore.sh" "${pkgdir}/usr/share/azerothcore/acore.sh"

	# The following dependencies are required for acore.sh (Disabled for now)
  	# install -dm755 "${pkgdir}/usr/share/azerothcore/apps"
  	# cp -a "${srcdir}/${_pkgname}/apps/." "${pkgdir}/usr/share/azerothcore/apps/"

	# install -dm755 "${pkgdir}/usr/share/azerothcore/deps/acore/bash-lib/src"
  	# cp -a "${srcdir}/${_pkgname}/deps/acore/bash-lib/src/." "${pkgdir}/usr/share/azerothcore/deps/acore/bash-lib/src/"

	# install -dm755 "${pkgdir}/usr/share/azerothcore/deps/acore/bash-lib/src"
  	# cp -a "${srcdir}/${_pkgname}/deps/acore/bash-lib/src/." "${pkgdir}/usr/share/azerothcore/deps/acore/bash-lib/src/"

	# install -dm755 "${pkgdir}/usr/share/azerothcore/apps/installer/includes"
  	# cp -a "${srcdir}/${_pkgname}/apps/installer/includes/." "${pkgdir}/usr/share/azerothcore/apps/installer/includes/"

	# install -Dm755 "${srcdir}/${_pkgname}/deps/acore/joiner/joiner.sh" "${pkgdir}/usr/share/azerothcore/deps/acore/joiner/joiner.sh"
	# install -Dm755 "${srcdir}/${_pkgname}/deps/jsonpath/JSONPath.sh" "${pkgdir}/usr/share/azerothcore/deps/jsonpath/JSONPath.sh"
	# install -Dm755 "${srcdir}/${_pkgname}/conf/dist/config.sh" "${pkgdir}/usr/share/azerothcore/conf/dist/config.sh"
	# install -Dm755 "${srcdir}/${_pkgname}/apps/installer/main.sh" "${pkgdir}/usr/share/azerothcore/apps/installer/main.sh"
	# install -Dm755 "${srcdir}/${_pkgname}/deps/semver_bash/semver.sh" "${pkgdir}/usr/share/azerothcore/deps/semver_bash/semver.sh"
	# install -Dm755 "${srcdir}/${_pkgname}/acore.json" "${pkgdir}/usr/share/azerothcore/acore.json"

	# Install SQL data files into the runtime tree
  	install -dm755 "${pkgdir}/usr/share/azerothcore/data/sql"
  	cp -a "${srcdir}/${_pkgname}/data/sql/." "${pkgdir}/usr/share/azerothcore/data/sql/"

	# Install module sql folders
	install -dm755 "${pkgdir}/usr/share/azerothcore/modules/"
 
	# Installs the systemd service units so the server can be managed with systemctl
  	install -Dm644 "${srcdir}/acore-auth-server.service" "${pkgdir}/usr/lib/systemd/system/acore-auth-server.service"
  	install -Dm644 "${srcdir}/acore-world-server.service" "${pkgdir}/usr/lib/systemd/system/acore-world-server.service"
}

