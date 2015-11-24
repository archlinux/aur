# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=voltron-git
pkgver=20151109
pkgrel=1
pkgdesc="UI for GDB, LLDB and Vivisect's VDB"
arch=('any')
depends=('python'
         'python-blessed'
         'python-cherrypy'
         'python-flask'
         'python-pygments'
         'python-rl'
         'python-scruffington'
         'readline')
makedepends=('git' 'python-setuptools')
optdepends=('gdb: GDB'
            'lldb: LLDB'
            'vivisect: VDB')
url="https://github.com/snare/voltron"
license=('Beerware')
options=('!emptydirs')
source=(${pkgname%-git}::git+https://github.com/snare/voltron)
sha256sums=('SKIP')
provides=('voltron')
conflicts=('voltron')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing docs...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Fixing placement of dbgentry.py...'
  _pysite=$(python -c \
    'from distutils.sysconfig import get_python_lib; print(get_python_lib())'
  )
  mv "$pkgdir/usr/dbgentry.py" "$pkgdir/$_pysite/voltron"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
