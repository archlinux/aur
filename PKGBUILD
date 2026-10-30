# Maintainer: Monjaris <ziyanovruzlu750@gmail.com>
pkgname=zdotool-git
_pkgname=zdotool
pkgver=r1.g0000000  # replaced by pkgver()
pkgrel=2
pkgdesc="Linux command-line automation tool that injects input through uinput"
arch=('x86_64')
url="https://github.com/Monjaris/zdotool"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'xmake')
provides=('zdotool')
conflicts=('zdotool')
options=('!debug')
source=("zdotool::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    xmake config -m release
    xmake build -j"$(nproc)" zdotool
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 build/linux/x86_64/release/zdotool "$pkgdir/usr/bin/zdotool"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    install -Dm644 packaging/systemd/zdotool-daemon.service \
        "$pkgdir/usr/lib/systemd/system/zdotool-daemon.service"
    sed -i 's|/usr/local/bin/zdotool|/usr/bin/zdotool|' \
        "$pkgdir/usr/lib/systemd/system/zdotool-daemon.service"
}
