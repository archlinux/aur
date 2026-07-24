# Maintainer: AVN Bramg <anvilnu@gmail.com>
pkgname=imago-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Desktop image editor with layers, selection, 55+ effects and local AI (Paint.NET-style)"
arch=('x86_64')
url="https://anvilnu.github.io/Imago/"
license=('GPL3')
# El AppImage empaqueta Qt, Python y sus dependencias; del sistema solo hacen
# falta la caché de iconos y fontconfig para la integración de escritorio.
depends=('hicolor-icon-theme' 'fontconfig')
provides=('imago')
conflicts=('imago')
# Binario ya compilado (PyInstaller): no debe reprocesarse.
options=('!strip')
source=("Imago-${pkgver}-x86_64.AppImage::https://github.com/anvilnu/Imago/releases/download/v${pkgver}/Imago-${pkgver}-x86_64.AppImage")
sha256sums=('7afdec00b54f195292a0ce1fb70e3d83818050f7454bfddf9a419b684bb5e5b4')

package() {
  cd "$srcdir"
  chmod +x "Imago-${pkgver}-x86_64.AppImage"
  "./Imago-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null

  # Aplicación (bundle PyInstaller) en /opt.
  install -d "$pkgdir/opt/imago"
  cp -a squashfs-root/usr/lib/imago/. "$pkgdir/opt/imago/"

  # Lanzador en el PATH (el .desktop usa Exec=imago).
  install -d "$pkgdir/usr/bin"
  ln -s /opt/imago/Imago "$pkgdir/usr/bin/imago"

  # Integración de escritorio: lanzador, icono y metadatos AppStream.
  install -Dm644 squashfs-root/usr/share/applications/io.github.anvilnu.imago.desktop \
    "$pkgdir/usr/share/applications/io.github.anvilnu.imago.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/64x64/apps/io.github.anvilnu.imago.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/io.github.anvilnu.imago.png"
  install -Dm644 squashfs-root/usr/share/metainfo/io.github.anvilnu.imago.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.anvilnu.imago.metainfo.xml"

  # Licencia (viaja dentro del bundle).
  install -Dm644 squashfs-root/usr/lib/imago/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
