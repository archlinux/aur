# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>
# Contributor: Frikilinux <frikilinux at gmail dot com>

pkgname=gnome-shell-extension-appindicator-git
pkgver=15.r2.g0c53cfb
pkgrel=2
pkgdesc="Integrates AppIndicators into GNOME Shell."
arch=('any')
url="https://github.com/rgcjonas/gnome-shell-extension-appindicator"
license=('GPL')
depends=('gnome-shell' 'libappindicator')
makedepends=('git')
options=('!emptydirs')
install="gschemas.install"
source=("${pkgname}::git+https://github.com/rgcjonas/gnome-shell-extension-appindicator.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch}
 sed -i 's#\[\"3.8\", \"3.10\", \"3.12\", \"3.14\"\]#\[\"3.8\", \"3.10\", \"3.12\", \"3.14\", \"3.16\"\]#g' "./metadata.json"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -a "${srcdir}/${pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com"
}

