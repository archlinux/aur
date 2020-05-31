# Maintainer: Martin Rys <rys.pw/#contact_me>
pkgname=jitsi-meet-git
pkgver=r7411.a31f3c0c7
pkgrel=2
epoch=
pkgdesc="WebRTC JavaScript video conferences"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-meet"
license=("Apache")
groups=()
depends=()
# Python 2 issue - https://github.com/jitsi/jitsi-meet/issues/6427
makedepends=("npm"
             "git"
             "python2")
checkdepends=()
optdepends=("jicofo"
            "jitsi-videobridge"
            "nginx"
            "prosody")
provides=("jitsi-meet")
conflicts=("jitsi-meet")
replaces=()
backup=("opt/jitsi-meet/config.js"
        "opt/jitsi-meet/interface_config.js"
        "opt/jitsi-meet/logging_config.js")
options=()
install=
changelog=
source=($pkgname::git+https://github.com/jitsi/jitsi-meet)
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  npm install
  make
  # Hack https://github.com/jitsi/jitsi-meet/pull/6925
  for c in $(ls node_modules/i18n-iso-countries/langs); do
    cp node_modules/i18n-iso-countries/langs/${c} lang/countries-${c}
  done
  make source-package
  tar xvfj jitsi-meet.tar.bz2
}

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/jitsi-meet-git/jitsi-meet/" "${pkgdir}/opt/jitsi-meet"
}
