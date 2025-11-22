# Maintainer: Alfonso Espadero Jr <pixelpantry.shelter185@passmail.net>
pkgname=pixelpantry-git
_pkgname=pixelpantry
pkgver=1.0.1.r0.g0000000
pkgrel=1
pkgdesc="A gamified pixel-art pantry inventory tracker"
arch=('x86_64')
url="https://github.com/AlfEspadero/PixelPantry"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'glib2')
makedepends=('npm' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/AlfEspadero/PixelPantry.git#branch=main"
        "$_pkgname.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "PixelPantry"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "PixelPantry"
  npm install
  npm run build:linux
}

package() {
  cd "PixelPantry"
  
  # Install the unpacked linux build to /opt
  install -d "$pkgdir/opt/$_pkgname"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/$_pkgname/"
  
  # Symlink binary
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/pixelpantry" "$pkgdir/usr/bin/$_pkgname"
  
  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # Install Icon
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # Install Desktop File
  install -Dm644 "../$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
