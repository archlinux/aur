# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Thomas Holmquist <thomas@vorget.com>
# Contributor: Jan Boehringer <ja(a)bm-boehringer.de>
# Contributor: Alex Griffin <griffin.aj(a)gmail.com>

pkgname=polipo
pkgver=1.1.1
pkgrel=5
pkgdesc="Small and fast caching web proxy (from 2014)"
arch=('x86_64')
url="http://www.pps.jussieu.fr/~jch/software/polipo/"
license=('MIT')
#source=(https://github.com/jech/polipo/archive/refs/tags/polipo-$pkgver.tar.gz
source=(http://www.pps.univ-paris-diderot.fr/~jch/software/files/polipo/polipo-$pkgver.tar.gz{,.asc}
        polipo.sysusers
        polipo.tmpfiles
        polipo.service)
validpgpkeys=('F8E70AAD74D32CAC27B9AFD62652C881EADB5526')
sha256sums=('a259750793ab79c491d05fcee5a917faf7d9030fb5d15e05b3704e9c9e4ee015'
            'SKIP'
            '7cca508a1a43c9162cf76fc782a3c7f4736189daa757a4e5432d5c2d073214c8'
            '9229d9adbce9dd3630cea01f80f8bf262d733bc58f2a1cff2567692f836bec66'
            'fc62ed3ebe6e0b58276b0f164a3f307d1903cf1600bb1813cf0515fda7429d13')

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver \
        DISK_CACHE_ROOT="$pkgdir/var/cache/polipo" \
        INFODIR="$pkgdir/usr/share/info" \
        LOCAL_ROOT="$pkgdir/usr/share/polipo/www" \
        MANDIR="$pkgdir/usr/share/man" \
        PREFIX="$pkgdir/usr" \
        install

  install -Dm644 $pkgname-$pkgver/{config.sample,forbidden.sample} -t "$pkgdir/etc/polipo"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/polipo/LICENSE"
  install -Dm644 polipo.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 polipo.sysusers "$pkgdir/usr/lib/sysusers.d/polipo.conf"
  install -Dm644 polipo.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/polipo.conf"
}

