# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=jed-git
_pkgname=${pkgname/-git/}
pkgver=0.99.20.135
_pkgver=0.99.20-135
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
sha256sums=('07a6822bece2ead7c2b234a8bb4f95576eef5e6c41ea9f0710b033a320dd2283'
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
