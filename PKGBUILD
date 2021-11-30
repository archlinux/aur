# Maintainer: Tarn W. Burton <twburton@gmail.com>
_srcname=clasp
_qlver=2021-02-13
pkgname=clasp-cl
pkgname=clasp-cl-git
pkgver=0.4.2.r4948.g2e58b43e2
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'gmp' 'libbsd' 'libedit' 'clang' 'zeromq'
         'libelf' 'libffi' 'llvm' 'netcdf' 'ncurses' 'zlib')
makedepends=('git' 'python' 'sbcl')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
source=('git://github.com/clasp-developers/clasp.git'
        'git://github.com/clasp-developers/seqan-clasp.git'
        'git://github.com/cando-developers/cando.git'
        "https://github.com/quicklisp/quicklisp-client/archive/refs/tags/version-$_qlver.tar.gz"
        'wscript.config'
        'clasp.sh')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '8efec9d46f0008c9f2fab387837f5a02d60ebb9f4a83106142ae954bc322b99bd48f9e91e2107dda188d679e27ddb5f48e444adfa98e6c15cf454923dfccadd5'
            '1f991c23462def8d502c10e2a2b42cee531f0c43c57c6929c00b78bde947c1f8612a4ffd989fce1e394331dac71626326d90acae0d9019a2a86f16a592ca0e51'
            '1624ca5ba9502afbcfe8c603590c884c3081162a94f86eded74ec8f1e2a1a2ca03694e2bef4190473b6c34230a478b2e95a87b5c458ff60028ca9b740cc173cd')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname"
  git submodule add -f $srcdir/seqan-clasp extensions/seqan-clasp
  git submodule add -f $srcdir/cando extensions/cando
}

build() {
  cd "$_srcname/"
  cp ../wscript.config .
  sed -i s/\"--link-static\",//g wscript
  sed -i "s/# CLANG_LIBRARIES = \[ 'clang-cpp' \]/CLANG_LIBRARIES = \[ 'clang-cpp' \]/g" wscript
  sed -i s/stlib/lib/g extensions/cando/wscript
  sed -i s/STLIB/LIB/g extensions/cando/wscript
  ./waf configure --enable-jupyter
  CLASP_QUICKLISP_DIRECTORY=$srcdir/quicklisp-client-version-$_qlver ./waf build_dboehmprecise
}

package() {
  cd "$_srcname/"
  ./waf install_dboehmprecise --destdir "$pkgdir"
  install -o root -m 755 ../clasp.sh "$pkgdir/usr/bin/clasp"
  CLASP_QUICKLISP_DIRECTORY=$srcdir/quicklisp-client-version-$_qlver CLASP_FEATURES=ignore-extensions ./build/boehmprecise/iclasp-boehmprecise -N -l 'quicklisp:setup.lisp' -e '(ql:quickload :common-lisp-jupyter)' -e "(clj:install :use-implementation t :system t :bin-path \"/usr/bin/clasp\" :prefix \"$pkgdir\")"
  CLASP_QUICKLISP_DIRECTORY=$srcdir/quicklisp-client-version-$_qlver ./build/boehmprecise/icando-boehmprecise -N -e '(ql:quickload :cando-jupyter)' -e "(cando-jupyter:install :system t :bin-path \"/usr/bin/icando\" :prefix \"$pkgdir\")" \
    -e "(cando-jupyter:install :system t :image t :bin-path \"/usr/bin/cando\" :prefix \"$pkgdir\")"
  sed -i '/"\/usr\/bin\/clasp",.*/a     "--load", "quicklisp:setup.lisp",' $pkgdir/usr/share/jupyter/kernels/common-lisp_clasp/kernel.json
  mkdir -p "$pkgdir/usr/lib/clasp/src/lisp/modules/quicklisp"
  cp -ra $srcdir/quicklisp-client-version-$_qlver/* "$pkgdir/usr/lib/clasp/src/lisp/modules/quicklisp/"
}

