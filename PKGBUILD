# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=fast64
pkgver=2.5.3
pkgrel=1
pkgdesc='Blender based editor for scenes, meshes, and more in first-party N64 games'
arch=(any)
url='https://github.com/Fast-64/fast64'
license=(GPL-3.0-only)
depends=(blender python)
makedepends=(git)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  blender_manifest.toml.template
)
sha512sums=('7421c8f4313a2c268d6dba5e41b2f2820f930202009bd510e1d42b8d6c3a61cd7b4150a28ba421ede589d0e6b6f0679bd135cebff2b46e7e7244f0962b3bdcf1'
            'f24a30ca6d01b1d9c897bfcaf1215608728a1d3a24b14a1a9d79bbc252dd40bc972ebddd8b37ac404777ef205ec19b20142757618528ea6cc6d9c87e7b8f3873')
b2sums=('71d9b7604b02c6e69804adeea07b6c0b9018fdd36cfd41e700e05d49c6d36ab5d1ec4664088e327f8b03ded50a18280f1178516cdfc3a08b544dfd279dd12334'
        'a6a321f5fc41aea1c13cd83eba867c56f7ebec66d11243efcbbef5ec6e5290814b6da2c4be0d4ccbc7da14e6d89d2abddafca867829daefb5ac3254874ecf593')

package() {
  cd "$pkgname"

  local blender_version=$(pacman -Sddp --print-format %v blender | grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  local addons_directory="${pkgdir}/usr/share/blender/${blender_version}/scripts/addons/fast64"

  install -vd "$addons_directory"

  install -vDm644 -t "$addons_directory" ./*.py
  cp -vr fast64_internal "$addons_directory"

  sed -e "s/@pkgver@/$pkgver/" "$srcdir/blender_manifest.toml.template" > "${addons_directory}/blender_manifest.toml"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr images scripts "$pkgdir/usr/share/doc/$pkgname"
}
