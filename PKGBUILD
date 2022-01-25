# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.63
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
depends=("libcap=${pkgver}" lib32-gcc-libs lib32-glibc lib32-pam)
makedepends=(linux-api-headers)
provides=(libcap.so libpsx.so)
source=("https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/${_name}-$pkgver.tar."{xz,sign}
)
sha512sums=('832842b71ca32db8f53ca5f1a3010f14e7f42693f62f29632e9948c860f990899bb094165c37307ce8b9e5bc5eb1c833e780ebca98442df3e6d900e4b238834b'
            'SKIP')
b2sums=('a49a628f5b9ddf5a3d077428544a53b9cdedf62053ff296a0aa7d61e12ca05f9ba7597f20ee16a3843736bee2417a3d1585ad6b336651fcb3e4ee29b108cfa0f'
        'SKIP')
validpgpkeys=(38A644698C69787344E954CE29EE848AE2CCF3F4) # Andrew G. Morgan <morgan@kernel.org>

build() {
  make DYNAMIC=yes KERNEL_HEADERS='/usr/include' CC="gcc -m32" lib='lib32' prefix='/usr' sbindir='bin' -C "${_name}-$pkgver"
}

check() {
  make test CC="gcc -m32" -k -C "${_name}-$pkgver"
}

package() {
  make DESTDIR="$pkgdir" RAISE_SETFCAP='no' lib='lib32' prefix='/usr' sbindir='bin' install -C "${_name}-$pkgver"
  install -vDm 644 "${_name}-$pkgver/"{CHANGELOG,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # remove files provided by libcap
  rm -rv "${pkgdir}/usr/"{include,share/man,bin}
}
