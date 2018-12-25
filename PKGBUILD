# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=vdr-mp3
pkgname=('vdr-mp3' 'vdr-mplayer')
pkgver=0.10.2
_vdrapi=2.4.0
pkgrel=17
url="http://www.muempf.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'libid3tag' 'libmad' 'libsndfile' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.muempf.de/down/$pkgbase-$pkgver.tar.gz"
        'mp3-vdr2.1.2compat.diff'
        "50-mp3.conf"
        "50-mplayer.conf")
md5sums=('66fd37827326776c223a0fdd0ad3811e'
         '8615c6b0f3c5eba39e8e2ce37c5c10a4'
         '16d931040572e628e01a6f6774c8ff27'
         'be1ce6311b271b29306a96ec664c40d4')

prepare() {
  cd "$srcdir/$_plugname-$pkgver"
  patch -p1 -i "$srcdir/mp3-vdr2.1.2compat.diff"
}

package_vdr-mp3() {
  pkgdesc="Allows playback of MP3 and other audio files."
  _plugname=$(echo $pkgname | sed 's/vdr-//g')
  backup=("var/lib/vdr/plugins/${_plugname}sources.conf"
          "etc/vdr/conf.avail/50-$_plugname.conf")
  cd "$srcdir/$_plugname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
       WITHOUT_MPLAYER=1
  install -Dm644 examples/mp3sources.conf.example "$pkgdir/var/lib/vdr/plugins/mp3sources.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

package_vdr-mplayer() {
  pkgdesc="Call MPlayer for playback of video"
  _plugname=$(echo $pkgname | sed 's/vdr-//g')
  backup=("var/lib/vdr/plugins/${_plugname}sources.conf"
          "etc/vdr/conf.avail/50-$_plugname.conf")
  cd "$srcdir/mp3-$pkgver"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
       WITHOUT_MP3=1
  install -Dm644 examples/mp3sources.conf.example "$pkgdir/var/lib/vdr/plugins/mplayersources.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
