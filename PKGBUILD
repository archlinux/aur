# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Lane Wiscombe <lane dot wiscombe at gmail dot com>

_pkgname=qbittorrent
pkgname=${_pkgname}-qt5-git
pkgver=3.3.0alpha.r6026.g46c54e5
pkgrel=1
pkgdesc='A bittorrent client based on libtorrent-rasterbar. Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='http://www.qbittorrent.org/'
license=('GPL2')

depends=('qt5-base' 'xdg-utils' 'desktop-file-utils' 'hicolor-icon-theme' 'libtorrent-rasterbar')
optdepends=(
	'python: for the search engine'
)
makedepends=('boost' 'which' 'git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-qt4")

install=${pkgname}.install

source=(
	"git+https://github.com/${_pkgname}/qBittorrent.git"
	"${pkgname}.install"
	'get_version.pri'
)
sha512sums=(
	'SKIP'
	'ba863e424bf680510de38ecd2a24cddbad695b224d3a4d9a282553f9cdb0f4add14dec881c391de58300d3c676ff84c2562988b93ead76aa6dd26db91df5d20b'
	'8330eda1fa7010134c9f13f2890ee0c62916e3a71b59150c8edfb0f0293731311e19646f581d313a39f63c60b8474828954f4b5ac2a6bb4a31b6b80c198b40b6'
)

pkgver() {
	# Updating package version
	cd ${srcdir}/qBittorrent
	(
		set -o pipefail
		printf "%s.r%s.g%s" "$(qmake-qt5 ../get_version.pri 2>/dev/null)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {	
	# Create build directory
	mkdir -p ${srcdir}/build
	
	# Build with GeoIP support
	# geoip-database is already installed at this point as dependency
	# (libtorrent-rasterbar -> geoip) but another check won't hurt
	local _geoip_database=/usr/share/GeoIP/GeoIP.dat
	if [[ -f ${_geoip_database} ]]; then
		# Make a symlink due that qBittorrent needs the file in the source
		# directory, see qBittorrent/src/gui/geoip/geoip.qrc
		ln -rs ${_geoip_database} ${srcdir}/qBittorrent/src/gui/geoip
	fi
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)
	
	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( $njobs - 2 ))
	fi

	# Building package
	cd ${srcdir}/build
	
	../qBittorrent/configure \
		--prefix=/usr \
		--with-qt5 \
		--with-geoip-database-embedded
	qmake-qt5 ../qBittorrent \
		CONFIG+=release \
		CONFIG+=c++14 \
		-spec linux-g++
	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make INSTALL_ROOT=${pkgdir} install
}