# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=xineliboutput
pkgname=(vdr-xineliboutput xineliboutput-frontends xineliboutput-xineplug)
pkgver=1.1.0.32.gbf166be
_gitver=bf166be4a21c0a86f6852c4695dcdb06863f4e93
_vdrapi=2.2.0
pkgrel=9
url="http://www.sourceforge.net/projects/xineliboutput"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('dbus-glib' 'git' 'glu' 'libcec' 'libextractor' 'libxrandr' 'mesa' "vdr-api=${_vdrapi}" 'xine-lib')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/$_plugname.git#commit=$_gitver"
        'xineliboutput-vdr2.1.6compat.diff'
        'xineliboutput_renamed_iDoubleTapTimeoutMs_in_libcec.diff'
        'xineliboutput-vdr2.1.10compat.diff'
        "50-$_plugname.conf")
md5sums=('SKIP'
         '14ef92cd38503a2f426669aa43b0aeb4'
         'd9e14cb60e536109716ebc886f54880b'
         'de80424deabba49e3f40c2f92f640765'
         'a9a3cd09b950d2024b21a1c6e0620506')

pkgver() {
  cd "${srcdir}/${_plugname}"
  git describe --tags | sed "s/$_plugname.//g;s/_/./g;s/-/./g"
}

prepare() {
  cd "${srcdir}/${_plugname}"
  patch -p1 -i "$srcdir/xineliboutput-vdr2.1.6compat.diff"
  patch -p1 -i "$srcdir/xineliboutput_renamed_iDoubleTapTimeoutMs_in_libcec.diff"
  patch -p1 -i "$srcdir/xineliboutput-vdr2.1.10compat.diff"
}

build() {
  cd "${srcdir}/${_plugname}"
  make
}

package_vdr-xineliboutput() {
  pkgdesc="X11 and Linux framebuffer front-end for VDR"
  depends=('dbus-glib' 'libextractor' 'libxrandr' 'mesa' "vdr-api=${_vdrapi}" 'xine-lib' 'xineliboutput-xineplug')
  optdepends=('nvidia: Required for VDPAU decoding'
              'xorg-server: Required for software decoding')
  backup=("etc/vdr/conf.avail/50-$_plugname.conf"
          "var/lib/vdr/plugins/$_plugname/allowed_hosts.conf")
  cd "${srcdir}/${_plugname}"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/bin"
  rm -r "$pkgdir/usr/lib/xine"
  install -Dm644 examples/allowed_hosts.conf "$pkgdir/var/lib/vdr/plugins/$_plugname/allowed_hosts.conf"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

package_xineliboutput-frontends() {
  pkgdesc="Xineliboutput frontends (vdr-fbfe and vdr-sxfe)"
  depends=('dbus-glib' 'libcec' 'libxrandr' 'mesa' 'xine-lib' 'xineliboutput-xineplug')
  optdepends=('nvidia: Required for VDPAU decoding'
              'xorg-server: Required for software decoding')
  cd "${srcdir}/${_plugname}"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/lib" "$pkgdir/usr/share"
}

package_xineliboutput-xineplug() {
  pkgdesc="Neccessary xine plugins for xineliboutput-frontends and vdr-xineliboutput"
  depends=('xine-lib')
  cd "${srcdir}/${_plugname}"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib/vdr" "$pkgdir/usr/share"
}
