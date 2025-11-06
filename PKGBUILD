# Maintainer: dplusplus <echo YXZiZy9hdC91bmZhaXJ0b2lsZXQoZG90XXh5ego= | base64 -d>
# Contributor: Craig Jackson <tapocol@protonmail.com>

pkgname=innoextract-git
pkgver=r922.6e9e34e
pkgrel=1
pkgdesc="A tool to extract installers created by Inno Setup"
url='https://constexpr.org/innoextract/'
arch=('x86_64')
license=('ZLIB')
depends=('boost-libs' 'xz')
makedepends=('boost' 'cmake' 'git')
provides=('innoextract')
conflicts=('innoextract')
source=(
    "$pkgname::git+https://github.com/dscharrer/innoextract.git"
    "boost1.89.0.patch"
)
sha256sums=(
    'SKIP'
    'SKIP'
)


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Fix bulid failure due to Boost 1.89.0
    patch --strip=1 --directory "${pkgname}" < boost1.89.0.patch
}

build() {
    cd "$srcdir/$pkgname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -m644  CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
