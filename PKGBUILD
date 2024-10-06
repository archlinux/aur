# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Kemka Andrey <dr.andru@gmail.com>

pkgname="libguess"
pkgver=1.2+r13+gb44a240
_commit_rel="13c43adc7e6bfcf021057fd99feb661e8fa80a2d" # 1.2
_commit="b44a240c57ddce98f772ae7d9f2cf11a5972d8c2"
pkgrel=1
pkgdesc="High-speed character set detection library"
arch=('x86_64')
url="https://github.com/kaniini/${pkgname}"
license=('BSD-3-Clause')
depends=('glibc')
provides=("${pkgname}.so")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${pkgname}_fix_autoconf271.patch::https://sources.debian.org/data/main/${pkgname::4}/${pkgname}/${pkgver%%+*}-5/debian/patches/autoconf2.71.patch")
sha256sums=('ae110f2fe4f93837720f04232348498d8c84af32db352d01a02e50609c643e22'
            'ab16213c64bc6b4107b36993b55f2650e360bfa066fa6a3482c00e7e4a8de4f1')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' # \
    # --enable-examples
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
