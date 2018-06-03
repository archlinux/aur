# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli'
pkgver=0.5.2
_justbasesver=0.09
_justbytesver=0.11
pkgrel=1
pkgdesc='A CLI for the Stratis Project.'
arch=('any')
license=('Apache')
url='stratis-storage.github.io'
depends=('python' 'dbus-client-gen' 'python-dbus-client-gen' 'python-dbus-signature-pyparsing' 'python-into-dbus')
makedepends=('dbus-glib' 'git' 'mpfr' 'python-argparse' 'python-dbus' 'python-pip' 'python-tox')
provides=("${pkgname}")
conflicts=("${pkgname}" 'python-justbases' 'python-justbytes')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratis-cli/archive/v${pkgver}.tar.gz"
  "justbases-${_justbasesver}.tar.gz::https://github.com/mulkieran/justbases/archive/v${_justbasesver}.tar.gz"
  "justbytes-${_justbytesver}.tar.gz::https://github.com/mulkieran/justbytes/archive/v${_justbytesver}.tar.gz"
)
sha256sums=(
  '25ee3f9016c6eb8a3cccb2eabaa3f0f799aef72e05dafceeae2f6dd21b0abcf7'
  '623ff8dcc53e491a693f5a2c3caea41c4386fda54368fa30220955a9e1179513'
  '42f800190f89316b921aab15d64caf4e8e67b88c5c4d459b9d788bba116c6210'
)

check() {
  cd "${pkgname}-${pkgver}"
  tox
}

package() {
  # install justbases version needed for package
  cd "justbases-${_justbasesver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # install justbytes version needed for package
  cd "../justbytes-${_justbytesver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # install actual package
  cd "../${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
