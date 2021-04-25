# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ludo
pkgver=0.12.8
pkgrel=1
pkgdesc="Ludo is a minimalist frontend for emulators"
arch=('x86_64' 'armv7h')
url="https://github.com/libretro/ludo"
license=('GPL3')
makedepends=(
  'go'
  'git'
  'wget'
)
depends=(
  'glfw'
  'openal'
  'mesa'
)
source=(
  "git+https://github.com/libretro/ludo"
  "ludo.toml"
  "ludo.desktop"
)
sha256sums=(
  'SKIP'
  'c7ee8acced118b64c6edd54260bc31a976ef551337dcf57d2e45cbfafbe8c84b'
  '139eedd5dd868717b46032cd9773bc63b692237c37e6da4450357a3f56a18042'
)

prepare() {
  cd "${srcdir}/ludo"
  git checkout v${pkgver}
  git submodule update --init --recursive
}

package() {
  _ARCH=""

  if [ $arch == "armv7h" ]; then
    _ARCH="arm"
  else
    _ARCH="$arch"
  fi

  install -Dm644 "ludo.toml" "$pkgdir/etc/ludo.toml"
  install -Dm644 "ludo.desktop" "$pkgdir/usr/share/applications/ludo.desktop"

  cd "${srcdir}/ludo"

  ARCH="${_ARCH}" OS="Linux" make tar

  install -Dm755 "ludo" "$pkgdir/usr/bin/ludo"
  install -Dm755 "assets/icon.svg" "$pkgdir/usr/share/pixmaps/ludo.svg"
  install -dm755 "$pkgdir/usr/share/ludo"
  cp -R "assets/" "$pkgdir/usr/share/ludo/assets"
  cp -R "cores/" "$pkgdir/usr/share/ludo/cores"
  cp -R "database/" "$pkgdir/usr/share/ludo/database"
  chmod -R 0755 "$pkgdir/usr/share/ludo"

  make clean
}
