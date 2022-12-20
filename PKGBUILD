# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname='vdr-skindesigner'
pkgver=1.2.19
_vdrapi=2.6.3
pkgrel=1
pkgdesc="Highly customizable native true color skin for the Video Disc Recorder"
url="https://gitlab.com/kamel5/skindesigner"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('git' 'librsvg' 'ttf-opensans' 'unzip' "vdr-api=${_vdrapi}" 'wget')
optdepends=('vdr-scraper2vdr: To display scraped images in various EPG views (requires epgd)'
            'vdr-tvscraper: To display scraped images in various EPG views')
conflicts=(skindesigner-{blackhole,holo,metrixhd,nopacity,shady,shady_kiss,skinelchi,tryouts})
replaces=(skindesigner-{blackhole,holo,metrixhd,nopacity,shady,shady_kiss,skinelchi,tryouts})
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/kamel5/skindesigner/-/archive/$pkgver/skindesigner-$pkgver.tar.bz2"
        '99-skindesigner.conf'
        "50-$_plugname.conf")
install="$pkgname.install"
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
sha256sums=('6f613fae89c430cbde1c719189ffccdcfb225e48deffb2bee8705e289287db06'
            '25c1359cb6c61c3e7ebd6738fce6c21fa21f62ea4f274a522c30015210c3f4e5'
            'dcd2381d49d79bbfbf9cd2a7bdd5ec24c1fc2c00b4e8e58b68c9afc874f6650e')

#prepare() {
#  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
#  sed -i 's/libskindesigner/..\/libskindesigner/' extensions/pluginmanager.h
#}

build() {
  cd "${srcdir}/$_plugname-$pkgver"
#  export DEFINES="-D__STL_CONFIG_H"
  make
}

package() {
  cd "${srcdir}/$_plugname-$pkgver"
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
