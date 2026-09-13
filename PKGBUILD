# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=dankview-git
pkgver=r99.05840ee
pkgrel=1
pkgdesc="Image viewer for DankMaterialShell, inspired by GNOME Loupe."
url="https://github.com/hthienloc/dankapps"
license=('MIT')
depends=('quickshell')
makedepends=('git' 'go' 'make')
arch=('x86_64')
provider=('dankview')
conflicts=('dankview')
source=("${pkgname}::git+https://github.com/hthienloc/dankapps.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}/dankview"

  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  make dev
}

package() {
  cd "${srcdir}/${pkgname}/dankview"
  install -Dm755 "core/bin/dview" "${pkgdir}/usr/bin/dview"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 distro/com.danklinux.dankview.desktop \
    "${pkgdir}/usr/share/applications/com.danklinux.dankview.desktop"
  install -d "${pkgdir}/usr/share/quickshell/dankview"
  cp -rL quickshell/. "${pkgdir}/usr/share/quickshell/dankview"
}
