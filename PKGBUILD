# Maintainer: revelation60 <benruyl@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=gnome-shell-extension-gtile-git
pkgver=52.r0.gf19decf
pkgrel=1
pkgdesc="A window tiling extension for GNOME"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL2')
depends=('gnome-shell')
makedepends=('bazel' 'git' 'pnpm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/gTile/gTile.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Ignore Bazel version requirement
  rm -f .bazelversion
}

build() {
  cd "$srcdir/${pkgname%-git}"
  bazel build :install-extension
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou"
  bsdtar -xvf bazel-bin/install-extension.runfiles/_main/dist.tar.gz -C \
    "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou/"
}
