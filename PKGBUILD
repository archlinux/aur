# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5-styleplugins
pkgver=5.0.0.20170311
_commit=335dbece103e2cbf6c7cf819ab6672c2956b17b3
pkgdesc='Additional style plugins for Qt5'
pkgrel=35
arch=('x86_64' 'aarch64')
url="https://github.com/qt/qtstyleplugins"
license=('LGPL')
depends=('qt5-base' 'gtk2')
source=(
    "${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
    "0001-fix-build-against-Qt-5.15.patch"
    "0002-fix-gtk2-background.patch"
    "${pkgname}.hook"
)
sha512sums=('e8c2d0e9c6b0a47cab04ffd2e9384606638905b63a7c1580f9b629bbcc84ebff19743363ffee3dbd31c3de1dcda684211ad3052932b5aa0081e529afd9cbb14d'
            'f5cedadceb7c4243ba69b5041c6c524223ce742ec9c2c483e706f31e32e9e03e4efb6ed54fa2aada867a7c0145a8f3ec1193377d177c6c77066b5f3ec191e9ce'
            'c39b468c93eaada7d49df9547627fbf91d50292523566ef93287ce0e958b29e6c3635f6e77ad42c4f449a062cc63b68e9f2a24c89524165649f776d205fb5382'
            '5f976142d27eabacd1e1050bb39801d2e4cd68ec7459662e0352541d42d6a75740d3238b5120fb47641a125d6e3200f3a39c304497ac603457e3a97e641dabc2')

prepare() {
    cd qtstyleplugins-${_commit}

    for p in "$srcdir"/*.patch; do
        patch -p1 < "$p"
    done
}

build() {
    cd qtstyleplugins-${_commit}

    qmake PREFIX='/usr' \
        CONFIG+='nostrip' \
        QMAKE_CFLAGS_RELEASE="$CFLAGS" \
        QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"
    make
}

package() {
    cd qtstyleplugins-${_commit}

    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 "$srcdir/${pkgname}.hook" "$pkgdir/usr/share/libalpm/hooks/90-${pkgname}.hook"
}
