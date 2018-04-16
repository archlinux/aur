# Maintainer: Zach Callear <zach@callear.org>
_pkgname=adept
pkgname="$_pkgname-git"
pkgver=r69.c5d3cf9
pkgrel=1
pkgdesc="A JPEG compressor which varies compression within an image based on detection of salient regions of interest"
arch=('any')
url="https://github.com/technopagan/adept-jpg-compressor"
license=('BSD')
depends=('bc' 'imagemagick' 'jpegrescan-git' 'mozjpeg' 'mss-saliency-git')
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
    cd "$srcdir/$_pkgname"

    # Make adept use MozJPEG's cjpeg binary directly rather requiring "mozjpeg" be symlinked to it.
    sed -i 's~\(JPEGCOMPRESSION_COMMAND\) mozjpeg~\1 cjpeg~' adept.sh
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 adept.sh "$pkgdir/usr/bin/adept"
    install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
