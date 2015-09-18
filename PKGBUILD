# Maintainer: Keith Scheiwiller <k.scheiw@gmail.com>

_pyver="python2"
pkgname=voltron-python2-git
pkgver=20150517
pkgrel=1
pkgdesc="UI for GDB, LLDB and Vivisect's VDB"
arch=('any')
depends=("${_pyver}"
         "${_pyver}-blessed"
         "${_pyver}-cherrypy"
         "${_pyver}-flask"
         "${_pyver}-pygments"
         "${_pyver}-rl"
         "${_pyver}-scruffy"
         "readline")
makedepends=("git" "${_pyver}-setuptools")
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
  ${_pyver} setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg 'Installing...'
  ${_pyver} setup.py install --root="$pkgdir" --optimize=1

  msg 'Fixing placement of dbgentry.py...'
  mv "$pkgdir/usr/dbgentry.py" "$pkgdir/usr/lib/python2.7/site-packages/voltron"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
