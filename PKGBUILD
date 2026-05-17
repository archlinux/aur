# Maintainer: George Tsiamasiotis <george@tsiamasiotis.gr>

pkgname=opensips-cli
pkgver=0.4.0
pkgrel=1
pkgdesc='An interactive command line tool that can be used to control and monitor OpenSIPS servers'
arch=(any)
url='https://github.com/OpenSIPS/opensips-cli'
license=('GPL-3.0-or-later')

depends=(
  python
  python-cryptography
  python-sqlalchemy
  python-pyopenssl
  python-psutil
  python-yaml
  python-pymysql
  python-opensips
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenSIPS/opensips-cli/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7ade6ea64c05ebaa479432302ece31f60fa4ef5c517375f5258a814ba58c58e4')

backup=('etc/opensips-cli.cfg')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  # Install python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install a configuration file
  install -Dm0644 "etc/default.cfg" "$pkgdir/etc/opensips-cli.cfg"

  # Install docs
  for file in docs/modules/*; do
    install -Dm0644 -t "$pkgdir/usr/share/doc/opensips-cli/modules" "$file"
  done
}
