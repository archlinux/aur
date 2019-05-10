# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_pkgbasename=libcap
pkgname=lib32-$_pkgbasename
pkgver=2.27
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=('lib32-attr' $_pkgbasename)
makedepends=('gcc-multilib' 'linux-api-headers')
validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>
source=(https://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-$pkgver.tar.{xz,sign})
md5sums=('2e8f9fab32eb5ccb37969fe317fd17aa'
         'SKIP')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  # use our buildflags
  sed -i "s/CFLAGS :=/CFLAGS += \$(CPPFLAGS) /" Make.Rules
  sed -i "s/LDFLAGS :=/LDFLAGS +=/" Make.Rules
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  make -C libcap CC="gcc -m32" prefix=/usr lib=lib32
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make -C libcap prefix=/usr lib=lib32 DESTDIR=${pkgdir} install
  chmod 755 ${pkgdir}/usr/lib32/libcap.so.${pkgver}

  rm -rf "${pkgdir}/usr/include"
}
