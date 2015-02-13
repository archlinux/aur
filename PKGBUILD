# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=ePad
pkgname=${_pkgname,,}-git
pkgver=0.9.0.r132.de6c818
pkgrel=1
pkgdesc='Simple text editor using Python and EFL'
arch=('any')
url='https://github.com/JeffHoogland/ePad'
license=('GPL3')
depends=('python-efl' 'python-elmextensions-git' 'bash')
makedepends=('git')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=('git://github.com/JeffHoogland/ePad.git')
sha256sums=('SKIP')

prepare() {
  sed -i 's|/opt/ePad/|/usr/share/epad/|' "$srcdir/$_pkgname/epad"
}

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F '"' '/^__version__/ {print $2}' ePad.py)

  printf "${v_ver%-*}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm644 ePad.py "$pkgdir/usr/share/epad/ePad.py"
  install -Dm755 epad "$pkgdir/usr/bin/epad"
  install -Dm644 epad.1 "$pkgdir/usr/share/man/man1/epad.1"

# compile python files
  python -m compileall -q "$pkgdir"
  python -O -m compileall -q "$pkgdir"
}
