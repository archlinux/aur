# Maintainer: Tarn W. Burton <twburton@gmail.com>
_srcname=clasp
pkgname=clasp-cl
pkgname=clasp-cl-git
pkgver=0.4.2.r2955.gbdc09b2fe
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
depends=('boost' 'clang90' 'expat' 'gmp' 'libbsd' 'libedit'
         'libelf' 'libffi' 'llvm90' 'netcdf' 'ncurses' 'zlib')
makedepends=('git' 'python' 'sbcl')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
source=('git://github.com/clasp-developers/clasp.git'
        'wscript.config')
sha512sums=('SKIP'
            'e3280bf14b0fc066c1bc95b9ea79244f487dbd3fb04e6f527fdf47da57edb6ab8a4b8cb633ab36b3d2a5f406192ad825e790a0fadf4a451a683d1d98d11f45dd')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    cp ../wscript.config .
    sed -i s/\"--link-static\",//g wscript
    git clone https://github.com/cando-developers/cando.git extensions/cando || (cd extensions/cando ; git reset --hard ; git pull)
    sed -i s/stlib/lib/g extensions/cando/wscript
    sed -i s/STLIB/LIB/g extensions/cando/wscript
    sed -i s/subprocess.call/print/g extensions/cando/wscript
    sed -i s/os.symlink/print/g extensions/cando/wscript
    ./waf configure
    ./waf build_cboehm
}

package() {
  cd "$_srcname/"
  ./waf install_cboehm --destdir "$pkgdir"
  ln -s /usr/bin/ccando-boehm "$pkgdir/usr/bin/cando"
  ln -s /usr/bin/cleap-boehm "$pkgdir/usr/bin/cleap"
}
