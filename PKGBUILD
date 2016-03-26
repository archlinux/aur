# Maintainer: Sebastian Rakel <sebastian@devunit.eu>
# Contributor: Christopher Rosell <chrippa@tanuki.se>

_pkgname='livestreamer'
pkgname="${_pkgname}-dev-git"
pkgver=0.r1431.8dd6a69
pkgrel=3
pkgdesc='CLI program that launches streams from various streaming services in a custom video player'
arch=('any')
url='https://github.com/chrippa/livestreamer'
license=('BSD')
depends=('python-requests' 'rtmpdump' 'python-setuptools')
makedepends=('python-sphinx' 'git')
source=("${pkgname}::git+https://github.com/chrippa/livestreamer#branch=develop")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "${pkgname}"
  printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build_sphinx -b man
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 build/sphinx/man/livestreamer.1 \
    "$pkgdir/usr/share/man/man1/livestreamer.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
