# Maintainer: Matthew Tran <0e4ef622 at gmail.com>
pkgname=mrbuild
pkgver=1.8
pkgrel=2
pkgdesc="Simple build system"
arch=('any')
url="https://github.com/dkogan/mrbuild"
license=('MIT')
depends=('perl' 'chrpath')
provides=('mrbuild')
conflicts=('mrbuild')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dkogan/mrbuild/archive/refs/tags/v${pkgver}.tar.gz"
        "libdirs.patch"
        "LICENSE")
sha256sums=('e1bc7b1543be739bfbfcf04fd220ed055ea2c16a9a537608a9b01746cb89ce22'
            'SKIP'
            '9ef5ec6f58aaa29dab6415cd56b48c22907fc6c850a17976d765602c6ceb9cd6')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 < "../libdirs.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Build manpage
    pod2man --section=1 --center="mrbuild" --name=MRBUILD \
        bin/make-pod-from-help \
        make-pod-from-help.1
    gzip make-pod-from-help.1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 bin/make-pod-from-help "${pkgdir}/usr/bin/make-pod-from-help"
    install -Dm644 Makefile.common.header "${pkgdir}/usr/include/$pkgname/Makefile.common.header"
    install -Dm644 Makefile.common.footer "${pkgdir}/usr/include/$pkgname/Makefile.common.footer"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 make-pod-from-help.1.gz "$pkgdir/usr/share/man/man1/make-pod-from-help.1.gz"
    install -d "${pkgdir}/usr/share/doc/$pkgname/"
    cp -r build_examples "${pkgdir}/usr/share/doc/$pkgname/"
}
