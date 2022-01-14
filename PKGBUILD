# Maintainer: Rudolf Polzer <divVerent at gmail dot com>
# Contributor: FabioLolix

pkgname=aaaaxy
pkgver=1.0.187
pkgrel=4
pkgdesc='A nonlinear puzzle platformer taking place in non-Euclidean geometry'
arch=('x86_64')
url="https://github.com/divVerent/$pkgname"
license=('Apache')
depends=('alsa-lib' 'libglvnd' )
makedepends=('git' 'go' 'graphviz' 'imagemagick' 'make' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi')
source=("git+$url#tag=v$pkgver"
        "git+https://github.com/gabomdq/SDL_GameControllerDB.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config 'submodule.third_party/SDL_GameControllerDB/assets/input/SDL_GameControllerDB.url' "${srcdir}/SDL_GameControllerDB"
  git submodule update
}

build() {
  cd "$pkgname"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make BUILDTYPE=release
}

package() {
  cd "$pkgname"
  install -Dm644 io.github.divverent.$pkgname.metainfo.xml "$pkgdir"/usr/share/metainfo/io.github.divverent.$pkgname.metainfo.xml
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
