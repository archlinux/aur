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

depends=('libmysqlclient' 'boost-libs' 'readline' 'openssl')
conflicts=('mariadb' 'mariadb-libs' 'mariadb-clients')

# Using mysql-clients completely eliminates official repo mariadb mapping masquerades
makedepends=('git' 'cmake' 'clang' 'boost' 'mysql-clients' 'openssl')

# Helpful pointers for setting up databases without forcing local bloat
optdepends=(
	'mysql: To host the Oracle MySQL database server locally'
	'docker: To run the AzerothCore server in a containerized environment'
)

source=("git+https://github.com/azerothcore/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# Get the latest tag and count the number of commits since that tag
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Apply any patches here, if needed

	# jemalloc is broken in master. AzerothCore is replacing jemalloc, so this is temporary.
	# Skip the patch when the source tree is already in the patched state.
	if ! grep -q 'throw std::bad_alloc();' deps/jemalloc/src/jemalloc_cpp.cpp; then
		patch --forward -Np1 -i "${startdir}/jemalloc.patch"
	fi
}

build() {

	# Oracles signing key must be trusted for the mysql AUR install
	if ! pacman-key --list-keys B7B3B788A8D3785C >/dev/null 2>&1; then
		echo "Warning: the signing key B7B3B788A8D3785C is not currently trusted."
		echo "If you are installing MySQL from the AUR, import it with:"
		echo "  sudo pacman-key --recv-keys B7B3B788A8D3785C"
		echo "  sudo pacman-key --lsign-key B7B3B788A8D3785C"
  	fi

	# Clean build sandbox creation using the native, modern CMake wrapper
    # Fixed the installation target directories to proper Linux standards
	CC=clang CXX=clang++ cmake -B build -S "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr/share/azerothcore \
    -DCONF_DIR=/etc/azerothcore \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DWITH_WARNINGS=all \
	-DTOOLS_BUILD=all \
    -DSCRIPTS=static \
	-DMODULES=static \
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
