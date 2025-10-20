# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributors:
# Siavash Askari Nasr <ciavash@proton.me>
# Vladimir Svyatski <vsvyatski@yandex.ru>
# Dimitris Kiziridis <ragouel@outlook.com>
# EatMyVenom <eat.my.venomm@gmail.com>
# Uncle Hunto <unclehunto@yahoo.com>
# Limao Luo <luolimao+AUR@gmail.com>
# TuxSpirit <tuxspirit@archlinux.fr>
# Jamesjon <universales@protonmail.com>

pkgname=peazip-qt-bin
pkgver=10.7.0
pkgrel=1
pkgdesc='PeaZip file manager and archiver (binary release)'
url='https://github.com/peazip/PeaZip'
license=('LGPL-3.0-or-later')
arch=('x86_64')
depends=('7zip' 'brotli' 'hicolor-icon-theme' 'libx11' 'qt6pas' 'upx' 'zstd')
optdepends=('zpaq: install to use the system version')
options=('!emptydirs')
provides=("pea" "peazip")
conflicts=("pea" "peazip")
source=("$url/releases/download/$pkgver/peazip-$pkgver.LINUX.Qt6-1.x86_64.rpm")
sha256sums=('550675d1a21c45e1496c685a2db073def986e158fa492fc22c4254e02df7d775')

prepare() {
# Cleanup
  cd usr/share/peazip
  rm -r lang-wincontext
  rm -r batch/{Windows,'macOS service menus',bat}
  rm -r batch/freedesktop_integration/KDE-servicemenus/{KDE3*,KDE4*}
# Use system libraries instead of bundled
  cd "$srcdir/usr/lib/peazip/res/bin"
  mkdir -p upx
  ln -sf /usr/bin/7z 7z/7z
  ln -sf /usr/lib/7zip/7zCon.sfx 7z/7zCon.sfx
  ln -sf /usr/bin/brotli brotli/brotli
  ln -sf /usr/bin/upx upx/upx
  ln -sf /usr/bin/zstd zstd/zstd
  rm 7z/7z.sfx
  chmod -x 7z/Codecs/*.so
 # Detect zpaq
if pacman -Qi zpaq &> /dev/null; then
    ln -sf /usr/bin/zpaq zpaq/zpaq
else
    # Do nothing
    :
fi
}

package() {
  mkdir -p "$pkgdir/usr/"{bin,lib/peazip,share/licenses/peazip}
  cd usr
  install -Dm755 lib/peazip/{pea,peazip} -t "$pkgdir/usr/lib/peazip"
  mv lib/peazip/res "$pkgdir/usr/lib/peazip"
  cd share
  install -Dm644 applications/peazip.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 peazip/icons/*.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  cd peazip
  rm -dr icons
  install -Dm644 peazip_help.pdf -t "$pkgdir/usr/share/doc/peazip"
  rm peazip_help.pdf
  mv copying "$pkgdir/usr/share/licenses/peazip"
  install -Dm644 readme/readme_Linux.txt "$pkgdir/usr/share/doc/peazip/readme.txt"
  rm -dr readme
  mv ../peazip "$pkgdir/usr/share"
  ln -s /usr/lib/peazip/{pea,peazip} "$pkgdir/usr/bin"
}
