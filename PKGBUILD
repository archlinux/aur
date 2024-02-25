# Maintainer: core_contingency <ccontingency(at)gmail(dot)com>
# Maintainer: Quentin Bouvet <qbouvet[at]outlook(dot)com>
# Contributor: ScarecrowDM <diego(dot)busnelli@hotmail(dot)com>
# Contributor: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
# Contributor: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

pkgname=libstrangle
pkgdesc="Simple FPS Limiter"
pkgver=0.1.1
pkgrel=4
url='https://gitlab.com/torkel104/libstrangle'
arch=('x86_64' 'x86_64_v3' 'x86_64_v4')
depends=('lib32-gcc-libs' 'lib32-glibc' 'libglvnd')
makedepends=('git')
provides=('libstrangle')
conflicts=('libstrangle')
license=('GPL3')
source=(
    "https://gitlab.com/torkel104/libstrangle/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
    "fix-compilation-gcc13.patch"
    "bump-vulkan-version.patch"
    "find-dlsym.patch"
)
sha256sums=(
    '8413f260ce1ab15cd38752f67650dee2f822f858d384d6c0784a9428c23cd105'
    '722370d1076c6fe6c83056e9a2020ea6b4367a80af14d2ecdd6b5e6281a8da1d'
    '2ad79c3ff0f6e2b7e34393082fe9118dc2be23e28def3257c123ddbe4c4295e2'
    '07c31bd0906ef5ad611ca74fdfa790fbe0adec97ef2e5e99bfd993f18f00b221'
)

prepare() {
    cd $pkgname-$pkgver
    sed -i -e '/ldconfig/d' makefile
    patch -p2 < ../fix-compilation-gcc13.patch
    patch -p2 < ../bump-vulkan-version.patch
    patch -p2 < ../find-dlsym.patch
}

build() {
    cd $pkgname-$pkgver
    make prefix=/usr
}

package() {
    cd $pkgname-$pkgver
    make prefix=/usr DESTDIR="$pkgdir" install-common install-32 install-64 install-ld

    # Install the README.md locally
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.*
}

#
# makepkg --printsrcinfo > .SRCINFO
#
