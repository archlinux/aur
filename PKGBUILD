# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: FUBAR <mrfubar@gmail.com>

pkgname=('shorewall' 'shorewall6' 'shorewall-core')
pkgver=5.2.8
pkgrel=1
_v1=$(expr $pkgver : '\([0-9]\+\(\.[0-9]\+\)\{1\}\)') # 5.x
_v2=$(expr $pkgver : '\([0-9]\+\(\.[0-9]\+\)\{2\}\)') # 5.x.x
arch=('any')
url="https://shorewall.org/"
license=('GPL')
source=(https://shorewall.org/pub/shorewall/$_v1/shorewall-$_v2/shorewall-$pkgver.tar.bz2{,.asc}
        https://shorewall.org/pub/shorewall/$_v1/shorewall-$_v2/shorewall6-$pkgver.tar.bz2{,.asc}
        https://shorewall.org/pub/shorewall/$_v1/shorewall-$_v2/shorewall-core-$pkgver.tar.bz2{,.asc})
sha256sums=('fbb5ab492ed372eaaf02817cc730f82c49a81c5a5f5cee4bc8f1bce846f2306d'
            'SKIP'
            'e82c3a9538b6548195398dc39c83b01bcf66eb5a22814c915a924b9adc088cd1'
            'SKIP'
            '39996b9697a2017947049ad3f03cb278e8f939ff924b2bb4bf2a0bc17c59988e'
            'SKIP')
validpgpkeys=('7BDE11F3F2B42E2E52828F8AE368BD09153D38B1')

build() {
  for product in shorewall{,6,-core}; do
    pushd "$srcdir/$product-$pkgver"
    ./configure HOST=archlinux
    popd
  done
}

package_shorewall() {
  pkgdesc="An iptables-based firewall for Linux systems"
  depends=('shorewall-core' 'perl')
  backup=(etc/shorewall/{accounting,actions,arprules,blrules,clear,conntrack,ecn,findgw,hosts,init,initdone,interfaces,lib.private,maclist,mangle,nat,netmap,params,policy,providers,proxyarp,refresh,refreshed,restored,routes,rtrules,rules,scfilter,secmarks,shorewall.conf,snat,start,started,stop,stopped,stoppedrules,tcclasses,tcclear,tcdevices,tcfilters,tcinterfaces,tcpri,tunnels,zones})

  cd "$srcdir/$pkgname-$pkgver"

  do_install
}

package_shorewall6() {
  pkgdesc="An iptables-based firewall for Linux systems (with IPv6 support)"
  depends=('shorewall')
  backup=(etc/shorewall6/{accounting,actions,blrules,clear,conntrack,findgw,hosts,init,interfaces,lib.private,maclist,mangle,nat,netmap,params,policy,providers,proxyndp,refresh,refreshed,restored,routes,rtrules,rules,scfilter,secmarks,shorewall6.conf,snat,start,started,stop,stopped,stoppedrules,tcclasses,tcclear,tcdevices,tcfilters,tcinterfaces,tcpri,tunnels,zones})

  cd "$srcdir/$pkgname-$pkgver"

  do_install 6
}

package_shorewall-core() {
  pkgdesc="Core Shorewall libraries"
  depends=('iptables' 'iproute2')

  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="$pkgdir" ./install.sh
}

do_install() {
  local _name_suffix=$1

  sed -i -e 's|^MODULE_SUFFIX=ko$|&.gz|' \
         -e 's|/subsys||' \
      "configfiles/shorewall$_name_suffix.conf"

  DESTDIR="$pkgdir" ./install.sh

  install -d "$pkgdir/usr/share/doc/shorewall$_name_suffix/"
  cp -r Samples$_name_suffix "$pkgdir/usr/share/doc/shorewall$_name_suffix/"

  chmod -R 644 "$pkgdir/etc/shorewall$_name_suffix/"
  chmod 755 "$pkgdir/etc/shorewall$_name_suffix/"
}

# vim:set ts=2 sw=2 et:
