# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: dreieck
# Contributor: nem <nem at posteo dot net>
# Submitter: nem <nem at posteo dot net> 

_pkgname="adms"
pkgname="${_pkgname}-git"
pkgver=2.3.7.r25.gcadf421
pkgrel=2
pkgdesc="ADMS is a codegenerator for the VERILOG-A(MS) language"
arch=(
  'x86_64'
  'i686'
)
url="https://github.com/qucs/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=(
  'gcc'
  'git'
  'autoconf'
  'automake'
  'bison'
  'flex'
  'perl-gd'
  'perl-xml-libxml'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}"
  "0001-Fix-incorrect-argument-given-to-verilogaparse.patch::${url}/pull/117.patch"
)
b2sums=('SKIP'
        '7a87dfea134fd1a9bd528baf6b84b2f2323f68008183083bb8e7eba8a456a4e53dff4eb80cb7e36d335036235208a82cef6140db8a7921c672fe4b2b103f2054')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r 's/^release-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Apply patch to fix verilogaparse incorrect argument
  # See upstream: https://github.com/Qucs/ADMS/pull/117
  patch -Np1 <  "../0001-Fix-incorrect-argument-given-to-verilogaparse.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
