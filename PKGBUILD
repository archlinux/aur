# Maintainer: sfslinux <sfslinux@gmail.com>
#
# GTK 4 port of EasyPaint, a simple bitmap graphics editor. The sources are
# the gtk4-v$pkgver tag of the easypaint-gtk4 branch of sfs-pra/EasyPaint,
# a fork of idumych/EasyPaint.

pkgname=easypaint-gtk4
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple bitmap graphics editor (GTK 4 port)"
arch=('x86_64')
url="https://github.com/sfs-pra/EasyPaint"
license=('MIT')
depends=('gtk4' 'giflib' 'libwebp')
optdepends=('libcups: printing to CUPS printers')
# Both install /usr/bin/easypaint-gtk; easypaint-gtk is the old local name.
conflicts=('easypaint-gtk' 'easypaint-gtk3')
makedepends=('gettext')
options=('!debug' '!lto')
_tag=gtk4-v$pkgver
source=("EasyPaint-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('ea92e67b0c038d6671850f89fd75dbc5d08b467f36c5fd05b8335c1d348c722d')

build() {
  make -C "$srcdir/EasyPaint-$_tag/gtk" PREFIX=/usr -j"$(nproc)"
}

check() {
  make -C "$srcdir/EasyPaint-$_tag/gtk" PREFIX=/usr test
}

package() {
  make -C "$srcdir/EasyPaint-$_tag/gtk" PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/easypaint-gtk.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=EasyPaint (GTK 4)
GenericName=Bitmap graphics editor
GenericName[ru]=Растровый графический редактор
GenericName[uk]=Растровий графічний редактор
GenericName[de]=Bitmap-Grafikeditor
GenericName[es]=Editor de gráficos de mapa de bits
GenericName[fr]=Éditeur d'images matricielles
GenericName[it]=Editor di grafica raster
GenericName[pl]=Edytor grafiki rastrowej
GenericName[pt_BR]=Editor de imagens bitmap
GenericName[zh_CN]=位图图形编辑器
GenericName[ja]=ビットマップグラフィックエディター
Comment=A simple bitmap graphics editor
Comment[ru]=Простой растровый графический редактор
Comment[uk]=Простий растровий графічний редактор
Comment[de]=Ein einfacher Bitmap-Grafikeditor
Comment[es]=Un editor sencillo de gráficos de mapa de bits
Comment[fr]=Un éditeur simple d'images matricielles
Comment[it]=Un semplice editor di grafica raster
Comment[pl]=Prosty edytor grafiki rastrowej
Comment[pt_BR]=Um editor simples de imagens bitmap
Comment[zh_CN]=一个简单的位图图形编辑器
Comment[ja]=シンプルなビットマップグラフィックエディター
Exec=easypaint-gtk %F
Icon=easypaint-gtk
Terminal=false
Categories=Graphics;2DGraphics;RasterGraphics;
MimeType=image/png;image/jpeg;image/bmp;image/gif;image/tiff;image/webp;image/x-tga;image/x-portable-pixmap;image/vnd.microsoft.icon;
StartupWMClass=easypaint-gtk
EOF

  install -Dm644 "$srcdir/EasyPaint-$_tag/packaging/appimage/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/easypaint-gtk.png"

  install -Dm644 "$srcdir/EasyPaint-$_tag/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/EasyPaint-$_tag/README.ru.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.ru.md"

  install -Dm644 "$srcdir/EasyPaint-$_tag/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
