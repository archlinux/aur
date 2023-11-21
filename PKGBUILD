pkgname=beanstalkd
pkgver=1.13
pkgrel=1
epoch=
pkgdesc="Fast, simple message queue server"
arch=('i686' 'x86_64')
url="https://beanstalkd.github.io/"
license=('GPL')
depends=()
makedepends=()
conflicts=('beanstalkd-git')
backup=('etc/conf.d/beanstalkd')
source=("https://github.com/kr/beanstalkd/archive/v${pkgver}.tar.gz"
	"beanstalkd@.service"
	"beanstalkd.service"
	"beanstalkd.conf"
	"wno-error.patch")
sha256sums=('26292dcdc0a7011d2f8ad968612f2cd8b2ef07687224876015399ae85e9e5263'
            'a58cb94c7524f48a4f37244dd37593fc74186168796d472db67326387510979e'
            'e18b2c5d959027560f597022b4afe56bc337c20c98c76ecec6d2e05097188627'
            'b59792b451554e6b7de54543448fcd6dd0b76dbe5babb94068864f063f7efbfc'
            'e7d7dc5df9f70da4f2767a9b6e2574191fb159045803a4b9a57b1dfb5dffe1c0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < $srcdir/wno-error.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CFLAGS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  #systemd files
  install -D -m644 "adm/systemd/beanstalkd.socket" "${pkgdir}/usr/lib/systemd/system/beanstalkd.socket"
  install -D -m644 "${srcdir}/beanstalkd.service" "${pkgdir}/usr/lib/systemd/system/beanstalkd.service"
  install -D -m644 "${srcdir}/beanstalkd@.service" "${pkgdir}/usr/lib/systemd/system/beanstalkd@.service"
  install -D -m644 "${srcdir}/beanstalkd.conf" "${pkgdir}/etc/conf.d/beanstalkd"

  install -D -m644 "doc/beanstalkd.1" "${pkgdir}/usr/share/man/man1/beanstalkd.1"
  
}

# vim:set ts=2 sw=2 et:
