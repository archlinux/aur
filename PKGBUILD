# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: xantares < xantares09 at hotmail dot com >

_commit=787888e181543f5a85eb69d6a3caf14f9a4262b2  # after build failure fix
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-p11-kit
pkgver=0.23.16.1+18+g787888e
pkgrel=1
pkgdesc="Provides a way to load and enumerate PKCS#11 modules (mingw-w64)"
arch=('any')
url="https://p11-glue.freedesktop.org"
license=('BSD')
depends=('mingw-w64-crt'
         'mingw-w64-libtasn1'
         'mingw-w64-libffi')
makedepends=('mingw-w64-configure'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://github.com/p11-glue/p11-kit?#commit=${_commit}"
        "0001-Build-and-install-libnssckbi-p11-kit.so.patch")
sha256sums=('SKIP'
            '0736f74cec5ca49d91afa47cd84f9ac0404947bf0064358e22c3e53b69e82798')

pkgver() {
  cd "${srcdir}/p11-kit"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}"/p11-kit
  # Build and install an additional library (libnssckbi-p11-kit.so) which
  # is a copy of p11-kit-trust.so but uses the same label for root certs as
  # libnssckbi.so ("Builtin Object Token" instead of "Default Trust")
  # https://bugs.freedesktop.org/show_bug.cgi?id=66161
  patch -Np1 -i ../0001-Build-and-install-libnssckbi-p11-kit.so.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}"/p11-kit
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-static --disable-silent-rules --disable-trust-module
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/p11-kit/build-${_arch}
    make install DESTDIR="${pkgdir}"
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm -r "${pkgdir}"/usr/${_arch}/libexec
    rm -r "${pkgdir}"/usr/${_arch}/etc
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
