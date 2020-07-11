# Maintainer: Jeff Hughes <jeff.hughes@gmail.com>
pkgname=shellcaster-git
_pkgname=shellcaster
pkgver=v0.8.2.r2.g648a652
pkgrel=1

pkgdesc="ncurses-based TUI podcast manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/jeff-hughes/shellcaster"
license=('GPL3')

depends=('sqlite>=3.23.0' 'openssl>=1.1.0')
makedepends=(
    'git'
    'rustup>=1.17.0'
    'ncurses'
)

provides=('shellcaster')
conflicts=('shellcaster')

backup=("etc/${_pkgname}/config.toml")
source=("${_pkgname}::git+https://github.com/jeff-hughes/${_pkgname}.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    cargo install --no-track --locked --no-default-features --features "native-tls" --root "${pkgdir}/usr" --path .
    rm -f "${pkgdir}"/usr/.crate*

    install -Dm644 ./config.toml "${pkgdir}/etc/${_pkgname}/config.toml"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
