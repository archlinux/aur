# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: <nontlikeuname at tuta dot io>

pkgname=mingw-w64-atk
pkgver=2.34.0
pkgrel=1
pkgdesc="Interface definitions of accessibility infrastructure (mingw-w64)"
arch=('any')
url="https://gitlab.gnome.org/GNOME/atk"
license=('LGPL')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'python' 'git')
depends=('mingw-w64-crt' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
_commit=ae00132c6ef58d779e9389a10badb2f43ee35606  # tags/ATK_2_34_00^0
source=("git+https://gitlab.gnome.org/GNOME/atk.git#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/atk"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson \
      --buildtype=plain \
      --default-library=both \
      -Ddocs=false \
      -Dintrospection=false \
      -Dstrip=false \
      ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" meson install -C ${srcdir}/atk/build-${_arch}
    
    rm -r ${pkgdir}/usr/${_arch}/share

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
