# Maintainer: Tarn W. Burton <twburton@gmail.com>
_srcname=clasp
pkgname=clasp-cl
pkgname=clasp-cl-git
pkgver=0.4.2.r2802.g80be1eee1
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
            '597b10fa3e5bc72373c96c0b8d42f9b879121d72fa747a70855c1020fcfee8a366e468df7557a26d162933c8331dbd0d317d198013e42c79d9f8b16103062eed')

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
