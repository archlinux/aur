# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=markov-typing
pkgver=r209.7116ca7
pkgrel=1
pkgname=markov-typing-git
pkgdesc="Typing tutor that uses Markov chain to generate random strings."
arch=('x86_64' 'i686')
url="https://github.com/akstrfn/markov-typing"
license=('MIT')
depends=('ncurses')
makedepends=('cmake' 'git')
source=("$_pkgname::git+$url")
provides=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \

    cmake --build build
}

# no tests atm
# check() {
#     cd "$_pkgname"
#     cmake --build build -- check
# }

package() {
    cd "$_pkgname"
    cmake --build build -- DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
