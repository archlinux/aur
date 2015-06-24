# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=jed-git
_pkgname=${pkgname/-git/}
pkgver=0.99.20.108
_pkgver=0.99.20-108
pkgrel=1
pkgdesc="A freely available text editor for Unix and others OS - Latest development version"
arch=('i686' 'x86_64')
url="http://www.jedsoft.org/snapshots/"
license=('GPL')
provides=('jed')
conflicts=('jed')
depends=('gpm' 'slang' 'libxft')
makedepends=('libxext' 'libxt')
options=('!makeflags')
source=("http://www.jedsoft.org/snapshots/jed-pre${_pkgver}.tar.gz" 'jed-git.install')
md5sums=('e06ca131e64e489f38728386afb88b7a'
         'dd95161e54793bc082fa881d67886e21')
install=("$pkgname.install")

build() {
  cd "${srcdir}/${_pkgname}-pre${_pkgver}"

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  sed \
	-e "s_\(^all.*\)_\1 xjed rgrep_" \
	-e "s_..DEST.*doc_${pkgdir}/usr/share/doc/${pkgname}_g" \
	-i src/Makefile

  make
}

package() {
  cd "${srcdir}/${_pkgname}-pre${_pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install rgrep
  install -Dm755 src/objs/rgrep "$pkgdir/usr/bin"
}
