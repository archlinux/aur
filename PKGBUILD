# Maintainer: Michael Goehler <somebody dot here at gmx dot de>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contriburor: Steven <steven at stebalien dot com>
# Contributor: Aaron Griffin <aaron at archlinux dot org>
# Contributor: judd <jvinet at zeroflux dot org>

pkgname=knockd-git
_pkgname=knock
pkgver=r35.e566d49
pkgrel=1
pkgdesc="A simple port-knocking daemon and client."
arch=('i686' 'x86_64')
url="http://www.zeroflux.org/projects/knock"
license=(GPL)
depends=('libpcap>=1.0.0')
conflicts=('knockd')
makedepends=(git)
backup=('etc/knockd.conf')
source=('knock::git+https://github.com/jvinet/knock.git'
        'knockd.logrotate'
        'knockd.service')
md5sums=('SKIP'
         '56a4113ec89ba2e96f79ab23c914d52a'
         'da806fb9fbdf638df4e0011070ff9ef1')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"

    autoreconf -fi

    ./configure --prefix=/usr \
                --sbin=/usr/bin \
                --sysconfdir=/etc

    make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" MANDIR=/usr/share/man install
  install -D -m755 "$srcdir/knockd.service" "$pkgdir/usr/lib/systemd/system/knockd.service"
  install -D -m644 "$srcdir/knockd.logrotate" "$pkgdir/etc/logrotate.d/knockd"
}

# vim:set ts=4 sw=4 et:
