# Maintainer: Zach Callear <zach@callear.org>
_pkgname=mss-saliency
pkgname=mss-saliency-git
pkgver=r16.3530de9
pkgrel=1
pkgdesc="Implementation of the Maximum Symmetric Surround Saliency algorithm to highlight salient regions of interest within images"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/technopagan/mss-saliency"
license=('BSD')
depends=('imagemagick' 'libmagick6')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git" 'LICENSE.md')
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname/Release"

    # Use libmagick6 with Magick++-config .
    sed -i 's~\(Magick++-config\)~PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig \1~g' makefile src/subdir.mk
}

build() {
    cd "$srcdir/$_pkgname/Release"
    make all
}

package() {
    cd "$srcdir/$_pkgname/Release"
    install -Dm755 SaliencyDetector "$pkgdir/usr/bin/SaliencyDetector"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
