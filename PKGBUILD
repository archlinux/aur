# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_basename=gnutls
pkgver=3.8.9
pkgrel=1
pkgname="${_basename}${pkgver}"
pkgdesc="A library which provides a secure layer over a reliable transport layer"
arch=('x86_64')
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
url="https://www.gnutls.org"
depends=(
  'brotli>=1.0.0'
  'gcc-libs'
  'glibc'
  'gmp'
  'leancrypto>=1.2.0'
  'libidn2'
  'libp11-kit>=0.23.11'
  'libtasn1'
  'libunistring'
  'nettle'
  'zlib' 
  'zstd'
)
makedepends=(
  'tpm2-tss'
  'gtk-doc' # required for autoreconf when patching
)
checkdepends=(
  'net-tools'
  'tpm2-tools'
)
optdepends=(
  'tpm2-tss: support for TPM2 wrapped keys'
)
options=(
  '!zipman'
)
backup=(
  "etc/${pkgname}/config"
  "etc/modules-load.d/${pkgname}.conf"
)
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://www.gnupg.org/ftp/gcrypt/${_basename}/v${pkgver%.*}/${_pkgsrc}.tar.xz"
        "${_pkgsrc}.tar.xz.sig::https://www.gnupg.org/ftp/gcrypt/${_basename}/v${pkgver%.*}/${_pkgsrc}.tar.xz.sig"
        "${_basename}-ktls_disable_keyupdate_test.patch"
        "${pkgname}-config"
        "${pkgname}.modules-load")
sha256sums=('69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed'
            'SKIP'
            '2a911615739cb327b6dced36b595ea10c89f40bb7274d062dab14a9ecfe89708'
            '22e614510fe52defe8c233ce3e5ead2205739fd967657ce3176ca121f3c562b5'
            'bdc4c4eb010d766cb8dca8832adddd58b964e715473a823cfd7a6b236a54ceb6')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # "Daiki Ueno <ueno@unixuser.org>"

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_basename}-ktls_disable_keyupdate_test.patch"
}

build() {
  local configure_options=(
    --prefix='/usr'
    --program-suffix="${pkgver}"
    --includedir="/usr/include/${pkgname}"
    --libdir="/usr/lib/${pkgname}"
    --docdir="/usr/share/doc/${pkgname}"
    --with-system-priority-file="/etc/${pkgname}/config"
    --with-idn
    --with-brotli
    --with-zstd
    --with-tpm2
    --enable-openssl-compatibility
    --with-default-trust-store-pkcs11="pkcs11:"
    --enable-ktls
    --with-leancrypto
  )

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}-config" "${pkgdir}/etc/${pkgname}/config"
  install -vDm644 "${pkgname}.modules-load" "${pkgdir}/etc/modules-load.d/${pkgname}.conf"

  cd "${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  ln -vsf "/usr/lib/${pkgname}/libgnutls.so.30.40.3" \
    "lib/libgnutls.so.30.40.3"

  # TODO
  cd "share"
  rm -rf "info" "locale"
}
