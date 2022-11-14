# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname="lib32-libid3tag"
_pkgname="libid3tag"
pkgver=0.15.1b
pkgrel=4
pkgdesc="library for id3 tagging, lib32."
arch=('x86_64')
url="https://www.underbit.com/products/mad/"
license=('GPL')
depends=('lib32-zlib' "${_pkgname}")
makedepends=('gperf')
source=("ftp://ftp.mars.org/pub/mpeg/${_pkgname}-${pkgver}.tar.gz"
	'id3tag.pc'
	'10_utf16.diff'
	'11_unknown_encoding.diff'
	'CVE-2008-2109.patch')
md5sums=('e5808ad997ba32c498803822078748c3'
         '95e2fa67579dbae3222e802fc66e9477'
         '4f9df4011e6a8c23240fff5de2d05f6e'
         '3ca856b97924d48a0fdfeff0bd83ce7d'
         'c51822ea6301b1ca469975f0c9ee8e34')
sha256sums=('63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151'
            '035085fb7e832a96e97ba3bc0c67f488b6f1a43827e22c294ebc1e2b2b909427'
            '8aa2ef25a6560d5f82e8f1b06c080bf7bb507d63098915b9aa6614684f44af0f'
            'f58b782bef23fe393b992b74ef2fe4c5f7715b971faf9e048e65f8eb020b0c1a'
            '43ea3e0b324fb25802dae6410564c947ce1982243c781ef54b023f060c3b0ac4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}"/10_utf16.diff
  patch -p1 -i "${srcdir}"/11_unknown_encoding.diff
  patch -Np0 -i "${srcdir}"/CVE-2008-2109.patch

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/id3tag.pc" "${pkgdir}/usr/lib32/pkgconfig/id3tag.pc"
  rm -rf "${pkgdir}/usr/include"
}
