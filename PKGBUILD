# Maintainer: rcorre <ryan at rcorre.net>

pkgname=godot-blender-exporter-git
pkgver=271.b8b883d
pkgrel=1
pkgdesc="Exporter for Blender, made for the Godot Engine"
arch=('any')
url="https://github.com/godotengine/godot-blender-exporter"
license=('GPL-2.0')
depends=('blender' 'python')
makedepends=('git')
provides=('godot-blender-exporter')
conflicts=('godot-blender-exporter')
source=("$pkgname::git+https://github.com/godotengine/godot-blender-exporter.git")
md5sums=('SKIP')
_blenderver=$(blender -v | head -n1 | cut -f2 -d ' ' | cut -d. -f-2)

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  _addondir="$pkgdir/usr/share/blender/$_blenderver/scripts/addons/io_scene_godot"
  find $srcdir/$pkgname/io_scene_godot/ -mindepth 1 -type d -printf '%P\n' | while read dir;
    do install -dm755 $_addondir/$dir
  done
  find $srcdir/$pkgname/io_scene_godot/ -type f -name '*.py' -printf '%P\n' | while read f;
    do install -Dm644 $srcdir/$pkgname/io_scene_godot/$f $_addondir/$f
  done
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/licenses
  install -Dm644 $srcdir/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/licenses
}
