# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>

pkgname="gnome-shell-extension-volume-mixer-git"
pkgver=0.9.1.r0.gf289b00
pkgrel=1
pkgdesc="Enable configuration of individual PulseAudio mixers from GNOME Shell's quick settings menu."
arch=('any')
url="https://github.com/aleho/gnome-shell-volume-mixer"
license=('GPL2')
depends=('gnome-shell' 'python')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=gschemas.install
source=("${pkgname%-*}::git+https://github.com/aleho/gnome-shell-volume-mixer.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${pkgname%-*}"
  git checkout ${_branch}
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  msg2 'Locating extension...'
  cd "$(dirname $(find -name 'metadata.json'))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  cp -r --no-preserve=ownership pautils "${_destdir}"
  msg2 'Installing schemas...'
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  msg2 'Installing localization files...'
  (
    cd locale
    for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
  )
}
