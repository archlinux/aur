# Maintainer: Michal Wojdyla < micwoj92 at tutanota dot com >
# Conbtributor: Edward Pacman <micro DOT fedora AT gmail DOT com>

pkgname=iptables-fullcone-nat
pkgver=1.8.4
pkgrel=1
pkgdesc="iptables with FULLCONENAT extension"
arch=('x86_64')
url="https://github.com/Chion82/netfilter-full-cone-nat"
license=('GPL2')
depends=(libnftnl libpcap libnfnetlink libnetfilter_conntrack bash netfilter-full-cone-nat-dkms)
makedepends=('git' 'linux-api-headers')
provides=('iptables')
conflicts=('iptables')
install=${pkgname}.install
source=(https://www.netfilter.org/projects/iptables/files/iptables-$pkgver.tar.bz2
		"file:///usr/src/netfilter-full-cone-nat-git+bc3fb32/libipt_FULLCONENAT.c"
		"arptables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/arptables.service?h=packages/iptables"
		"ebtables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ebtables.service?h=packages/iptables"
		"empty-filter.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-filter.rules?h=packages/iptables"
		"empty-mangle.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-mangle.rules?h=packages/iptables"
		"empty-nat.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-nat.rules?h=packages/iptables"
		"empty-raw.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-raw.rules?h=packages/iptables"
		"empty-security.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-security.rules?h=packages/iptables"
		"empty.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty.rules?h=packages/iptables"
		"ip6tables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ip6tables.service?h=packages/iptables"
		"iptables-legacy-flush::https://git.archlinux.org/svntogit/packages.git/plain/trunk/iptables-legacy-flush?h=packages/iptables"
		"iptables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/iptables.service?h=packages/iptables"
		"simple_firewall.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/simple_firewall.rules?h=packages/iptables")
sha1sums=('cd5fe776fb2b0479b3234758fc333777caa1239b'
          'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP'
		  'SKIP')

prepare() {
  mkdir build
  cd iptables-$pkgver

  cp ../libipt_FULLCONENAT.c extensions/
  # use system one
  rm include/linux/types.h
}

build() {
  cd build
  ../iptables-$pkgver/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --enable-bpf-compiler \
    --enable-devel \
    --enable-libipq \
    --enable-shared
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make
}

package() {
  pkgdesc+=' (using legacy interface)'
  _package legacy
}

_package() {
  DESTDIR="$pkgdir" make -C build install

  for _x in {arp,eb,ip,ip6}tables{,-restore,-save} iptables-xml; do
    if [[ $1 = nft || $_x = ip* ]]; then
      ln -sf xtables-$1-multi "$pkgdir/usr/bin/$_x"
    else
      rm "$pkgdir/usr/bin/$_x"
    fi
  done

  install -Dt "$pkgdir/usr/lib/systemd/system" -m644 {ip,ip6}tables.service
  install -D iptables-$1-flush "$pkgdir/usr/lib/systemd/scripts/iptables-flush"

  install -Dm644 empty.rules "$pkgdir/etc/iptables/iptables.rules"
  install -Dm644 empty.rules "$pkgdir/etc/iptables/ip6tables.rules"
  install -Dt "$pkgdir/usr/share/iptables" -m644 *.rules
  ln -srt "$pkgdir/etc/iptables" "$pkgdir"/usr/share/iptables/{empty,simple_firewall}.rules
}