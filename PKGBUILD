# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=jed-git
_pkgname=${pkgname/-git/}
pkgver=0.99.20.128
_pkgver=0.99.20-128
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
source=("http://www.jedsoft.org/snapshots/jed-pre${_pkgver}.tar.gz" 
'jed-git.install')
sha256sums=('51a98c72064b4654ec8143643478a6d98d2642081d06d994aa90a0d7ddd2e7e1'
            '9728389557f10ef35aedaf827f218a87dbe529c72bda478d0426624fa85aec4f')
install="$pkgname.install"

build() {
  cd "${srcdir}/${_pkgname}-pre${_pkgver}"

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  sed \
	-e "s|\(^all.*\)|\1 xjed rgrep|" \
	-e "s|..DEST.*doc|${pkgdir}/usr/share/doc/${pkgname}|g" \
	-i src/Makefile

  make
}

package() {
  cd "${srcdir}/${_pkgname}-pre${_pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install rgrep
  install -Dm755 src/objs/rgrep "$pkgdir/usr/bin"
}
