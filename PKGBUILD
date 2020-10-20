# Maintainer:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=python-pyfltk-svn
_fullpkgname=${pkgname%-svn}
_pkgname=${_fullpkgname#python-}
pkgver=r532
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('x86_64')
url="http://pyfltk.sourceforge.net/"
license=('LGPL')
depends=('fltk>=1.3.5' 'python>=3.7' 'glu')
makedepends=('swig>=3.0.12' 'python-setuptools' 'subversion')
provides=("${_fullpkgname}")
conflicts=("${_fullpkgname}")
source=("svn://svn.code.sf.net/p/pyfltk/code/trunk"
        "pyfltk_swig_silence_warnings.patch"
        "pyfltk_python3.patch"
        "pyfltk_remove_percent_format.patch")
sha1sums=('SKIP'
          '11aa48bcdc21b77e4ea53f986352d85eedf2a900'
          '8c88777b373d7a72f4a0cdbb264f4371931dbb7b'
          'a105e1ca3592c880634503c9faa558bcc21a6636')

pkgver() {
  cd "$srcdir/trunk"
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
  cd "$srcdir/trunk/$_pkgname"
  patch -p3 -i "${srcdir}/pyfltk_swig_silence_warnings.patch"
  patch -p3 -i "${srcdir}/pyfltk_python3.patch"
  patch -p3 -i "${srcdir}/pyfltk_remove_percent_format.patch"
}

build() {
  cd "$srcdir/trunk/$_pkgname/python"
  python MakeSwig.py
}

package() {
  cd "$srcdir/trunk/$_pkgname/util"
  python setup.py install --root="${pkgdir}/" --optimize=1

  cd "$srcdir/trunk/$_pkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
