# vim: set ft=sh:
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=pypy3
pkgname=$_pkgname-hg
pkgver=r84916+.ef5a7f148b27+
pkgrel=1
pkgdesc="A Python3 implementation written in Python, JIT enabled (HG py3k branch)"
url="http://pypy.org"
arch=('i686' 'x86_64')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('python2' 'sqlite' 'tk')
optdepends=('sqlite: sqlite module'
            'tk: tk module')
provides=('pypy3')
conflicts=('pypy3')
options=(!buildflags)
license=('custom:MIT')
source=("$_pkgname"::"hg+https://bitbucket.org/pypy/pypy#branch=py3k"
        no-ssl3.patch)
md5sums=('SKIP'
         '257d7f371d0087817ad8356f7ede161b')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  patch -i ../no-ssl3.patch -Np1
}

build() {
  cd "$srcdir/$_pkgname"

  python2 rpython/bin/rpython -Ojit pypy/goal/targetpypystandalone.py
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 pypy-c "${pkgdir}"/opt/pypy3/bin/pypy-c
  install -Dm755 libpypy-c.so "${pkgdir}"/opt/pypy3/bin/libpypy-c.so
  cp -r include lib_pypy site-packages "${pkgdir}"/opt/pypy3/

  mkdir "${pkgdir}"/opt/pypy3/lib-python/
  cp -r lib-python/3 "${pkgdir}"/opt/pypy3/lib-python/

  mkdir -p "${pkgdir}"/usr/bin
  ln -s /opt/pypy3/bin/pypy-c "${pkgdir}"/usr/bin/pypy3

  install -Dm644 LICENSE "${pkgdir}"/opt/pypy3/LICENSE
  install -Dm644 README.rst "${pkgdir}"/opt/pypy3/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/pypy3/LICENSE

  # Compile binary modules
  export LD_LIBRARY_PATH="${pkgdir}"/opt/pypy3:${LD_LIBRARY_PATH}
  for module in _curses syslog dbm sqlite3 _tkinter; do
    "${pkgdir}/opt/pypy3/bin/pypy-c" -c "import ${module}"
  done

  # Generate bytecode
  "${pkgdir}"/opt/pypy3/bin/pypy-c -m compileall "${pkgdir}"/opt/pypy3 || echo Unable to compile all libraries
  "${pkgdir}"/opt/pypy3/bin/pypy-c -O -m compileall "${pkgdir}"/opt/pypy3 || echo Unable to optimize all libraries

}
# vim: ts=2 sw=2 et:
