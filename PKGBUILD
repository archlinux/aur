# Maintainer: Zetta1 Reid0

name=thunar
pkgname=$name-csd
pkgver=4.18.10
pkgrel=1
pkgdesc="Modern, fast and easy-to-use file manager for Xfce (Patched with client side decorations)"
conflicts=($name)
provides=($name)
arch=('x86_64')
url="https://docs.xfce.org/xfce/thunar/start"
license=('GPL2' 'LGPL2.1')
groups=('xfce4')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify'
         'pcre2' 'libgudev' 'exo' 'libxfce4util' 'libxfce4ui' 'libpng')
makedepends=('intltool' 'gobject-introspection' 'xfce4-panel')
optdepends=('catfish: file searching'
            'gvfs: trash support, mounting with udisk and remote filesystems'
            'tumbler: thumbnail previews'
            'thunar-volman: removable device management'
            'thunar-archive-plugin: archive creation and extraction'
            'thunar-media-tags-plugin: view/edit ID3/OGG tags')
source=(https://archive.xfce.org/src/xfce/$name/${pkgver%.*}/$name-$pkgver.tar.bz2
        thunar-window.patch)

sha256sums=('e8308a1f139602d8c125f594bfcebb063b7dac1fbb6e14293bab4cdb3ecf1d08'
            '8ac3bd4e19cd7ac467722cf50153bab77f559b6e9737373f83da662453344c06')

prepare() {
  cd $name-$pkgver
  
  # From Zen Kernel Package . Ty guys .
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $name-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gio-unix \
    --enable-gudev \
    --enable-notifications \
    --enable-exif \
    --disable-debug
  make
}

package() {
  cd $name-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
