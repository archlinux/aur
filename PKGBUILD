# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>

pkgname=lib32-openssl-1.0-hardened
_ver=1.0.2u
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('lib32-glibc' 'openssl-1.0')
provides=(lib32-openssl-1.0)
conflicts=(lib32-openssl-1.0)
source=("https://www.openssl.org/source/openssl-${_ver}.tar.gz"
        'no-rpath.patch'
        'openssl-1.0-versioned-symbols.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
#validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
#              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
  cd openssl-${_ver}

  patch -Np0 -i ../no-rpath.patch
  patch -Np1 -i ../openssl-1.0-versioned-symbols.patch
}

build() {
  cd openssl-${_ver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./Configure \
    --prefix='/usr' \
    --libdir='lib32/openssl-1.0' \
    --openssldir='/etc/ssl' \
    shared no-ssl3-method linux-elf no-ssl2 no-ssl3 no-weak-ssl-ciphers no-ssl no-deprecated no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-tls1_2 no-tls1_2-method enable-tls1_3 no-rc2 no-rc4 no-idea no-seed -DOPENSSL_USE_IPV6=0 \
    "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

  make MAKEDEPPROG="${CC}" depend
  make
}

package() {
  cd openssl-${_ver}

  make INSTALL_PREFIX="${pkgdir}" install_sw
  rm -rf "${pkgdir}"/{etc,usr/{include,bin}}

  mv "${pkgdir}"/usr/lib32/{openssl-1.0/,}libcrypto.so.1.0.0
  mv "${pkgdir}"/usr/lib32/{openssl-1.0/,}libssl.so.1.0.0
  ln -sf ../libssl.so.1.0.0 "${pkgdir}"/usr/lib32/openssl-1.0/libssl.so
  ln -sf ../libcrypto.so.1.0.0 "${pkgdir}"/usr/lib32/openssl-1.0/libcrypto.so

  sed -e 's|/include$|/include/openssl-1.0|' -i "${pkgdir}"/usr/lib32/openssl-1.0/pkgconfig/*.pc

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s openssl-1.0 "${pkgdir}"/usr/share/licenses/lib32-openssl-1.0
}
