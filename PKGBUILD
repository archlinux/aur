# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
pkgname=biyi-git
pkgver=r147.87be06a
pkgrel=1
pkgdesc="A convenient translation and dictionary app written in Flutter."
arch=('x86_64')
url="https://biyidev.com/"
license=('AGPL')
depends=('gtk3')
makedepends=('git' 'cmake' 'ninja' 'imagemagick' 'clang>=11.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/biyidev/biyi.git"
  "biyi.desktop"
  "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.4-stable.tar.xz")
sha256sums=('SKIP'
  '8020a34eb3368d8aa0109cfd8ae3e8ba74866594fcf6f0e757b1326fafed3180'
  '77900b1ee58d57b64e2c0265c58fa737f21ba7749f31ce3894a006c82e5beed7')

pkgver() {
  cd "$srcdir/biyi"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export
  cd "$srcdir/biyi/apps/biyi_app"
  $srcdir/flutter/bin/flutter build linux
}

package() {
  cd "$srcdir/biyi/apps/biyi_app/build/linux/x64/release/bundle"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r * "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/biyi" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/biyi/apps/biyi_app/resources/images/app_icons/256x256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dm644 "$srcdir/biyi.desktop" -t "$pkgdir/usr/share/applications"
}
