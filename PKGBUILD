# Maintainer: Dave Streng (KR4GCQ) <https://github.com/S7R4nG3/refconnect>
# AUR package: refconnect-git — builds RefConnect from git HEAD.
# Submit to AUR from a checkout of ssh://aur@aur.archlinux.org/refconnect-git.git :
#   makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO && git commit && git push
pkgname=refconnect-git
pkgver=0.14.0.r0.g0000000
pkgrel=1
pkgdesc="D-STAR reflector client (REF/XRF/XLX/DCS) — git version"
arch=('x86_64' 'aarch64')
url="https://github.com/S7R4nG3/refconnect"
license=('MIT')
depends=('libgl' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libxxf86vm' 'wayland' 'libxkbcommon')
makedepends=('git' 'go' 'xorgproto' 'wayland-protocols')
provides=('refconnect')
conflicts=('refconnect' 'refconnect-bin')
source=("${pkgname}::git+https://github.com/S7R4nG3/refconnect.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "${pkgver}"
}

build() {
  cd "${pkgname}"
  export CGO_ENABLED=1 GOFLAGS="-mod=readonly"
  go build -ldflags="-s -w" -o refconnect .
}

package() {
  cd "${pkgname}"
  install -Dm755 refconnect "${pkgdir}/usr/bin/refconnect"
  install -Dm644 configs/refconnect.desktop "${pkgdir}/usr/share/applications/refconnect.desktop"
  install -Dm644 docs/antenna.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/refconnect.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
