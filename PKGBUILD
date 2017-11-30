# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=homebridge-git
_gitname=homebridge
pkgver=0.4.32.r1.gb670ec1
pkgrel=1
pkgdesc="HomeKit support for the impatient"
arch=('any')
url="https://github.com/nfarina/homebridge"
license=('apache')
depends=('nodejs>=4.3.2' 'avahi')
makedepends=('git' 'npm')
provides=('homebridge')
conflicts=('homebridge')
options=(!emptydirs)
source=(
  "git+${url}.git"
  "${_gitname}-system.service"
  "${_gitname}-user.service"
  "${_gitname}.install"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

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

  install -D -m644 "${srcdir}/${_gitname}-system.service" "$pkgdir/usr/lib/systemd/system/${_gitname}.service"
  install -D -m644 "${srcdir}/${_gitname}-user.service" "$pkgdir/usr/lib/systemd/user/${_gitname}.service"
}

# vim:set ts=2 sw=2 et:
