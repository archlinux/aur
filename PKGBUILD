# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=lib32-openssl-1.1
_ver=1.1.1w
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=3
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('OpenSSL')
depends=('lib32-glibc' 'openssl-1.1')
source=("https://www.openssl.org/source/openssl-${_ver}.tar.gz"
        'ca-dir.patch')
b2sums=('2fdba6ca0188928ab2f74e606136afca66cfa0467170fa6298ef160b64ac6fdcad1e81e5dd14013ce0e9921d0f7417edec531cd0beaf1196fec704c2c6d48395'
        '6375a8994d95ef5e51d724e62558a25a7ec0632577f4cf99d347fc1cecc133ac2cb1dc55bb872ca6bca0449ed5c27ba72afb10c4c55aced300405b542ccbb808')

prepare() {
  cd openssl-${_ver}
  patch -Np0 -i ../ca-dir.patch
}

build() {
  cd openssl-${_ver}

  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./Configure \
    --prefix='/usr' \
    --libdir='lib32/openssl-1.1' \
    --openssldir='/etc/ssl' \
    shared no-ssl3-method linux-elf

  make MAKEDEPPROG="${CC}" depend
  make
}

package() {
  cd openssl-${_ver}

  make DESTDIR="${pkgdir}" install_sw
  rm -rf "${pkgdir}"/{etc,usr/{include,bin}}

  mv "${pkgdir}"/usr/lib32/{openssl-1.1/,}libcrypto.so.1.1
  mv "${pkgdir}"/usr/lib32/{openssl-1.1/,}libssl.so.1.1
  ln -sf ../libssl.so.1.1 "${pkgdir}"/usr/lib32/openssl-1.1/libssl.so
  ln -sf ../libcrypto.so.1.1 "${pkgdir}"/usr/lib32/openssl-1.1/libcrypto.so

  sed -e 's|/include$|/include/openssl-1.1|' -i "${pkgdir}"/usr/lib32/openssl-1.1/pkgconfig/*.pc

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
