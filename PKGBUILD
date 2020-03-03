# Maintainer: Kyle Laker <kyle@laker.email>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=warpinator-git
pkgver=r42.6f44410
pkgrel=2
pkgdesc="Share files across the LAN by Linux Mint"
arch=("x86_64")
url="https://github.com/linuxmint/warp"
# License file is missing from the root of the repository; however, GPL-2+ is given in the
# debian/control file: https://github.com/linuxmint/warp/blob/master/debian/copyright
license=("GPL")
depends=("pygobject-devel" \
         "python-setproctitle" \
         "python-zeroconf" \
         "python-xapp" \
         "xapps" \
         "python-grpcio" \
         "python-grpcio-tools")
makedepends=("git" "meson")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "haskell-wai-app-static" "lm-warp-git" "warp-git")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/warp"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/warp"

    # Fix hard-coded libexec dir in main warp script
    sed -i 's/libexec/lib/g' bin/warp
    sed -i 's/libexec/lib/g' install-scripts/meson_generate_and_install_protobuf_files.py
}

build() {
    arch-meson warp build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
