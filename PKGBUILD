# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=vdr-mp3
pkgname=('vdr-mp3' 'vdr-mplayer')
pkgver=0.10.4
_vdrapi=2.6.3
pkgrel=4
url="https://github.com/vdr-projects/vdr-plugin-mp3"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'libid3tag' 'libmad' 'libsndfile' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-mp3/archive/refs/tags/$pkgver.tar.gz"
        "50-mp3.conf"
        "50-mplayer.conf")
sha256sums=('76c1af908b588b46a18f8f3a0f3db77f5859ef318654a7ee242d7a8e5db1ca2a'
            '20e317563665dde7d87e947199218a8ae818e266dfc8708fd02f183b2e544e10'
            'af37a97a79d9ec79b50d59d45e8f7e0c7660a71090162d69610d13469260d804')

package_vdr-mp3() {
  pkgdesc="Allows playback of MP3 and other audio files."
  _plugname=$(echo $pkgname | sed 's/vdr-//g')
  backup=("var/lib/vdr/plugins/${_plugname}sources.conf"
          "etc/vdr/conf.avail/50-$_plugname.conf")

  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"

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

  cd "$srcdir/vdr-plugin-mp3-$pkgver"

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
