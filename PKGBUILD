# Maintainer: Philip Meulengracht <the_meulengracht@hotmail.com>
pkgname=vchef
pkgver=1.4.3
pkgrel=1
_gitname=bake
epoch=
pkgdesc="The CHEF Package Mangement System"
arch=(any)
url="https://github.com/Meulengracht/${_gitname}"
license=('GPL')
groups=()
depends=(
	'fuse3>=3.0.0'
	'libcap>=2.0.0'
	'curl>=8.0.0'
	'openssl>=3.3.0'
)
makedepends=(git cmake)
#install=
#changelog=
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Meulengracht/bake/archive/refs/tags/v${pkgver}.tar.gz")
source=(
	"git+https://github.com/meulengracht/${_gitname}.git#tag=v${pkgver}"
	"git+https://github.com/meulengracht/libgracht"
	"git+https://github.com/Meulengracht/vali-rofs"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

prepare() {
    cd "${srcdir}/${_gitname}"
    git submodule init
    git submodule set-url -- libs/gracht $srcdir/libgracht
    git submodule set-url -- libs/vafs $srcdir/vali-rofs
    git -c protocol.file.allow=always submodule update
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}"/build
    cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCHEF_DIST_SYSTEMD=ON \
        ../
    make
}

package() {
    cd "${srcdir}/${_gitname}"/build
    make DESTDIR="$pkgdir" install
}
