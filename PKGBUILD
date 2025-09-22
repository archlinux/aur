# Based off of: https://aur.archlinux.org/packages/meshsense-appimage
# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=meshsense-beta-appimage
_pkgname="${pkgname%-appimage}"
_pkgname_stable="${_pkgname%-beta}"
pkgver=1.1.0b8
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
sha512sums=('eba3584e126d3ef7fc2495ad4163da39ed86ad9639613d0a9de40b332d875cc9777bbbace52cfa702d33923f5c77bdc3ee31549efd2f95c887cfcf94af18e9ce'
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
