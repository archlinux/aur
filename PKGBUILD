# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=gnome-shell-extension-lockkeys-git
pkgver=r77.76ac557
pkgrel=1
pkgdesc="Lock key state indicator for GNOME Shell."
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-lockkeys"
license=('GPL')
depends=('gnome-shell' 'hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="gschemas.install"
source=("${pkgname%-*}::git+https://github.com/kazysmaster/gnome-shell-extension-lockkeys.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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
  for d in $(find ./lockkeys@vaina.lt -type d)
  do
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/$d"
  done
  for f in $(find ./lockkeys@vaina.lt -type f)
  do
    install -m0644 $f "${pkgdir}/usr/share/gnome-shell/extensions/$f"
  done
}
