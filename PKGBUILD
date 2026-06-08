# Maintainer: ced0180 <countbaster@gmail.com>

pkgname=skull-shell-git
pkgver=0.2.0.r8.gf4888cb
pkgrel=1
pkgdesc='Tiny POSIX-style shell written in C++20'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/SkullOS/skull-shell'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'gcc')
provides=('skull-shell' 'skull')
conflicts=('skull-shell' 'skull')
options=('!debug')
install='skull-shell.install'
source=('git+https://codeberg.org/SkullOS/skull-shell.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/skull-shell"
    printf '0.2.0.r%s.g%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/skull-shell"
    mapfile -t sources < <(find src -name '*.cpp' -print | sort)
    g++ ${CXXFLAGS:-} ${CPPFLAGS:-} -std=c++20 -Isrc "${sources[@]}" \
        -o skull \
        ${LDFLAGS:-} -ldl
}

package() {
    cd "$srcdir/skull-shell"
    install -Dm755 skull "$pkgdir/usr/bin/skull"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README.ja.md "$pkgdir/usr/share/doc/$pkgname/README.ja.md"
}
