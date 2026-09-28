# Maintainer: Nogweii <me@nogweii.net>
# Mainteiner: Donald Webster <fryfrog@gmail.com>

pkgname=runrestic
# renovate: datasource=pypi depName=runrestic
pkgver=0.5.31
pkgrel=1
pkgdesc='A wrapper script for Restic backup software that inits, creates, prunes and checks backups'
arch=(any)
url='https://pypi.org/project/runrestic'
license=('GPL-3.0-or-later')
depends=(
  'restic'
  'python>=3.10'
  'python-toml>=0.10'
  'python-jsonschema>=3.0'
  'python-requests>=2.27.1'
)

checkdepends=('python-pytest')
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  runrestic.service
  runrestic.timer
)

sha256sums=('9c5a1e49b678b7fed17c246443c46417068fc31eecb54ddadfdb2aabe81bc0bf'
            'd636f96922c1c018c8cd359c3cedc72ac3764c8ee0aace3265ddc6538a56be5d'
            '73b08193d7022f538c326bb4674712f2e2a827ccc557d48bd36416f7d08c598e')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  install -D -m 644 "${srcdir}/runrestic.service" ${pkgdir}/usr/lib/systemd/system/runrestic.service
  install -D -m 644 "${srcdir}/runrestic.timer"   ${pkgdir}/usr/lib/systemd/system/runrestic.timer
}
