# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-live
pkgver=3.0.6
epoch=1
_vdrapi=2.4.6
pkgrel=1
pkgdesc="Adds the possibility to control VDR and some of it's plugins by a web interface."
url="https://github.com/MarkusEh/vdr-plugin-live"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('pcre' 'tntnet' "vdr-api=${_vdrapi}")
optdepends=('vdr-epgsearch: Manage searchtimers'
            'vdr-streamdev: Stream live TV'
            'ffmpeg: Transcoding video streams')
install="$pkgname.install"
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkusEh/vdr-plugin-live/archive/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('b7a877db61e35a3d4ea2a13506c62543afaa6498bcc1cf96456cd914e8fe043c'
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
