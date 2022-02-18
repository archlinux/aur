# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=libvss-git
pkgver=r651.b8ed8a1
pkgrel=2

pkgdesc='High level string and text processing library'
url='https://github.com/AdaCore/VSS'
arch=('any')
license=('GPL3')

makedepends=('git' 'gcc-ada' 'gprbuild')
conflicts=('libvss')

source=("git+https://github.com/AdaCore/VSS.git" "vss.patch")
sha1sums=('SKIP'
          '8f318de8802249dac4e38ac9d198dc53fe8b1dd9')

pkgver() {
    cd "$srcdir/VSS"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/VSS"
    patch --strip=1 < ../vss.patch
}

build() {
    cd "$srcdir/VSS"
	make BUILD_MODE=prod
}

package() {
    cd "$srcdir/VSS"

    for gpr in config gnat json text
    do
        gprinstall -p -P gnat/vss_$gpr.gpr -XBUILD_MODE=prod --prefix="$pkgdir/usr"
    done
}
