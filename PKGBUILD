# Maintainer: Maarten Bezemer <maarten.bezemer@gmail.com>

pkgname=cubbit
pkgdesc='Cubbit desktop-sync application'
pkgver=8.1.0
pkgrel=1
arch=('x86_64')
url='https://www.cubbit.io/'
license=('custom')
depends=('gtk2' 'hicolor-icon-theme' 'libxss' 'libxtst')
options=('!strip')
source=("https://get.cubbit.io/desktop/linux/Cubbit-${pkgver}.AppImage")
sha256sums=('56a2b3646bf31ab9124dff07ab6b1c39f576f9c6886b5502cdc38f667f61c50c')

prepare() {
  chmod +x Cubbit-${pkgver}.AppImage
  ./Cubbit-${pkgver}.AppImage --appimage-extract

  sed -e 's#Exec=AppRun#Exec=@cubbitdesktop#g' squashfs-root/@cubbitdesktop.desktop > @cubbitdesktop.desktop
  sed -e '/^THIS=/i APPDIR=/usr/share/cubbit' squashfs-root/AppRun > AppRun
}

package() {
  install -dm755 "$pkgdir"/usr/share/

  for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 400x400; do
    install -Dm644 "$srcdir"/squashfs-root/usr/share/icons/hicolor/${i}/apps/@cubbitdesktop.png \
                   "$pkgdir"/usr/share/icons/hicolor/$i/apps/@cubbitdesktop.png
  done

  install -Dm755 "$srcdir"/squashfs-root/@cubbitdesktop -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/icudtl.dat -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/chrome* -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/resources.pak -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/lib* -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/snapshot_blob.bin -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/v8_context_snapshot.bin -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/vk_swiftshader_icd.json -t "$pkgdir"/usr/share/cubbit/
  install -Dm644 "$srcdir"/squashfs-root/locales/* -t "$pkgdir"/usr/share/cubbit/locales/
  install -Dm644 "$srcdir"/squashfs-root/resources/* -t "$pkgdir"/usr/share/cubbit/resources
  install -Dm644 "$srcdir"/squashfs-root/swiftshader/* -t "$pkgdir"/usr/share/cubbit/swiftshader/
  
  install -d "$pkgdir"/usr/bin
  install -Dm755 "$srcdir"/AppRun -T "$pkgdir"/usr/bin/@cubbitdesktop
  
  install -Dm644 "$srcdir"/squashfs-root/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 "$srcdir"/squashfs-root/LICENSE.electron.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 "$srcdir"/squashfs-root/LICENSES.chromium.html -t "$pkgdir"/usr/share/licenses/$pkgname

  install -Dm644 "$srcdir"/@cubbitdesktop.desktop -t "$pkgdir"/usr/share/applications
}
