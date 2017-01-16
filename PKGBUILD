# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=xineliboutput
pkgname=(vdr-xineliboutput xineliboutput-frontends xineliboutput-xineplug)
pkgver=1.1.0.55.g9027ea1
_gitver=9027ea1737b966386916da27207e8bf92f24cfe0
_vdrapi=2.2.0
pkgrel=3
url="http://www.sourceforge.net/projects/xineliboutput"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('dbus-glib' 'git' 'glu' 'libextractor' 'libxrandr' 'mesa' "vdr-api=${_vdrapi}" 'xine-lib')
_plugname=${pkgname//vdr-/}
source=("git://git.code.sf.net/p/xineliboutput/git#commit=$_gitver"
        'xineliboutput_fix_vdrversion_check.diff'
        "50-$_plugname.conf")
md5sums=('SKIP'
         'd1f1c591b9f927fd0b86e7ff19c09951'
         'c3b2b26732606b4f95ca95cea6ce2084')

pkgver() {
  cd "${srcdir}/git"
  git describe --tags | sed "s/$_plugname.//g;s/_/./g;s/-/./g"
}

prepare() {
  cd "${srcdir}/git"
  patch -p1 -i "$srcdir/xineliboutput_fix_vdrversion_check.diff"
}

build() {
  cd "${srcdir}/git"
  ./configure --disable-libcec
  make
}

package_vdr-xineliboutput() {
  pkgdesc="X11 and Linux framebuffer front-end for VDR"
  depends=("vdr-api=${_vdrapi}" 'libextractor' 'libbluray')
  optdepends=('xineliboutput-xineplug: local output device'
              'xineliboutput-frontends: remote output device')
  backup=("etc/vdr/conf.avail/50-$_plugname.conf"
          "var/lib/vdr/plugins/$_plugname/allowed_hosts.conf")
  cd "${srcdir}/git"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/bin"
  rm -r "$pkgdir/usr/lib/xine"
  install -Dm644 examples/allowed_hosts.conf "$pkgdir/var/lib/vdr/plugins/$_plugname/allowed_hosts.conf"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

package_xineliboutput-frontends() {
  pkgdesc="Xineliboutput remote frontends (vdr-fbfe and vdr-sxfe)"
  depends=('xineliboutput-xineplug')
  cd "${srcdir}/git"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/lib" "$pkgdir/usr/share"
}

package_xineliboutput-xineplug() {
  pkgdesc="Neccessary xine plugins for remote frontends or local VDR output"
  depends=('dbus-glib' 'libextractor' 'libbluray' 'libxrandr' 'mesa' 'xine-lib')
  optdepends=('nvidia: Required for VDPAU decoding'
              'xorg-server: Required for software decoding')
  cd "${srcdir}/git"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib/vdr" "$pkgdir/usr/share"
}
