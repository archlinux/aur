# Maintainer:  Monson Shao <holymonson@gmail.com>

pkgname=heasoft-nodata
_pkgname=heasoft
pkgver=6.27.2
pkgrel=1
# _mod should be '', '_no_xspec_modeldata' or '_plus_older_xspec_modeldata'
_mod='_no_xspec_modeldata'
pkgdesc="NASA high energy astrophysics library, without xspec model data"
makedepends=("glibc" "gcc-fortran" "perl" "python-numpy")
depends=("ncurses" "readline" "libxpm" "libidn")
optdepends=("python-numpy: python binding")
provides=(${_pkgname})
url="https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"
arch=('x86_64')
license=('NASA' 'GPL')
source=("https://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/lheasoft${pkgver}/heasoft-${pkgver}src${_mod}.tar.gz")

# You could use below to get offical md5
# curl -s ${source}.md5  | awk '{print "md5sums=(", $1, ")"}'
md5sums=( 329391bc543414e6bb41f3f15cd646a9 )

install="${pkgname}.install"

build() {
  cd "$srcdir/${_pkgname}-${pkgver}/BUILD_DIR" || return

  ./configure --prefix="/opt/${_pkgname}" --build="${CHOST}"

  # parallel builds may fail
  make -j1
}

package(){
  local glibcver HEADAS

  cd "$srcdir/${_pkgname}-${pkgver}/BUILD_DIR" || return

  make -j1 DESTDIR="$pkgdir" install

  glibcver=$(ldd --version | sed -n 's/ldd (GNU libc) //p')
  HEADAS="/opt/${_pkgname}/${CHOST}-libc${glibcver}"

  install -d "$pkgdir/etc/profile.d"
  cat > "$pkgdir/etc/profile.d/heasoft.sh" <<EOF
export HEADAS="${HEADAS}"
alias heainit='. "${HEADAS}/headas-init.sh"'
EOF
}
