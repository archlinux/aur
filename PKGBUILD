# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=rofi-bitwarden-git
pkgver=r1.0
pkgrel=1
pkgdesc="Bitwarden (rbw) plugin for rofi"
arch=('x86_64')
url="https://github.com/winiciuscota/rofi-bitwarden"
license=('MIT')
depends=('rofi' 'rbw' 'xclip' 'xdotool' 'bash' 'libnotify' 'xdg-utils' 'coreutils')
makedepends=('cmake' 'gcc' 'git')
provides=('rofi-bitwarden')
conflicts=('rofi-bitwarden')
source=("rofi-bitwarden::git+https://github.com/winiciuscota/rofi-bitwarden.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/rofi-bitwarden"
    local _tag
    _tag=$(git describe --long --tags --abbrev=7 2>/dev/null)
    if [[ -n "$_tag" ]]; then
        echo "$_tag" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "$srcdir/rofi-bitwarden/build"

    install -Dm755 rbw.so "$pkgdir/usr/lib/rofi/rbw.so"
    install -Dm755 "$srcdir/rofi-bitwarden/rofi-bitwarden-helper" "$pkgdir/usr/local/bin/rofi-bitwarden-helper"

    install -Dm644 "$srcdir/rofi-bitwarden/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/rofi-bitwarden/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
