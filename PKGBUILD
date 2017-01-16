# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libvisual
pkgver=0.4.0
pkgrel=1
pkgdesc="Abstraction library that comes between applications and audio visualisation plugins (mingw-w64)"
arch=('any')
url="http://sourceforge.net/projects/libvisual/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/sourceforge/libvisual/libvisual-${pkgver}.tar.gz"
  "0003-Add-long-long-check-for-win64.patch"
  "0005-Fix-compilation-in-win64.patch"
  "0008-Remove-malloc-realloc-configure-checks-they-re-broke.patch"
  "0010-Only-define-inline-and-friends-if-they-re-not-define.patch"
  "0011-Fix-autoreconf-when-using-our-gettext-version.patch"
  "0012-configure-gettext-0.18-is-enough-no-0.18.2-needed.patch"
  "0013-Include-lv_cpu.h-for-visual_cpu_initialize.patch"
  "0014-Add-forward-declaration-of-visual_transform_init-as-.patch"
  "0015-Include-lv_cpu.h-in-another-place-too.patch"
  "0016-configure.ac-Use-gettext-0.19.patch")
sha256sums=('0b4dfdb87125e129567752089e3c8b54cefed601eef169d2533d8659da8dc1d7'
  'ad26dc477e09e1cdc28a29e4d1bc7d45ae3db7741d38a1bd56bccfef96bcefaa'
  'f5e3eb5e7b2993618be9ac034ac7ac943fb68d3db1cde05f60f406b22666a8b6'
  '4c8ec4b57fe6d795c822587657f7cf82db33013910f27e8df473138b86b3c183'
  'f23b4a631bf54fe6479d00d30215519846b2e57563d46d158d3f7bf406105d08'
  '7bc8057ad0c45bf89544f65e5a4eda01b6047552282701f74574be86dad593a5'
  '628e473f90520c57d4ba1b5ff1703ea7cd8bba712c2f15f166e1316dbfd2d8c5'
  '8aac578ffa19f564aa7f29d19ff0441bb7118df74932c37ff23d48b98dfdd7ba'
  '3714354e1702b0356b8a28b72008031d3dd1f0e1aadea1eddaae484338050892'
  'aba48dff1437893aca111cb48e1a1043205fe5768d341e587e3a65d3d8d5082d'
  '1607465d32962af516e815295d5c0800745b369b41a767e92e134cf0488c52f1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "libvisual-$pkgver"
  patch -Np1 -i "$srcdir/0003-Add-long-long-check-for-win64.patch" 
  patch -Np1 -i "$srcdir/0005-Fix-compilation-in-win64.patch" 
  patch -Np1 -i "$srcdir/0008-Remove-malloc-realloc-configure-checks-they-re-broke.patch" 
  patch -Np1 -i "$srcdir/0010-Only-define-inline-and-friends-if-they-re-not-define.patch" 
  patch -Np1 -i "$srcdir/0011-Fix-autoreconf-when-using-our-gettext-version.patch" 
  patch -Np1 -i "$srcdir/0012-configure-gettext-0.18-is-enough-no-0.18.2-needed.patch" 
  patch -Np1 -i "$srcdir/0013-Include-lv_cpu.h-for-visual_cpu_initialize.patch" 
  patch -Np1 -i "$srcdir/0014-Add-forward-declaration-of-visual_transform_init-as-.patch" 
  patch -Np1 -i "$srcdir/0015-Include-lv_cpu.h-in-another-place-too.patch" 
  patch -Np1 -i "$srcdir/0016-configure.ac-Use-gettext-0.19.patch" 
  autoreconf -f -i
}


build() {
  for _arch in ${_architectures}; do
    [[ -d "build-${_arch}" ]] && rm -rf "build-${_arch}"
    cp -rf "$srcdir/libvisual-${pkgver}" "${srcdir}/build-${_arch}"
    pushd build-${_arch}
    ${_arch}-configure .
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir"/usr/${_arch}/share/locale
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
