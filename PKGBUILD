# Maintainer: Logan Sevcik <logan+aur@sevcik.email>
pkgname=nqptp-git
pkgver=1.2.5.dev.r10.gcfa8315
pkgrel=1
pkgdesc="A daemon that monitors timing data from PTP clocks"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mikebrady/nqptp#readme"
license=('GPL2')
provides=(nqptp)
conflicts=(nqptp)
replaces=(nqptp)
backup=()
options=()
source=("git+https://github.com/mikebrady/nqptp.git" nqptp.sysusers)
noextract=()
md5sums=('SKIP'
         'a799945151c4b51797a5e5a35cf94d88')

_gitname="nqptp"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/lib/systemd/system" "$pkgdir/usr/lib/sysusers.d/"
  cp nqptp.service "$pkgdir/usr/lib/systemd/system/"
  cp ../nqptp.sysusers "$pkgdir/usr/lib/sysusers.d/nqptp.conf"
}
