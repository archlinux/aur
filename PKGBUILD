# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="paramotopy"
pkgver=1.0.3.7
_commit="36121881a137cf29c7f662bd792a0e823d5742f2"
pkgrel=1
pkgdesc="Parallel parameter homotopy through Bertini"
arch=('any')
url="https://${pkgname}.com"
_url="https://github.com/ofloveandhate/${pkgname}"
license=('custom:Paramotopy license')
makedepends=('boost>=1.53' 'gmp')
depends=('glibc' 'gcc-libs' 'boost-libs' 'bertini' 'mpfr' 'openmpi')
optdepends=('paramotopy-docs: HTML documentation')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgname}_fix_boost_timer_para_aux_funcs.patch"
        "${pkgname}_fix_boost_timer_point.patch"
        "${pkgname}_fix_boost_timer_runinfo.patch"
        "${pkgname}_fix_boost_timer_step2.patch"
        "${pkgname}_fix_boost_timer_timing.patch"
        "${pkgname}_fix_boost_timer_xml_preferences.patch")
sha256sums=('4f04d932c540d68d69d2d8605699921c4e98227016999056b8afbe5d630ca54a'
            '591a4d680eae9efdc0ed523eb0183369f8afc424a8a1501f58b0bf64fac237f4'
            '54f62a75a856706fe07ae691126c35a182462e80fbc47601a8544e7502b81e68'
            '696692d4a08bc6ab23f516ee86a617eca5228ab5608fb6b5e5250acdabb0094b'
            'e3aa61174f4189cfb9f4e408240431e5856ed07a44abae5f79bd370b0e2aa52b'
            '85d53fa8ad80d00d34ef57df47e577569076d0046c0899a0aaab6302c08bca38'
            'aed8f50b9572b5055ff0d862870a12328207627a326a54de16763d8d8df87c40')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[paramotopy\], \[\([^]]*\)\],.*/\1/p' "configure.ac"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's/1\.3\.7/1.0.3.7/g' "COPYING"

  cd "include"
  for _patch in "${srcdir}/${pkgname}_fix_boost_timer_"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  CPPFLAGS+="-I/usr/include/bertini"
  LDFLAGS+="-L/usr/lib/bertini"
  ./configure \
    --prefix='/usr' \
    --includedir='/usr/include'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  # install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
