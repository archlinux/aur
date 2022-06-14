# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# You can find the PGP signing key (573ACDA6) here: https://keybase.io/threema
#
# To directly download the key:
#   curl https://keybase.io/threema/pgp_keys.asc | gpg --import
#   gpg --lsign E7ADD9914E260E8B35DFB50665FDE935573ACDA6
pkgname=threema-web
pkgver=2.4.2
pkgrel=1
pkgdesc="The Threema Web client, packaged to run locally on port 4242"
arch=('any')
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
    "launch.py"
)
sha256sums=(
    '38cb7c5d4fd3bc54ce4c9fe04d3fd8befd3543f6f6924ef37c3496c54e0eb8d7'
    'SKIP'
    '1fbf9c4af5548138f75b00d2bd3de462c658db0c14e9897d09b79f8aa235db9e'
    '0968289ce31f750834b8f495951e1a29a2971d38e9d4d20213bb2a1f174a2fb1'
)
validpgpkeys=('E7ADD9914E260E8B35DFB50665FDE935573ACDA6')
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

  # Install launcher
  install -Dm644 -o root -g http "${srcdir}/launch.py" "${pkgdir}/opt/threema-web/"

  # Install service file
  install -Dm640 -o root -g root "${srcdir}/threema-web.service" "${pkgdir}/etc/systemd/system/"
}

# vim:set ts=2 sw=2 et:
