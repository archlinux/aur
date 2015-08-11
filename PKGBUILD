pkgname=beanstalkd-git
pkgver=dev1.10.r1.g86231ba

pkgrel=2
epoch=
pkgdesc="Fast, simple message queue server, git version patched to support unix sockets"
arch=('i686' 'x86_64')
url=""
license=('GPL')
depends=()
makedepends=()
conflicts=('beanstalkd')
provides=('beanstalkd')
backup=('etc/conf.d/beanstalkd')
options=()
install=
changelog=
source=("git://github.com/kr/beanstalkd.git"
	"unix_sockets.patch::https://patch-diff.githubusercontent.com/raw/kr/beanstalkd/pull/150.patch"
	"beanstalkd@.service"
	"beanstalkd.service"
	"beanstalkd.conf")
md5sums=('SKIP'
	 'c17cd694afab67d2d72055f3184c7335'
	 'f6151d5d2f07c24977cafba38a9e67c9'
	 'd05b907abfb19174a7321676ecc0c819'
         '7fdc2e3d1dc9c6559b7b007b74588a09')

pkgver() {
  cd "$srcdir/beanstalkd"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/beanstalkd"
  patch -p1 < $srcdir/unix_sockets.patch
}

build() {
  cd "$srcdir/beanstalkd"
  make CFLAGS="${CFLAGS}"
}

package() {
  cd "$srcdir/beanstalkd"

  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  #systemd files
  install -D -m644 "adm/systemd/beanstalkd.socket" "${pkgdir}/usr/lib/systemd/system/beanstalkd.socket"
  install -D -m644 "${srcdir}/beanstalkd.service" "${pkgdir}/usr/lib/systemd/system/beanstalkd.service"
  install -D -m644 "${srcdir}/beanstalkd@.service" "${pkgdir}/usr/lib/systemd/system/beanstalkd@.service"
  install -D -m644 "${srcdir}/beanstalkd.conf" "${pkgdir}/etc/conf.d/beanstalkd"

  install -D -m644 "doc/beanstalkd.1" "${pkgdir}/usr/share/man/man1/beanstalkd.1"
  
}

# vim:set ts=2 sw=2 et:
