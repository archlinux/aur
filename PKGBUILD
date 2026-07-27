# Maintainer: mrbass21 <jbeck@bumpsk.com>
# Contributor: June <zanthed@riseup.net>
# Submitter: Viste <viste02@gmail.com>

## Put in any extra CMake arguments here.
## See https://www.azerothcore.org/wiki/cmake-options
_extraargs=''

## If you want to add in your own arguments entirely and replace the default below, fill this in.
_cmakeargs=''

_pkgname='azerothcore-wotlk'
pkgname='azerothcore'
pkgver=r18920.e0fe11ba46 # Automatically updated by pkgver()
pkgrel=1
arch=('x86_64')
pkgdesc="AzerothCore - MMORPG Server - continuous build from master branch"
url="http://www.azerothcore.org"
license=('AGPL3')

# Core execution dependencies
depends=('boost-libs' 'readline' 'openssl')
makedepends=('git' 'cmake' 'clang' 'boost' 'openssl' 'lld')

source=("git+https://github.com/azerothcore/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# Get the latest tag and count the number of commits since that tag
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

	# Why don't I just use `depends=('mysql')`? Because MariaDB is a conflicting implementation of MySQL, 
	# and AzerothCore requires the Oracle MySQL ecosystem to be installed. Becuase the dependencies can
	# be satisfied by either MariaDB or MySQL, pacman will happily install MariaDB. Furtherm Mysql will 
	# claim it offers MariaDB and its libraries, so using conflict will cause the installation to fail.
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
		echo " Once those three components are fully active, re-run 'yay -S azerothcore'."
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
		echo " Once those three components are fully active, re-run 'yay -S azerothcore'."
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
    
    # Alternative safeguard flag for newer versions of makepkg
    options=(!lto !debug strip)

	# Clean build sandbox creation using the native, modern CMake wrapper
    # Fixed the installation target directories to proper Linux standards
	CC=clang CXX=clang++ cmake -B build -S "${_pkgname}" \
	-DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/share/azerothcore \
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

	# Copies the runtime helper script into the package
  	install -Dm755 "${srcdir}/${_pkgname}/acore.sh" "${pkgdir}/usr/share/azerothcore/acore.sh"

	# Installs the systemd service units so the server can be managed with systemctl
  	install -Dm644 "${startdir}/azerothcore-auth.service" "${pkgdir}/usr/lib/systemd/system/azerothcore-auth.service"
  	install -Dm644 "${startdir}/azerothcore-world.service" "${pkgdir}/usr/lib/systemd/system/azerothcore-world.service"
}
