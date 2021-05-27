# Author: Hunter Wittenborn <hunter@hunterwittenborn.com>
# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>

pkgname=makedeb-alpha
pkgver=2.8.0
pkgrel=1
pkgdesc="Create Debian archives from PKGBUILDs (alpha release)"
arch=('any')
depends=('pacman' 'dpkg')
license=('GPL3')
url="https://github.com/hwittenborn/makedeb"

source=("https://repo.hunterwittenborn.com/debian/makedeb/pool/m/makedeb-alpha/makedeb-alpha_${pkgver}-${pkgrel}_all.deb")
sha256sums=('SKIP')

package() {
  # Extract Debian package
  tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"

  # Normal setup - same as in Debian PKGBUILD
  sed -i "s|FUNCTIONS_DIR=.*|FUNCTIONS_DIR=/usr/lib/makedeb/|" "${pkgdir}"/usr/bin/makedeb
  sed -i "s|DATABASE_DIR=.*|DATABASE_DIR=/usr/lib/makedeb-db/|" "${pkgdir}"/usr/bin/makedeb

  # Disable auto install functionality as Arch doesn't use APT
  sed -i 's|${INSTALL}|INSTALL|' "${pkgdir}"/usr/bin/makedeb
  sed -i 's|INSTALL=.*|echo "APT is required for auto installation functionality, and has thus been disabled."; exit 1 ;;|' \
    "${pkgdir}"/usr/lib/makedeb/functions/arg_check.sh
  sed -i 's|  echo "  -I,.*"||' "${pkgdir}"/usr/lib/makedeb/functions/help.sh
}
