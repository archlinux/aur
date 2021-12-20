# Maintainer: revelation60 <benruyl@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=gnome-shell-extension-gtile-git
pkgver=48.r0.g0416a80
pkgrel=2
pkgdesc="A window tiling extension for GNOME"
arch=('any')
url="https://github.com/gTile/gTile"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git' 'bazel' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/gTile/gTile.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  bazel --output_user_root="$srcdir/bazel-cache" build :install-extension
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou"
  bsdtar -xvf bazel-bin/install-extension.runfiles/gtile/dist.tar.gz -C \
    "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou/"

  install -Dm644 schemas/org.gnome.shell.extensions.gtile.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou/schemas/"
}
