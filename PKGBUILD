# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-live
pkgver=3.4.2
pkgrel=1
_vdrapi=6
epoch=1
pkgdesc="Adds the possibility to control VDR and some of it's plugins by a web interface."
url="https://github.com/MarkusEh/vdr-plugin-live"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('pcre2' 'tntnet' "vdr-api=${_vdrapi}")
optdepends=('vdr-epgsearch: Manage searchtimers'
            'vdr-streamdev: Stream live TV'
            'ffmpeg: Transcoding video streams')
install="$pkgname.install"
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkusEh/vdr-plugin-live/archive/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('83ffd58472dab4a2b51c7dda8541c2ff1c16938264ba0e243621aac49ccfc797'
            'a14466937a4c618341ca3120bf353ca5b207dda0aca3b605532d3500415d7fea')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="$pkgdir" install

  # Copy resource files
  mkdir -p "$pkgdir/usr/share/vdr/plugins"
  cp -r live "$pkgdir/usr/share/vdr/plugins"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
