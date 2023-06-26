# Maintainer: Rudolf Polzer <divVerent at gmail dot com>
# Contributor: FabioLolix

pkgname=aaaaxy
pkgver=1.4.18
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
sha256sums=('b91b4c81e39b90a60ab9558dd701fff708afa8b4c3539354f73ffb7bbf0b9727'
            'f574cd0ddc918f269b94af05f2ece7ac3bbfa4c3bf0ce219107edc536bc923f1')

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
