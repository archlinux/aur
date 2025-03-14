# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=meshsense-appimage
_pkgname="${pkgname%-appimage}"
pkgver=1.0.18
pkgrel=2
pkgdesc="Simple, open-source application that monitors, maps and graphically displays all the vital stats of your area Meshtastic network (AppImage)."
arch=('x86_64')
url="https://affirmatech.com"
license=(GPL-3.0-only)
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
_appimage_src="$_pkgname-$arch.AppImage"
_appimage="$_pkgname-$arch-$pkgver.appimage"
source=("$_appimage::$url/download/meshsense/$_appimage_src"
        "https://raw.githubusercontent.com/Affirmatech/MeshSense/refs/heads/master/LICENSE")
sha512sums=('f1a390862aa212f126752c336ccc59c2c333067f8f95e45d6efdbebe1a28ed1de82ffc5d1ae84a0c17c4dec42b53c01fc99f32430da7a71594ec844866adb96a'
            'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686')

prepare() {
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$_pkgname|"\
    "squashfs-root/$_pkgname.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$_pkgname/$_appimage"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"

  # Desktop file
  install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop"\
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Icon images
  install -dm755 "$pkgdir/usr/share/"
  cp -a "$srcdir/squashfs-root/usr/share/icons" "$pkgdir/usr/share/"

  # Symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_appimage" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
  ln -s "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
