# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Philip Abernethy<chais.z3r0@gmail.com>

pkgname=roundcubemail-plugin-twofactor-git
pkgver=r191.261d14e
pkgrel=1
pkgdesc="Adds two-step verification (TOTP) to the Roundcube login process"
url="https://github.com/alexandregz/twofactor_gauthenticator"
arch=('any')
license=('MIT')
depends=('roundcubemail>=0.9.5')
makedepends=('git')
replaces=('roundcube-twofactor-git')
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/alexandregz/twofactor_gauthenticator.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  _instdir="${pkgdir}"/usr/share/webapps/roundcubemail/plugins/twofactor_gauthenticator
  install -dm755 "${_instdir}"/{localization,PHPGangsta}
  cd "${srcdir}"/${pkgname}
  find . -type f -name '*php*' -exec install -m644 {} "${_instdir}"/{} \;
  find . -type f -name '*js*' -exec install -m644 {} "${_instdir}"/{} \;
  find . -type f -name '*inc' -exec install -m644 {} "${_instdir}"/{} \;
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
