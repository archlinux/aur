# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=('python-odoo17-jid' 'python-odoo18-jid')
pkgbase='python-odoo-jid'
pkgver=0.0.1
pkgrel=5
pkgdesc="An Odoo plugin for adding an XMPP address to contacts."
arch=('any')
license=('GPL-3.0-only')
makedepends=('python-build'
             'python-installer'
             'python-poetry'
             'python-wheel')
# Current release tarball is odoo18 only despite both 17 and 18. Temporarily use
# specific commits instead of the versioned tarball, we'll switch back to the
# versioned one on the next release where there will be separate odoo17 and
# odoo18 tarballs released.
source=("python-odoo18-jid-$pkgver.tar.gz::https://codeberg.org/atlbikeshed/odoo-jid/archive/18.0.tar.gz"
        "python-odoo17-jid-$pkgver.tar.gz::https://codeberg.org/atlbikeshed/odoo-jid/archive/22faf9bc51faca77348ed34ada51ecfd2942981e.tar.gz")
noextract=("python-odoo18-jid-$pkgver.tar.gz"
           "python-odoo17-jid-$pkgver.tar.gz")
sha256sums=('be9aa0cf1bd927ad40b68d89d54a6207429f86e0b86a7783800692ab83f7af45'
            'be8c42a8b99ad13cb6ffd14c1ed8b85c223ff5603025a8daa74c2fa2ea170821')

prepare() {
  # Extract manually to avoid both sources extracting to the same output
  # directory.
  rm -rf "python-odoo{17,18}-jid/"
  tar -xzf "python-odoo17-jid-$pkgver.tar.gz" \
    --one-top-level="python-odoo17-jid-$pkgver" --strip-components 1
  tar -xzf "python-odoo18-jid-$pkgver.tar.gz" \
    --one-top-level="python-odoo18-jid-$pkgver" --strip-components 1
}

build() {
  python -m build --wheel --no-isolation "python-odoo17-jid-$pkgver"
  python -m build --wheel --no-isolation "python-odoo18-jid-$pkgver"
}

package_python-odoo17-jid() {
  depends=('odoo-17')
  url="https://apps.odoo.com/apps/modules/17.0/jid"
  provides=("odoo-jid" "odoo17-jid")
  conflicts=("odoo-jid" "odoo17-jid")
  cd "${pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-odoo18-jid() {
  depends=('odoo18')
  url="https://apps.odoo.com/apps/modules/18.0/jid"
  provides=("odoo-jid" "odoo18-jid")
  conflicts=("odoo-jid" "odoo18-jid")
  cd "${pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
