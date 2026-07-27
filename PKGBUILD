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
depends=('libmysqlclient84' 'mysql-clients84' 'boost-libs' 'readline' 'openssl' 'mysql84')
conflicts=('mariadb' 'mariadb-libs' 'mariadb-clients' 'mysql' 'mysql-clients' 'libmysqlclient')
makedepends=('git' 'cmake' 'clang' 'boost' 'openssl' 'lld' 'mysql84')

source=("git+https://github.com/azerothcore/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# Get the latest tag and count the number of commits since that tag
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	# 1. IMMEDIATE FIREWALL: Check for MariaDB components before doing anything else
	if pacman -Qq | grep -i "mariadb" >/dev/null 2>&1; then
		echo "======================================================================="
		echo " ERROR: MariaDB environmental packages detected!"
		echo "======================================================================="
		echo " AzerothCore requires Oracle MySQL 8.4 and cannot compile or run alongside"
		echo " MariaDB packages. Due to an upstream dependency resolution bug with split"
		echo " packages, your AUR helper accidentally pulled down MariaDB."
		echo ""
		echo " To resolve this loop, please manually drop MariaDB and seed the exact"
		echo " MySQL 8.4 ecosystem onto your machine first:"
		echo "   yay -S libmysqlclient84 mysql-clients84 mysql84"
		echo ""
		echo " Once those three packages are fully active, re-run 'yay -S azerothcore'"
		echo " and the build sandbox will succeed immediately without prompts."
		echo "======================================================================="
		exit 1
	fi

	# Apply any patches here, if needed

	# jemalloc is broken in master. AzerothCore is replacing jemalloc, so this is temporary.
	# Skip the patch when the source tree is already in the patched state.
	if ! grep -q 'throw std::bad_alloc();' deps/jemalloc/src/jemalloc_cpp.cpp; then
		patch --forward -Np1 -i "${startdir}/jemalloc.patch"
	fi
}

build() {

	# Detect if being run manually via makepkg or via an AUR helper
	# Check if the build directory path includes common AUR helper cache folders
	if [[ ! "$startdir" =~ \.cache/(yay|paru|yay-git|paru-git) ]]; then
		# Check if the mysql package or client libraries are actually installed
		if ! pacman -Qi mysql-clients >/dev/null 2>&1 && ! pacman -Qi libmysqlclient >/dev/null 2>&1; then
			echo "======================================================================="
			echo " ERROR: Manual compilation via 'makepkg' detected!"
			echo "======================================================================="
			echo " This package requires Oracle MySQL from the AUR, which standard pacman"
			echo " cannot resolve or download automatically."
			echo ""
			echo " To build this manually, you must install the dependency first:"
			echo "   1. git clone https://aur.archlinux.org/mysql.git"
			echo "   2. cd mysql && makepkg -si"
			echo "   3. Go back to your azerothcore folder and run 'makepkg -si' again."
			echo ""
			echo " Alternative: Use an AUR helper which handles this automatically:"
			echo "   yay -S azerothcore"
			echo "======================================================================="
			exit 1
		fi
	fi

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
