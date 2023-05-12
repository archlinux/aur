# Maintainer: revelation60 <benruyl@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=gnome-shell-extension-gtile-git
pkgver=51.r20.gf19decf
pkgrel=3
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
  bazel --output_user_root="$srcdir/bazel-cache" build :dist
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou"
#  bsdtar -xvf bazel-bin/install-extension.runfiles/gtile/dist.tar.gz -C \
#    "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou/"

  # Temporary workaround for tarball not being copied properly from cache
  cd $srcdir/bazel-cache
  _tarball=$(find -name dist.tar.gz)
  bsdtar -xvf "${_tarball}" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou/"
}
