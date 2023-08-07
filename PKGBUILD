# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=certbot-dns-desec
pkgver=1.2.1
pkgrel=1
pkgdesc='desec.io DNS Authenticator plugin for Certbot'
arch=('any')
license=('Apache')
url='https://github.com/desec-io/certbot-dns-desec'
depends=(
  "certbot"
  "python-requests"
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
)
source=("git+https://github.com/desec-io/certbot-dns-desec.git#tag=v$pkgver")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$srcdir/$pkgname"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/"setuptools/d' \
    -i setup.py
}

build() {
  cd "$srcdir/$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
