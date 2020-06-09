# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=lib32-libcap
pkgver=2.35
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=('lib32-glibc' 'lib32-attr' 'libcap')
makedepends=('linux-api-headers')
provides=('libcap.so')
source=(https://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-$pkgver.tar.{xz,sign})
sha512sums=('1529e9cb06866167e6292776ae8743a2308ea64358a9531e90f8239ccf4970df5f6a8f2e852e5be68cca1fa73ddf0865f20dd42dc00e6d91915104750d2307d8'
            'SKIP')
validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>

prepare() {
  cd libcap-$pkgver

  # use our buildflags
  sed -i "s/CFLAGS :=/CFLAGS += \$(CPPFLAGS) /" Make.Rules
  sed -i "s/LDFLAGS :=/LDFLAGS +=/" Make.Rules
}

_makeargs=(
  CC="gcc -m32"
  KERNEL_HEADERS=/usr/include
  RAISE_SETFCAP=no
  SBINDIR=/usr/bin
  lib=lib32
  prefix=/usr
)

build() {
  make -C libcap-$pkgver/libcap "${_makeargs[@]}"
}

package() {
  cd libcap-$pkgver/libcap
  make DESTDIR="$pkgdir" "${_makeargs[@]}" install

  rm -r "$pkgdir"/usr/include
}
