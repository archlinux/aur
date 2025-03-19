# Maintainer: Techcable <$USER at techcable dot net>
# Based off janet-spork from amano.kenji
pkgname=janet-spork-git
pkgver=0.r645.5a5ddbe
pkgrel=1
pkgdesc="Various Janet utility modules - the official "Contrib" library."
arch=('x86_64' 'aarch64')
url="https://github.com/janet-lang/spork"
license=('MIT')
depends=('janet')
makedepends=('git')
provides=('janet-spork')
conflicts=("janet-spork")
backup=()
# 1. Don't strip (debug info is important, we're tiny)
# 2. Offer staticlibs for embedding (we're basically Lua)
options=('!strip' 'staticlibs')
source=('janet-spork::git+https://github.com/janet-lang/spork.git')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

    # TODO: This format will change if spork ever gets an official release
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    jpm build
}

check() {
	cd "$srcdir/${pkgname%-git}"
    jpm test
}

package() {
	cd "$srcdir/${pkgname%-git}"
    modpath="$(janet -e '(print (dyn :syspath))')"
    mkdir -p "${pkgdir}/${modpath}"
	jpm --dest-dir="$pkgdir" --modpath="$modpath" --binpath="/usr/bin" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/janet-spork-git/LICENSE"
}
sha256sums=('SKIP')
