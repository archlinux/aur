# Maintainer: Branislav Matula <braniik69 at proton dot me>

pkgname=tfm-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc='TUI file manager'
arch=('x86_64')
url='https://github.com/braniik/tfm'
license=('MIT')
depends=('taglib')
makedepends=('cmake' 'git')
provides=('tfm')
conflicts=('tfm')
source=(
    "$pkgname::git+${url}.git"
    'ftxui::git+https://github.com/ArthurSonzogni/FTXUI.git#tag=v6.1.9'
    'tomlplusplus::git+https://github.com/marzer/tomlplusplus.git#tag=v3.4.0'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    local _tag
    _tag=$(git describe --long --tags --abbrev=7 2>/dev/null)
    if [[ -n "$_tag" ]]; then
        echo "$_tag" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cmake -S "$pkgname" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCHCONTENT_SOURCE_DIR_FTXUI="$srcdir/ftxui" \
        -DFETCHCONTENT_SOURCE_DIR_TOMLPLUSPLUS="$srcdir/tomlplusplus"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
