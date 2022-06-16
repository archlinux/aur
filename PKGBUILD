_pkgname=bird
pkgname=$_pkgname-git
pkgver=2.0.9.r21.gb867c798
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon (development version)'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL2')
backup=('etc/bird.conf')
makedepends=('git' 'autoconf' 'automake')
depends=('glibc' 'readline' 'ncurses' 'libssh')
conflicts=("$_pkgname")
provides=("$_pkgname")
replaces=('bird6')
options=(!emptydirs)
source=("${_pkgname}::git+https://gitlab.nic.cz/labs/bird.git#branch=master"
        'bird.service'
        )
sha256sums=('SKIP'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  autoreconf -ifv
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run/$_pkgname \
    --docdir=/usr/share/doc/$_pkgname
  make
}

package () {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"
}

# vim:set ts=2 sw=2 et:
