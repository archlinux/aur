# Maintainer: revelation60 <benruyl@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=gnome-shell-extension-gtile-git
pkgver=51.r17.ga252d2b
pkgrel=2
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

build() {
  cd "$srcdir/${pkgname%-git}"
  bazel --output_user_root="$srcdir/bazel-cache" build :install-extension
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou"
#  bsdtar -xvf bazel-bin/install-extension.runfiles/gtile/dist.tar.gz -C \

  # Temporary workaround for tarball not being copied properly from cache
  bsdtar -xvf "$srcdir/bazel-cache/0b5fc7d4bbd34f8962010e75d3c172c0/execroot/_main/bazel-out/k8-fastbuild/bin/dist.tar.gz" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou/"
}
