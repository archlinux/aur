# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgbase=rhythmcat
pkgname=rhythmcat
true && pkgname=(rhythmcat rhythmcat-plugins rhythmcat-plugins-extra)
pkgver=1.0.1.1
pkgrel=2
_pkgname=RhythmCat
_pkgver=1.0.1-1
pkgdesc="A Audio Player in GTK3 with plug-in support"
arch=('i686' 'x86_64')
url="https://code.google.com/p/rhythmcat/"
license=('GPL')
makedepends=('gtk-doc' 'gtksourceview3' 'gendesk')
depends=('gtk3' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'dbus-glib')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${_pkgname}-${_pkgver}_Source.tar.bz2)
sha256sums=('baac929234d328392ebe2761faea6e9c0efa6bb49c3b77e836771ebd81e515f9')

_plugins_base=(desktop-lyric lyric-show music-locator notify)
_plugins_extra=(lyric-crawler lyric-editor tageditor)

prepare() {
  gendesk -n -f \
    --pkgname="${_pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --genericname="RhythmCat Music Player" \
    --categories="AudioVideo;Player;GTK" \
    --mimetypes='application/x-ogg;application/ogg;audio/x-vorbis+ogg;audio/x-scpls;audio/x-mp3;audio/x-mpeg;audio/mpeg;audio/x-mpegurl;audio/x-flac'
}

build() {
  cd ${_pkgname}-${_pkgver}

  ./configure \
    --prefix=/usr \
    --enable-gtk3 

  make

  for i in "${_plugins_base[@]}"; do
    make --makefile=Makefile3 -C plugins/base/$i
  done

  for i in "${_plugins_extra[@]}"; do
    make --makefile=Makefile3 -C plugins/extra/$i
  done
}

check() {
  cd ${_pkgname}-${_pkgver}
  make check
}

package_rhythmcat() {
  pkgdesc="A Audio Player in GTK3"
  optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
              'gstreamer0.10-bad-plugins: Extra media codecs'
              'gstreamer0.10-ffmpeg: Extra media codecs'
              'rhythmcat-plugins: Base plugins'
              'rhythmcat-plugins-extra: Extra plugins')

  install -dm755 "$pkgdir"/usr/share/{applications,pixmaps}/
  install -m 644 ${_pkgname}.desktop "$pkgdir/usr/share/applications/"

  cd ${_pkgname}-${_pkgver}
  make DESTDIR="$pkgdir/" install

  ln -s ../RhythmCat/images/RhythmCat_128x128.PNG \
    "$pkgdir"/usr/share/pixmaps/${_pkgname}.png
}

package_rhythmcat-plugins() {
  pkgdesc="Base plugins for RhythmCat"
  depends=(rhythmcat gtksourceview3)

  cd ${_pkgname}-${_pkgver}

  for i in "${_plugins_base[@]}"; do
    make INSTALL_DIR="$pkgdir/usr/share/RhythmCat/plugins/$i" -C plugins/base/$i install
  done
}

package_rhythmcat-plugins-extra() {
  pkgdesc="Extra plugins for RhythmCat"
  depends=(rhythmcat)

  cd $srcdir/${_pkgname}-${_pkgver}

  for i in "${_plugins_extra[@]}"; do
    make INSTALL_DIR="$pkgdir/usr/share/RhythmCat/plugins/$i" -C plugins/extra/$i install
  done
}


# AUR:
pkgdesc="A Audio Player in GTK3 with plug-in support"
depends=('gtk3' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'dbus-glib')

# vim:set ts=2 sw=2 et:
