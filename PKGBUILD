# Maintainer: Hocking Lee <hockinglee@gmail.com>
# Based on the official file-roller package by Jan Alexander Steffens,
# Fabian Bornschein and Jan de Groot.

pkgname=file-roller-cn
_pkgname=file-roller
pkgver=44.7
pkgrel=1
pkgdesc='GNOME archive manager with GBK/GB2312/GB18030 ZIP filename support'
arch=(x86_64)
url='https://aur.archlinux.org/packages/file-roller-cn'
license=(GPL-2.0-or-later)
depends=(
  dconf
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  json-glib
  libadwaita
  'libarchive>=3.2.0'
  libgcc
  libnautilus-extension
  pango
)
makedepends=(glib2-devel meson yelp-tools zlib)
optdepends=(
  '7zip: 7z archive support'
  'arj: arj archive support'
  'binutils: ar archive support'
  'bzip3: bzip3 compression support'
  'cdrtools: ISO image support'
  'cpio: cpio archive support'
  'dpkg: deb archive support'
  'lhasa: LHA/LZA archive support'
  'lrzip: lrzip compression support'
  'rpmextract: rpm archive support'
  'squashfs-tools: squashfs image support'
  'unace: ACE archive support'
  'unrar: better RAR archive support'
  'zip: additional ZIP archive support'
  'unzip: additional ZIP archive support'
)
provides=("file-roller=$pkgver")
conflicts=(file-roller)
options=(!debug)
source=(
  "https://download.gnome.org/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz"
  '0001-support-chinese-zip-filenames.patch'
)
sha256sums=('67cada96a2409c859f378e82fbe868b0e9c00a69e6b7b885d542c64ea2a1297d'
            'e6af662afef3bce4ab65721320ea921df37e441024c45c7362cdc07098486bf6')

prepare() {
  patch -d "$_pkgname-$pkgver" -Np1 -i "$srcdir/0001-support-chinese-zip-filenames.patch"
}

build() {
  arch-meson "$_pkgname-$pkgver" build -Dlibarchive=enabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgname-$pkgver/README.cn.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.cn.md"
}
