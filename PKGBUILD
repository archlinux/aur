# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=homebridge-git
_gitname=homebridge
pkgver=0.4.53.r9.g8a2a122
pkgrel=1
pkgdesc="HomeKit support for the impatient"
arch=('any')
url="https://github.com/nfarina/homebridge"
license=('apache')
depends=('nodejs>=4.3.2' 'avahi')
makedepends=(
  'git'
  'npm'
  'python' # Needed for node-gyp for building native modules
)
provides=('homebridge')
conflicts=('homebridge')
options=(!emptydirs)
source=(
  "git+${url}.git"
  "${_gitname}-system.service"
  "${_gitname}-user.service"
  "${_gitname}.install"
)
sha512sums=('SKIP'
            '56eb3b04e0a84753b98cfd91a2f3b96d33e20639e3b38faa1c0388fcf55025ea8776efee6723b61b2ad8bc55689708f2fce5f6387eb3e23429b9feac44e521d1'
            'b9ea4a2597b54eb3bfa427d48bb5bb807c4b629bd07c73501a3778fcc8ddbc4cba3f1557f55fc76d40d5085cf73e54b11cc631d1962814641a17242487440468'
            'de43f228bdfbf88ec92adaa46a32c772c6bb1f265899d56c4e9a70b2e9bd3381f45be0345b1bd55e8ec2f3b61fa1f903d823162293464b3e1b43aab8b772b6dd')

install="${_gitname}.install"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"

  # Fix error with npm5 issue
  tar -czf homebridge.tar.gz homebridge
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_gitname}"
  npm install --cache ../cache --user root -g --prefix "${pkgdir}/usr" ../*.tar.gz
  
  [ -z "$HOMEBRIDGE_KEEP_GIT_HISTORY" ] && rm -rf "${pkgdir}/usr/lib/node_modules/${_gitname}/.git"

  install -D -m644 "${srcdir}/${_gitname}-system.service" "$pkgdir/usr/lib/systemd/system/${_gitname}.service"
  install -D -m644 "${srcdir}/${_gitname}-user.service" "$pkgdir/usr/lib/systemd/user/${_gitname}.service"
}

# vim:set ts=2 sw=2 et:
