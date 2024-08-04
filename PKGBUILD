# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="paramotopy"
pkgname="${_pkgname}-git"
pkgver=r444.48174f3
pkgrel=1
pkgdesc="Parallel parameter homotopy through Bertini"
arch=('any')
url="https://${_pkgname}.com"
_url="https://github.com/ofloveandhate/${_pkgname}"
license=('custom:Paramotopy license')
makedepends=('git' 'boost>=1.53' 'gmp')
depends=('glibc' 'gcc-libs' 'boost-libs' 'bertini' 'mpfr' 'openmpi')
optdepends=('paramotopy-docs: HTML documentation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_boost_timer_para_aux_funcs.patch"
        "${_pkgname}_fix_boost_timer_point.patch"
        "${_pkgname}_fix_boost_timer_runinfo.patch"
        "${_pkgname}_fix_boost_timer_step2.patch"
        "${_pkgname}_fix_boost_timer_timing.patch"
        "${_pkgname}_fix_boost_timer_xml_preferences.patch")
sha256sums=('SKIP'
            '591a4d680eae9efdc0ed523eb0183369f8afc424a8a1501f58b0bf64fac237f4'
            '54f62a75a856706fe07ae691126c35a182462e80fbc47601a8544e7502b81e68'
            '696692d4a08bc6ab23f516ee86a617eca5228ab5608fb6b5e5250acdabb0094b'
            'e3aa61174f4189cfb9f4e408240431e5856ed07a44abae5f79bd370b0e2aa52b'
            '85d53fa8ad80d00d34ef57df47e577569076d0046c0899a0aaab6302c08bca38'
            'aed8f50b9572b5055ff0d862870a12328207627a326a54de16763d8d8df87c40')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}/include"
  for _patch in "${srcdir}/${_pkgname}_fix_boost_timer_"*".patch"; do
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

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  # install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"
}
