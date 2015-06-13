# Maintainer: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-smtpclient-qt5-git
pkgver=r76.781fd40
pkgrel=1
pkgdesc="An SMTP Client writen in C++ for Qt (Mingw-w64)"
arch=('i686' , 'x86_64')
url="https://github.com/bluetiger9/SmtpClient-for-Qt"
license=('LGPL')
depends=('mingw-w64-qt5-base')
makedepends=('git' 'mingw-w64-gcc')
options=(!strip !buildflags !libtool staticlibs)
source=('smtpclient::git+https://github.com/bluetiger9/SmtpClient-for-Qt.git')
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/smtpclient"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e 's|app|lib|g' -i "${srcdir}/smtpclient/SMTPEmail.pro"
}

build() {
  cd "${srcdir}/smtpclient"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-qmake-qt5 ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/smtpclient/build-${_arch}"
    mkdir -p "$pkgdir"/usr/${_arch}/{lib,bin,include}
    cp release/libSMTPEmail.dll.a "$pkgdir"/usr/${_arch}/lib/
    cp release/SMTPEmail.dll "$pkgdir"/usr/${_arch}/bin/
    cp ../src/*.h ../src/SmtpMime "${pkgdir}/usr/${_arch}/include"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
