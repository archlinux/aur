# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=xineliboutput
pkgname=(vdr-xineliboutput xineliboutput-frontends xineliboutput-xineplug)
pkgver=2.3.0
_gitver=16af8504099ddfbcba75f191d9465130d6eeb56c
_vdrapi=8
pkgrel=4
url="https://www.sourceforge.net/projects/xineliboutput"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-2.0-or-later')
makedepends=('avahi' 'dbus-glib' 'git' 'glu' 'libcec' 'libextractor' 'libxrandr' 'mesa' "vdr-api=${_vdrapi}" 'xine-lib')
source=("$pkgbase::git://git.code.sf.net/p/xineliboutput/git#commit=$_gitver"
        "50-$pkgbase.conf")
sha256sums=('296d2ccaaa584ccf9b0491ebf3a03e7e6333d6a5900a2803119dce38016b0ded'
            'a608928d27df92fb7467ae91da0feaf472254192c84c4af4393a958cc84af919')

pkgver() {
  cd "${srcdir}/$pkgbase"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgbase"
  ./configure
  make
}

package_vdr-xineliboutput() {
  pkgdesc="X11 and Linux framebuffer front-end for VDR"
  depends=('avahi' 'libextractor' 'libbluray' "vdr-api=${_vdrapi}")
  optdepends=('xineliboutput-xineplug: local output device'
              'xineliboutput-frontends: remote output device')
  backup=("etc/vdr/conf.avail/50-$pkgbase.conf"
          "var/lib/vdr/plugins/$pkgbase/allowed_hosts.conf")
  cd "${srcdir}/$pkgbase"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/bin"
  rm -r "$pkgdir/usr/lib/xine"
  install -Dm644 examples/allowed_hosts.conf "$pkgdir/var/lib/vdr/plugins/$pkgbase/allowed_hosts.conf"
  install -Dm644 "$srcdir/50-$pkgbase.conf" "$pkgdir/etc/vdr/conf.avail/50-$pkgbase.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

package_xineliboutput-frontends() {
  pkgdesc="Xineliboutput remote frontends (vdr-fbfe and vdr-sxfe)"
  depends=('libcec' 'xineliboutput-xineplug')
  cd "${srcdir}/$pkgbase"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/lib" "$pkgdir/usr/share"
}

package_xineliboutput-xineplug() {
  pkgdesc="Neccessary xine plugins for remote frontends or local VDR output"
  depends=('dbus-glib' 'libextractor' 'libbluray' 'libxrandr' 'mesa' 'xine-lib')
  optdepends=('nvidia: Required for VDPAU decoding'
              'xorg-server: Required for software decoding')
  cd "${srcdir}/$pkgbase"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/lib/vdr" "$pkgdir/usr/share"
}
