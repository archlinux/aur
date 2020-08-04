# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=lib32-libcap
pkgver=2.39
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=('lib32-glibc' 'lib32-attr' 'libcap')
makedepends=('linux-api-headers')
provides=('libcap.so')
source=(https://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-$pkgver.tar.{xz,sign})
sha512sums=('82cd81d67ec439a6051eaa4c20ff302bb5a667c585eada837605b122dc04d8fe6b4c619e7373af2423f3b0f4ab2258147fff309001a8f483e185b7e6578e1f98'
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
