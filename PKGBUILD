# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>

pkgbase=python-mbslave-git
_pkgbase=${pkgbase%-git}
_name=${_pkgbase#python-}
pkgname=$pkgbase
pkgver=r334.d32e188
pkgrel=2
pkgdesc='MusicBrainz database mirror'
url="https://github.com/acoustid/$_name"
arch=('any')
license=('MIT')
depends=('python>=3.7' 'python-six>=1.16.0' 'python-psycopg2>=2.9.2')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core' 'git')
provides=(${_pkgbase})
conflicts=(${_pkgbase} 'python-mbdata<=27.1.0')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # Remove potential old build artifacts
  git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd "$_name"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "$_name"
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -d "$pkgdir/usr/share/doc/$_pkgbase"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgbase" README.rst CHANGELOG.rst mbslave.conf.default
}
