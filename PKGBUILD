# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgbase=thunarx-python
pkgname=('python2-thunarx' 'python-thunarx')
epoch=1
pkgver=0.5.1+5+g0d16722
pkgrel=1
pkgdesc="Thunarx Python Bindings"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://gitlab.xfce.org/bindings/thunarx-python'
makedepends=('thunar>=1.7.0' 'python2-gobject' 'python-gobject' 'git' 'xfce4-dev-tools')
license=('GPL')
_commit='0d167220adb5c3a4a80da5e801611d13d12d29f1'
source=("git+https://gitlab.xfce.org/bindings/thunarx-python.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase}"
  git describe --long --tags | sed -r "s:^${pkgbase}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  [ -d "${pkgbase}"-py2 ] && rm -fr "${pkgbase}"-py2
  cp -r "${pkgbase}" "${pkgbase}"-py2
}

build() {
  cd "${srcdir}/${pkgbase}"
  PYTHON=python ./autogen.sh --prefix=/usr
  make

  cd "${srcdir}/${pkgbase}"-py2
  PYTHON=python2 ./autogen.sh --prefix=/usr
  make
}

package_python2-thunarx() {
  pkgdesc="${pkgdesc} (python 2)"
  depends=('thunar>=1.7.0' 'python2-gobject')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")
  replaces=("${pkgbase}")

  cd "${pkgbase}"-py2
  make DESTDIR="${pkgdir}" install
}

package_python-thunarx() {
  pkgdesc="${pkgdesc} (python 3)"
  depends=('thunar>=1.7.0' 'python-gobject')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}"
  make DESTDIR="${pkgdir}" install
}

