# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=dankvideo-git
pkgver=r99.05840ee
pkgrel=1
pkgdesc="Fast, beautiful Material 3 Video Player built for Linux and the DankMaterialShell ecosystem, inspired by GNOME Showtime."
url="https://github.com/hthienloc/dankapps"
license=('MIT')
depends=('quickshell')
makedepends=('git' 'go' 'make')
arch=('x86_64')
provider=('dankvideo')
conflicts=('dankvideo')
source=("${pkgname}::git+https://github.com/hthienloc/dankapps.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}/dankvideo"

  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  make dev
}

package() {
  cd "${srcdir}/${pkgname}/dankvideo"
  install -Dm755 "core/bin/dplay" "${pkgdir}/usr/bin/dplay"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 distro/com.danklinux.dankvideo.desktop \
    "${pkgdir}/usr/share/applications/com.danklinux.dankvideo.desktop"
  install -d "${pkgdir}/usr/share/quickshell/dankvideo"
  cp -rL quickshell/. "${pkgdir}/usr/share/quickshell/dankvideo"
}
