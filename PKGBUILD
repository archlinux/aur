# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=peda-git
_gitname=peda
pkgver=1.1.82.b7c7d7a
pkgrel=1
epoch=1
pkgdesc='Python Exploit Development Assistance for GDB'
url='https://github.com/longld/peda'
arch=('any')
license=('custom:Creative Commons')
depends=('gdb' 'binutils' 'nasm' 'python-six')
makedepends=('git')
provides=('peda')
conflicts=('peda')
source=(${pkgname}::git+https://github.com/longld/peda)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed -r 's|v?(.+)|\1|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  rm lib/six.py
  sed '/git clone/d' -i README.md
  sed 's|~/peda/peda.py|/usr/share/peda/peda.py|g' -i README.md
}

build() {
  cd ${pkgname}
  msg2 'Compiling python objects...'
  python -m compileall . >/dev/null
  python -O -m compileall . >/dev/null
}

package() {
  cd ${pkgname}
  install -Dm 644 *.py -t "${pkgdir}/usr/share/${_gitname}"
  install -Dm 644 __pycache__/* -t "${pkgdir}/usr/share/${_gitname}/__pycache__"
  install -Dm 644 lib/*.py -t "${pkgdir}/usr/share/${_gitname}/lib"
  install -Dm 644 lib/__pycache__/* -t "${pkgdir}/usr/share/${_gitname}/lib/__pycache__"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
