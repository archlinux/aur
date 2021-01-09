# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Chase Geigle <sky.strife@gmail.com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=obs-v4l2sink
pkgver=0.1.0
_obsver=26.1.0
pkgrel=20
epoch=
pkgdesc="v4l2 output for obs-studio"
arch=(x86_64)
url="https://github.com/CatxFish/obs-v4l2sink"
license=('GPL')
groups=()
depends=('obs-studio')
makedepends=('cmake')
checkdepends=()
optdepends=('v4l2loopback-dkms: virtual video device')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	"obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz"
	"v4l2device_close.patch::https://github.com/CatxFish/obs-v4l2sink/pull/21.patch")
noextract=()
sha256sums=('83e9bb104dcc3840acd17ebc0810de30c8de27545d4ef181d58f8a375dba06d4'
            'c015d9bab1075ecf9c66c066328e291a20ef36880958fb3db6486ebc5ca9c6da'
            '617e017562ab3ca85fffa86c869fa778e26ee0694e0ae8dd1b8b110bff1bb6cc')
validpgpkeys=()

prepare() {
	rm -rf build
	mkdir build

	# Apply "adjust v4l2device_close to void" patch from
	# https://github.com/CatxFish/obs-v4l2sink/pull/21
	cd "${pkgname}-${pkgver}"
	patch --forward --fuzz=0 --input="${srcdir}/v4l2device_close.patch" --strip=1
}

build() {
	cd build
	cmake "../${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DLIBOBS_INCLUDE_DIR="../obs-studio-${_obsver}/libobs" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	DESTDIR="$pkgdir" make install
}
