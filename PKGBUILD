# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=yafaray-blender-exporter-git
pkgver=540.9183932
_blendver=2.76
pkgrel=1
pkgdesc="Blender exporter for YafaRay"
arch=('i686' 'x86_64')
url="http://www.yafaray.org/"
license=('LGPL2.1')
depends=('blender' 'yafaray-git')
makedepends=('git' 'perl')
provides=('yafaray-blender-exporter')
conflicts=('yafaray-blender-exporter')
#source=('exporter::git+git://github.com/YafaRay/Blender-Exporter.git')
source=('exporter::git+git://github.com/DavidBluecame/Blender-Exporter.git#branch=experimental')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/exporter"
  echo $(git rev-list --count experimental).$(git rev-parse --short experimental)
}

package() {
  # install the exporter
  cd "$srcdir/exporter"
  git checkout-index -a -f --prefix="$pkgdir/usr/share/blender/$_blendver/scripts/addons/yafaray/"

  # fix the bin path so the plugin is able to find the libraries
  sed -i 's|^BIN_PATH = .*|BIN_PATH = "/usr/lib"|' "$pkgdir/usr/share/blender/$_blendver/scripts/addons/yafaray/__init__.py"

  # fix the library names
  perl -pi -e "s|\.so\..*?'|.so'|g" "$pkgdir/usr/share/blender/$_blendver/scripts/addons/yafaray/__init__.py"
  sed -i "s|libpng12|libpng|" "$pkgdir/usr/share/blender/$_blendver/scripts/addons/yafaray/__init__.py"
}

# vim:set ts=2 sw=2 et:
