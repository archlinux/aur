# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=libcap-git
pkgver=2.46
pkgrel=1
pkgdesc='POSIX 1003.1e capabilities'
arch=('x86_64')
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=('glibc' 'pam')
makedepends=('linux-api-headers')
provides=('libcap.so' 'libpsx.so' 'libcap')
conflicts=(libcap)
source=("git+https://git.kernel.org/pub/scm/libs/libcap/libcap.git"
        "libcap-2.45-makefile.patch"
)
sha512sums=('SKIP'
            '4f613f83198dfccb8b79e1b2c8764657a85300cb166d633d86b87f46567d51fa9395387caf33e82a8718f19e9a1fc65c11e7b6f63c3c4cde1b2a27f70671ec07')
#validpgpkeys=(38A644698C69787344E954CE29EE848AE2CCF3F4) # Andrew G. Morgan <morgan@kernel.org>

pkgver() {
  cd libcap
  git describe --tags --always | sed 's/-/+/g'
}

prepare() {
  cd libcap
  # SBINDIR is hardcoded to sbin. set to bin
  # add CPPFLAGS
  patch -Np1 -i ../"libcap-2.45-makefile.patch"
}

build() {
  cd libcap
  make KERNEL_HEADERS='/usr/include' lib='lib' prefix='/usr'
}

#check() {
#  cd libcap
#  make test
#}

package() {
  cd libcap
  make DESTDIR="$pkgdir" RAISE_SETFCAP='no' lib='lib' prefix='/usr' install
  # docs
  install -vDm 644 {CHANGELOG,README} -t "${pkgdir}/usr/share/doc/libcap/"
  install -vDm 644 pam_cap/capability.conf \
    -t "$pkgdir/usr/share/doc/libcap/examples/"
}
