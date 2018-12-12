# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# You can find the PGP signing key (573ACDA6) here: https://keybase.io/threema
#
# To directly download the key:
#   curl https://keybase.io/threema/pgp_keys.asc | gpg --import
#   gpg --lsign E7ADD9914E260E8B35DFB50665FDE935573ACDA6
pkgname=threema-web
pkgver=2.1.3
pkgrel=1
pkgdesc="The Threema Web client, packaged to run locally on port 4242."
arch=('x86_64' 'i686')
url="https://github.com/threema-ch/threema-web"
license=('AGPL3')
depends=('python3')
makedepends=()
provides=('threema-web')
conflicts=('threema-web-git')
options=('!strip')
source=(
    "https://github.com/threema-ch/threema-web/releases/download/v${pkgver}/threema-web-${pkgver}-gh.tar.gz"
    "https://github.com/threema-ch/threema-web/releases/download/v${pkgver}/threema-web-${pkgver}-gh.tar.gz.asc"
    "threema-web.service"
)
sha256sums=(
    '924fd6feb3cc2399de7f2efeac9d2770c60cf19397e65bac4411e9acf8744616'
    'SKIP'  # PGP signature
    '6cb24b36278ef9d5b57d056d5b8428f82b94cb92f7ffc0ef4bc3eb5278488514'
)
install=threema-web.install

build() {
  cd ${srcdir}/threema-web-${pkgver}-gh/

  # Update version
  find ${srcdir} \
    -type f \
    -exec sed -i "s/${pkgver}-gh/${pkgver}-gh-aur/g" {} +
}

package() {
  # Create directories
  mkdir -p ${pkgdir}/opt/ ${pkgdir}/etc/systemd/system/

  # Install code
  cp -R threema-web-${pkgver}-gh/ ${pkgdir}/opt/threema-web
  chown -R root:http ${pkgdir}/opt/threema-web
  find "${pkgdir}/opt/threema-web" -type f -exec chmod 640 {} \;
  find "${pkgdir}/opt/threema-web" -type d -exec chmod 750 {} \;

  # Install service file
  install -Dm640 -o root -g root ${srcdir}/threema-web.service "${pkgdir}/etc/systemd/system/"
}

# vim:set ts=2 sw=2 et:
