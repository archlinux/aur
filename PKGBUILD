# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>

pkgbase=python-mbdata-git
_pkgbase=${pkgbase%-git}
_name=${_pkgbase#python-}
pkgname=$pkgbase
pkgver=27.1.0.r12.g0406f63
pkgrel=2
pkgdesc='MusicBrainz database tools for Python'
url="https://github.com/acoustid/$_name"
arch=('any')
license=('MIT')
depends=('python>=3.7' 'python-six>=1.16.0')
optdepends=('python-lxml: for search'
            'python-sqlalchemy: for models')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core' 'git')
provides=(${_pkgbase})
conflicts=(${_pkgbase})
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgbase" README.rst CHANGELOG.rst settings.py.sample
}
