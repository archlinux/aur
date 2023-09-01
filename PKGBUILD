# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: xantares < xantares09 at hotmail dot com >

_commit=a8cce8bd8065bbf80bd47219f85f0cd9cf27dd0c  # 0.25.0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-p11-kit
pkgver=0.25.0
pkgrel=2
pkgdesc="Provides a way to load and enumerate PKCS#11 modules (mingw-w64)"
arch=('any')
url="https://p11-glue.freedesktop.org"
license=('BSD')
depends=('mingw-w64-crt'
         'mingw-w64-gettext'
         'mingw-w64-libtasn1'
         'mingw-w64-libffi')
makedepends=('mingw-w64-meson'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://github.com/p11-glue/p11-kit?#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/p11-kit"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}"/p11-kit

  # https://github.com/p11-glue/p11-kit/pull/541
  sed -i 's/struct ck_interface \*\*interface/struct ck_interface \*\*interface_/' common/pkcs11.h
}

build() {
  cd "${srcdir}"/p11-kit
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson \
      --buildtype=release \
      --default-library=both \
      -D 'gtk_doc=false' \
      -D 'trust_module=disabled' \
      ..
    sed -i 's|-Wl,--end-group|-lintl -Wl,--end-group|g' build.ninja
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/p11-kit/build-${_arch}
    DESTDIR="${pkgdir}" ninja install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm -r "${pkgdir}"/usr/${_arch}/share
    rm -r "${pkgdir}"/usr/${_arch}/lib/p11-kit
    rm -r "${pkgdir}"/usr/${_arch}/etc
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
