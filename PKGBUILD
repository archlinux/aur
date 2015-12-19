# $Id: PKGBUILD 95035 2013-08-04 09:44:24Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=pypy33
pkgname=$_pkgname-hg
pkgver=r80861.4af8035b618c
pkgrel=1
pkgdesc="A Python3 implementation written in Python, JIT enabled (Python 3.3 compatible branch)"
url="http://pypy.org"
arch=('i686' 'x86_64')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('python2' 'sqlite' 'tk')
optdepends=('sqlite: sqlite module'
            'tk: tk module')
options=(!buildflags)
license=('custom:MIT')
source=("$_pkgname"::"hg+https://bitbucket.org/pypy/pypy#branch=py3.3")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_pkgname"

  python2 rpython/bin/rpython -Ojit pypy/goal/targetpypystandalone.py
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 pypy-c "${pkgdir}"/opt/pypy33/bin/pypy-c
  install -Dm755 libpypy-c.so "${pkgdir}"/opt/pypy33/bin/libpypy-c.so
  cp -r include lib_pypy site-packages "${pkgdir}"/opt/pypy33/

  mkdir "${pkgdir}"/opt/pypy33/lib-python/
  cp -r lib-python/3 "${pkgdir}"/opt/pypy33/lib-python/

  mkdir -p "${pkgdir}"/usr/bin
  ln -s /opt/pypy33/bin/pypy-c "${pkgdir}"/usr/bin/pypy3.3

  install -Dm644 LICENSE "${pkgdir}"/opt/pypy33/LICENSE
  install -Dm644 README.rst "${pkgdir}"/opt/pypy33/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/pypy33/LICENSE

  # Compile binary modules
  export LD_LIBRARY_PATH="${pkgdir}"/opt/pypy33:${LD_LIBRARY_PATH}
  for module in _curses syslog dbm sqlite3 _tkinter; do
    "${pkgdir}/opt/pypy33/bin/pypy-c" -c "import ${module}"
  done

  # Generate bytecode
  "${pkgdir}"/opt/pypy33/bin/pypy-c -m compileall "${pkgdir}"/opt/pypy33 || echo Unable to compile all libraries
  "${pkgdir}"/opt/pypy33/bin/pypy-c -O -m compileall "${pkgdir}"/opt/pypy33 || echo Unable to optimize all libraries

}
# vim: ts=2 sw=2 et:
