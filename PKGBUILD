# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=lib32-libcap
pkgver=2.32
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=('lib32-glibc' 'lib32-attr' 'libcap')
makedepends=('linux-api-headers')
provides=('libcap.so')
source=(https://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-$pkgver.tar.{xz,sign})
sha256sums=('1005e3d227f2340ad1e3360ef8b69d15e3c72a29c09f4894d7aac038bd26e2be'
            'SKIP')
validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>

prepare() {
  cd libcap-$pkgver

  # use our buildflags
  sed -i "s/CFLAGS :=/CFLAGS += \$(CPPFLAGS) /" Make.Rules
  sed -i "s/LDFLAGS :=/LDFLAGS +=/" Make.Rules
}

build() {
  make -C libcap-$pkgver/libcap KERNEL_HEADERS=/usr/include CC="gcc -m32"
}

package() {
  cd libcap-$pkgver
  make -C libcap prefix=/usr lib=lib32 DESTDIR="$pkgdir" RAISE_SETFCAP=no install

  rm -r "$pkgdir"/usr/include
}
