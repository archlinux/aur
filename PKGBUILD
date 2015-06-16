# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname='vdr-skindesigner'
pkgver=0.5.3
_vdrapi=2.2.0
pkgrel=1
  pkgdesc="Highly customizable native true color skin for the Video Disc Recorder"
url="http://projects.vdr-developer.org/projects/skin-nopacity"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('git' 'librsvg' 'ttf-opensans' 'unzip' "vdr-api=${_vdrapi}" 'wget')
optdepends=('vdr-scraper2vdr: To display scraped images in various EPG views (requires epgd)'
            'vdr-tvscraper: To display scraped images in various EPG views')
conflicts=(skindesigner-{blackhole,holo,metrixhd,nopacity,shady,shady_kiss,skinelchi,tryouts})
replaces=(skindesigner-{blackhole,holo,metrixhd,nopacity,shady,shady_kiss,skinelchi,tryouts})
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/git/vdr-plugin-skindesigner.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2"
        '99-skindesigner.conf'
        "50-$_plugname.conf")
install="$pkgname.install"
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
md5sums=('88351cc2a1a3b1a9ebe77a311f708056'
         '04a647458ad789613e2df77f3846d724'
         'ebc6537bf0d3e604c59884ec408f7e9c')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install

  mkdir -p "$pkgdir/var/lib/vdr/plugins/skindesigner/"
  ln -s /usr/share/vdr/plugins/skindesigner/dtd "$pkgdir/var/lib/vdr/plugins/skindesigner/dtd"

  install -Dm644 "$srcdir/99-skindesigner.conf" "$pkgdir/etc/fonts/conf.avail/99-skindesigner.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  cd "$pkgdir/usr/lib/vdr/plugins/skindesigner/scripts"
  mv temperatures.default temperatures
  rm README temperatures.*

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

