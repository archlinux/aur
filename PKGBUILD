pkgname=beanstalkd-git
pkgver=dev1.12.r11.g4c275d5

pkgrel=1
epoch=
pkgdesc="Fast, simple message queue server, git version"
arch=('i686' 'x86_64')
url="https://beanstalkd.github.io/"
license=('GPL')
depends=()
makedepends=()
conflicts=('beanstalkd')
provides=('beanstalkd')
backup=('etc/conf.d/beanstalkd')
source=("git+http://github.com/kr/beanstalkd.git"
	"beanstalkd@.service"
	"beanstalkd.service"
	"beanstalkd.conf"
	"wno-error.patch")
sha1sums=('SKIP'
          '8ef8fe89b7da43ed92ae7b2428f1126a5a0d060a'
          '3ba17f1786aeabcba7e11c5a42415a7882c67c1b'
          '96f94770b132a0c26acddeab224c64bb5bed359a'
          '4098dfbbc0639c4c772b0e53a17fb175bc7f4086')


pkgver() {
  cd "$srcdir/beanstalkd"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/beanstalkd"
  patch -p0 < $srcdir/wno-error.patch
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
