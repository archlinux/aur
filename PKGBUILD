# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: zwindl on AUR

pkgname=python-pypugjs
pkgver=5.10.1
pkgrel=1
pkgdesc='PugJS syntax adapter for Django, Jinja2 and Mako templates'
url='https://github.com/kakulukia/pypugjs'
depends=(python python-six python-charset-normalizer)
optdepends=(python-django python-jinja python-tornado python-mako python-markdown)
makedepends=(python-build python-installer python-setuptools python-wheel ${optdepends[@]})
checkdepends=(python-pytest)
license=(MIT)
arch=(any)
source=("https://github.com/kakulukia/pypugjs/archive/v$pkgver/pypugjs-$pkgver.tar.gz")
sha256sums=('201a2fa2d0298ae81ff8e01405b4e6812061b0e4052169c04a94672376676a3e')

prepare() {
  cd pypugjs-$pkgver

  # avoid using upstream pyproject.toml as it seems unmaintained
  # out-dated version= value, missing metadata fields, excessive dependencies
  rm -v pyproject.toml
}

build() {
  cd pypugjs-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pypugjs-$pkgver
  PYTHONPATH="$PWD" pytest pypugjs/testsuite
}

package() {
  cd pypugjs-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
