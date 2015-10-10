# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>
# Contributor: Frikilinux <frikilinux at gmail dot com>

pkgname=gnome-shell-extension-appindicator-git
pkgver=16.r0.g86cd3a2
pkgrel=1
pkgdesc="Integrates AppIndicators into GNOME Shell."
arch=('any')
url="https://github.com/rgcjonas/gnome-shell-extension-appindicator"
license=('GPL')
depends=('gnome-shell' 'libappindicator' 'python2')
makedepends=('git')
options=('!emptydirs')
install="gschemas.install"
source=("${pkgname}::git+https://github.com/rgcjonas/gnome-shell-extension-appindicator.git")
sha512sums=('SKIP')
_branch=master

pkgver() {
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch} --quiet
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch}
  sed -i 's#\[\"3.8\", \"3.10\", \"3.12\", \"3.14\"\]#\[\"3.8\", \"3.10\", \"3.12\", \"3.14\", \"3.16\"\]#g' "./metadata.json"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -wholename '*schemas/*.xml' \) -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cp -r --no-preserve=ownership,mode indicator-test-tool interfaces-xml "${_destdir}"
}
