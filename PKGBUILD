# Maintainer: Martin Kröning <mkroening@hotmail.de>
pkgname=moodledesktop-bin
_pkgname=${pkgname%-bin}
pkgver=3.8.0
pkgrel=2
pkgdesc="Moodle Desktop is our solution to accessing your Moodle courses on desktop or Surface tablets."
arch=('x86_64' 'i686')
url='https://download.moodle.org/desktop/'
license=('Apache' 'custom: electron' 'custom: chromium')
depends=(gtk3 libegl libgles libxss nss opera-ffmpeg-codecs)
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source_x86_64=("https://download.moodle.org/desktop/linux/$_pkgname-linux-64-v380.tar.gz")
sha512sums_x86_64=('63206445d1a9d8af28c29e2f45a92f031671191b255b3c24ebb2c552b63b73b7317f75ad8366888b24e5225e496347e226f087d13bba6209fb665543d1f827b1')
sha512sums_i686=('d3e99545438e6c60c8341999772f5652ad980a141faf5424cc31b1716a7a55c74d34fc40d69c3544b431efa8fc9b786508465e2234354212fb858089c224d52b')
source_i686=("https://download.moodle.org/desktop/linux/$_pkgname-linux-32-v380.tar.gz")

if [ ${CARCH} = i686 ]; then
  _APPIMAGE_ARCH=ia32
else
  _APPIMAGE_ARCH=x64
fi

prepare() {
  ./linux-$_APPIMAGE_ARCH.AppImage --appimage-extract
  cd squashfs-root

  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" $_pkgname.desktop
  echo 'Path=/usr/bin' >> $_pkgname.desktop
}

package() {
	cd "$srcdir/squashfs-root"

  install -d "$pkgdir"/opt/$_pkgname
  cp -a . "$pkgdir"/opt/$_pkgname
  chmod -R 755 "$pkgdir"/opt/$_pkgname

  rm -r "$pkgdir"/opt/$_pkgname/usr/lib

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  ln -s /opt/$_pkgname/$_pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  ln -s /opt/$_pkgname/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

  # Replacement symlinks
  ln -sf /usr/lib/opera/lib_extra/libffmpeg.so "$pkgdir"/opt/$_pkgname/libffmpeg.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$_pkgname/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$_pkgname/libGLESv2.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$_pkgname/swiftshader/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$_pkgname/swiftshader/libGLESv2.so

  # Licenses
  install -Dm 644 LICENSE.electron.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.electron.txt
  install -Dm 644 LICENSES.chromium.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSES.chromium.html
}
