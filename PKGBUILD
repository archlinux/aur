# maintainer: libele <libele@disroot.org>

pkgname=python0
pkgver=0.9.1
_rlver=8.1
_tcver=1.3.1
pkgrel=1
pkgdesc="an extensible interpreted programming language"
arch=('i686' 'x86_64')
url="https://www.python.org/download/releases/early/"
license=('CC0')

source=("git+https://github.com/smontanaro/python-${pkgver}"
	"Makefile"
	"https://ftp.gnu.org/gnu/readline/readline-${_rlver}.tar.gz"
	"https://ftp.gnu.org/gnu/termcap/termcap-${_tcver}.tar.gz")

md5sums=('SKIP'
	 'ec5d2d63c6c65cc56b8c48a5eed20b02'
	 'e9557dd5b1409f5d7b37ef717c64518e'
	 'ffe6f86e63a3a29fa53ac645faaabdfa')

prepare() {
  cd "${srcdir}"/python-"${pkgver}"/src
  cp -a "${srcdir}"/Makefile .
}

build() {
  cd "${srcdir}"/readline-"${_rlver}"
  ./configure
  make

  cd "${srcdir}"/termcap-"${_tcver}"
  ./configure
  make

  cd "${srcdir}"/python-"${pkgver}"/src
  make
}

package() {
  cd "${srcdir}"/python-"${pkgver}"
  install -Dm755 "${srcdir}"/python-"${pkgver}"/src/python "${pkgdir}"/usr/bin/python0.9
  ln -s /usr/bin/python0.9 "${pkgdir}"/usr/bin/python0
  mv python.man python0.9.1 && gzip python0.9.1
  install -Dm755 "${srcdir}"/python-"${pkgver}"/python0.9.1.gz "${pkgdir}"/usr/share/man/man1/python0.9.1.gz
  ln -s /usr/share/man/man1/python0.9.1.gz "${pkgdir}"/usr/share/man/man1/python0.1.gz
  mkdir -p "${pkgdir}"/usr/lib/python0.9
  cp -a lib/* "${pkgdir}"/usr/lib/python0.9/
}
