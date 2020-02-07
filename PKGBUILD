# Maintainer: Lubosz Sarnecki <lubosz ! gmail ! com>
# Arch Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: linkmauve <linkmauve@linkmauve.fr>
# Contributor: mokkurkalve <xenofil@gmail.com>

pkgname=libkate-python3-git
pkgver=0.4.1
pkgrel=6
pkgdesc="A karaoke and text codec for embedding in ogg. With fixes and port to Python 3 of before broken KateDJ."
url="https://wiki.xiph.org/OggKate"
license=('BSD')
arch=('x86_64')
depends=('libpng' 'libogg' 'python3')
conflicts=('libkate')
replaces=('libkate')
provides=('libkate='${pkgver})
makedepends=('pkg-config' 'git')
optdepends=('python-wxpython: for KateDJ'
            'liboggz: for KateDJ')
source=("$pkgname::git+https://gitlab.com/lubosz/kate.git#branch=python3")
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}"

  export PYTHON="/usr/bin/python3"
  ./configure --prefix=/usr \
              --disable-static \
              --disable-doc
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  python3 -m compileall "${pkgdir}/usr/lib/python3.8/site-packages/kdj/"
}
