# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=voltron-git
pkgver=20150223
pkgrel=1
pkgdesc="UI for GDB, LLDB and Vivisect's VDB"
arch=('any')
depends=('python'
         'python-blessed'
         'python-cherrypy'
         'python-flask'
         'python-pygments'
         'python-rl'
         'python-scruffy'
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

  msg 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg 'Fixing placement of dbgentry.py...'
  mv "$pkgdir/usr/dbgentry.py" "$pkgdir/usr/lib/python3.4/site-packages/voltron"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
