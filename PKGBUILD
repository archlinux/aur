_pkgname=sat_code
pkgname=pluto-sat-code-git
pkgver=20230608.3db65bb
pkgrel=5
pkgdesc="Code for the SGP4/SDP4 satellite motion model, and for manipulating TLEs (Two-Line Elements)"
arch=(x86_64)
url="http://www.projectpluto.com/sat_code.htm"
license=(MIT)
provides=(pluto-sat-code)
makedepends=('git' 'pluto-lunar')
source=("git+https://github.com/Bill-Gray/sat_code.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
  cd "$srcdir/${_pkgname}"
  make all
}

package() {
  # install headers
  install -m644 -D "${srcdir}/${_pkgname}/norad.h"	"${pkgdir}/usr/local/include/norad.h"

  # install lib
  install -m644 -D "${srcdir}/${_pkgname}/libsatell.a"	"$pkgdir/usr/lib/libsatell.a"

  # install binary
  # set with a different name, because such a name is in "Lunar" 
  install -m755 -D "${srcdir}/${_pkgname}/test_des"	"$pkgdir/usr/bin/test_des"
  for bin in "dropouts" "fake_ast" "fix_tles" "get_high" "line2" "mergetle" "obs_tes2" "obs_test" \
             "out_comp" "sat_cgi" "sat_eph" "sat_id" "sat_id2" "summarize" "test2" \
             "test_out" "test_sat" "tle2mpc"  
  do
	install -m755 -D "${srcdir}/${_pkgname}/${bin}"	"$pkgdir/usr/bin/${bin}"
  done
}

