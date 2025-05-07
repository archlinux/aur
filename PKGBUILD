# Based off of: https://aur.archlinux.org/packages/meshsense-appimage
# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=meshsense-beta-appimage
_pkgname="${pkgname%-appimage}"
_pkgname_stable="${_pkgname%-beta}"
pkgver=1.1.0b7
pkgrel=1
pkgdesc="Simple, open-source application that monitors, maps and graphically displays all the vital stats of your area Meshtastic network (AppImage)."
arch=('x86_64')
url="https://affirmatech.com"
license=(GPL-3.0-only)
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme')
provides=("$_pkgname_stable")
conflicts=("$_pkgname" "$_pkgname_stable" "$pkgname-bin")
_appimage_src="$_pkgname-$arch.AppImage"
_appimage="$_pkgname-$arch-$pkgver.appimage"
source=("$_appimage::$url/download/meshsense/$_appimage_src"
        "https://raw.githubusercontent.com/Affirmatech/MeshSense/refs/heads/master/LICENSE")
sha512sums=('61d77e24f6271cd762b97e4dea0f92076138cd7a4e8566b23db726ff2b44b74b0c8ed5794f1fc372cdb7c35afb0cf1c6f5d84df46d401c39f18686c2f37912e2'
            'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686')

prepare() {
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$_pkgname|"\
    "squashfs-root/$_pkgname_stable.desktop"
  sed -i -E "s|Name=MeshSense|Name=MeshSense Beta|" "squashfs-root/$_pkgname_stable.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$_pkgname/$_appimage"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"

  # Desktop file
  install -Dm644 "$srcdir/squashfs-root/$_pkgname_stable.desktop"\
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
