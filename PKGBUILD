# Maintainer: Rudolf Polzer <divVerent at gmail dot com>
# Contributor: FabioLolix

pkgname=aaaaxy
pkgver=1.4.6
pkgrel=1
pkgdesc='A nonlinear puzzle platformer taking place in impossible spaces'
arch=('x86_64')
url="https://github.com/divVerent/$pkgname"
license=('Apache')
depends=('alsa-lib' 'hicolor-icon-theme' 'libglvnd' 'libx11')
# Note: libxcursor libxinerama libxi libxrandr are unused direct dependencies.
# They are referenced at build time, but as no symbols are referenced and the
# external linker is used with --as-needed in Arch's default LDFLAGS, these will
# not actually be linked to by the final binary. This is why these are in
# makedepends but not depends.
makedepends=('go' 'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'make' 'zip')
source=("aaaaxy-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${url}/releases/download/v${pkgver}/sdl-gamecontrollerdb-for-aaaaxy-v${pkgver}.zip")
sha256sums=('d87206d3fa18640bc49dee84b4b1c35e4f1ce7daa9f87edd619b97829c97f6f4'
            '20ae3daa8da6c2791585076e1d147230f8fb99c94035e927936e5ed08a2e320b')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p third_party/SDL_GameControllerDB/assets/input/
  cp ../third_party/SDL_GameControllerDB/assets/input/* third_party/SDL_GameControllerDB/assets/input/
}

build() {
  cd "$pkgname-$pkgver"
  export ADVZIP=:  # Exists only in AUR, so disable for now.
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export AAAAXY_BUILD_USE_VERSION_FILE=true
  make BUILDTYPE=release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 io.github.divverent.$pkgname.metainfo.xml "$pkgdir"/usr/share/metainfo/io.github.divverent.$pkgname.metainfo.xml
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
