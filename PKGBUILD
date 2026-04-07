# Maintainer EliasofWaffle <eliascontato@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libldacdec
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Reverse-engineered unofficial LDAC Bluetooth decoder library"
url="https://github.com/anonymix007/libldacdec"
arch=(x86_64)
license=(Apache-2.0)
depends=(glibc)
makedepends=(git make gcc patchelf)
provides=(libldacBT_dec.so)
_commit=c90094b15e25aef0e47c6d775fa94aceb36cabbc
source=("git+$url#commit=$_commit"
        "git+https://android.googlesource.com/platform/external/libldac.git#commit=e8ff0f96f26b84b47711c549e0d60baa425cd70e"
        "ldacBT-dec.pc"
        )
sha256sums=('4f2eb83a0ceaa71c0cbdb3e622ff37444199779df00372b8a167b9da3522fb2e'
            '096342df8d8675c354f0b6335d4d0b2f044511628952c9240e20f8c4bda6a93f'
            'd6425808c870f7c408013934478421e8895073c10fb3ac10fa1db9febe0783f4')

prepare() {
  cd libldacdec

  git submodule init
  git submodule set-url libldac "$srcdir/libldac"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd libldacdec
  make ldacdec
  patchelf --set-soname libldacBT_dec.so libldacdec.so
  mv libldacdec.so libldacBT_dec.so
}

package() {
    install -Dm 0755 "${srcdir}/libldacdec/libldacBT_dec.so" "${pkgdir}/usr/lib/libldacBT_dec.so"
    install -Dm 0644 "${srcdir}/libldacdec/libldacBT_dec.h" "${pkgdir}/usr/include/ldac/ldacBT_dec.h"
    install -Dm 0644 "${srcdir}/ldacBT-dec.pc" "${pkgdir}/usr/lib/pkgconfig/ldacBT-dec.pc"
}
