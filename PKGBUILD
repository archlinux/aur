# Contributor: Trenzalore
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu72
pkgver=72.1
pkgrel=2
pkgdesc="International Components for Unicode library"
arch=(x86_64)
url="https://icu.unicode.org"
license=('Unicode-3.0' 'ICU')
depends=('gcc-libs' 'sh')
makedepends=('python')
provides=('icu72-bin') # workaround for consumers
source=(https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz{,.asc}
	${pkgname}-fix-test.patch::https://github.com/unicode-org/icu/commit/60d6bd71efc0cde8f861b109ff87dbbf9fc96586.patch)
# https://github.com/unicode-org/icu/releases/download/release-72-1/SHASUM512.txt
sha512sums=('848c341b37c0ff077e34a95d92c6200d5aaddd0ee5e06134101a74e04deb08256a5e817c8aefab020986abe810b7827dd7b2169a60dacd250c298870518dcae8'
            'SKIP'
            '4d2ff2a572d3ae048cb493d5349bd2fb1d6c883984714cafbd8213c387f3fded9fa6d391eeeba2e82ba2ac5f7f8ed0ebe90bca1b3493759d9d5e9036a681d6e0')
validpgpkeys=('3DA35301A7C330257B8755754058F67406EAA6AB') # Craig Cornelius <ccornelius@google.com>

prepare() {
  patch -d icu -p2 < ${pkgname}-fix-test.patch
}

build() {
  cd icu/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

check() {
  cd icu/source
  make -k check
}

package() {
  cd icu/source
  make -j1 DESTDIR="${pkgdir}" install

  # Install license
  install -Dm644 "${srcdir}"/icu/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # remove files that conflict with official icu
  rm -rfv "${pkgdir}"/usr/{bin,lib/pkgconfig,include,share/man,lib/{*.so,icu/*.inc,icu/current}}
}
