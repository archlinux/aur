# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=icu
pkgname=icu65
pkgver=65.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('python' 'clang' 'make' 'patch')
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz"
        "icu-65.1-initialized-buffer-uloc_getKeywordValue.patch::https://github.com/unicode-org/icu/commit/fab4c3c719.patch"
        "icu-65.1-prevent-SEGV_MAPERR-in-append.patch::https://github.com/unicode-org/icu/commit/b7d08bc04a.patch")
sha512sums=('8f1ef33e1f4abc9a8ee870331c59f01b473d6da1251a19ce403f822f3e3871096f0791855d39c8f20c612fc49cda2c62c06864aa32ddab2dbd186d2b21ce9139'
            '8898fe0fa9805304cd2fc02c00ab1131861836f4d11887f82450c2378666cb03bce0c5038d3f0bdcdd1c1cdee2a00a61ef85602ed0e0c74ad2e58578b1940123'
            '580283cdd95fb7b8410cb3a6c0f47a6c8e53e0fdc9c213b04cd133ba4120381533ff2aef89ddab968150754bd9ca3a536d5c592c6881e625eb8ee6de8723de1b')

prepare() {
  cd "${_pkgname}"

  # https://unicode-org.atlassian.net/browse/ICU-20884
  patch -Np2 -i ../icu-65.1-initialized-buffer-uloc_getKeywordValue.patch

  # https://github.com/unicode-org/icu/pull/971
  patch -Np2 -i ../icu-65.1-prevent-SEGV_MAPERR-in-append.patch
}

build() {
  cd "${_pkgname}/source"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin

  make
}

check() {
  cd "${_pkgname}/source"

  make -k check
}

package() {
  cd "${_pkgname}/source"

  make -j1 DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  # Install license
  install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
