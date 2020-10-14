# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=lib32-libcap
pkgver=2.44
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=('lib32-glibc' 'lib32-attr' 'libcap')
makedepends=('linux-api-headers')
provides=('libcap.so')
source=(https://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-$pkgver.tar.{xz,sign})
sha512sums=('1bb323ca362923bd6bd0e2e4639cf8726975165a620a243b31e797056439eb7efb2bfbc8e5521636783a86c7415b2037b1638c98747b79183ca7d3d42a04ff20'
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
