# Maintainer: Martin Kröning <mkroening@hotmail.de>
pkgname=moodledesktop-bin
_pkgname=${pkgname%-bin}
pkgver=3.8.0
pkgrel=1
pkgdesc="Moodle Desktop is our solution to accessing your Moodle courses on desktop or Surface tablets."
arch=('x86_64' 'i686')
url='https://download.moodle.org/desktop/'
license=('Apache' 'custom: electron' 'custom: chromium')
depends=(gtk3 libegl libgles libxss nss opera-ffmpeg-codecs)
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source_x86_64=("https://download.moodle.org/desktop/linux/$_pkgname-linux-64-v372.tar.gz")
sha512sums_x86_64=('fca4154167e783c0f1ebe581da5723c325611e032ab39871a4d5577bd130cd684367012b0e59858283bd4d52ea9f1e2cda8c742955f654327cde5804d2fe17ff')
sha512sums_i686=('42e1f46a0aaf977a6b1e7bbfa5c5722490a36a2e08855326265146c9156c138da32f8ab31704d4bcef7b7193470f4f0c99cf8e944446b0bb22887b5db5d3483c')
source_i686=("https://download.moodle.org/desktop/linux/$_pkgname-linux-32-v372.tar.gz")

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
