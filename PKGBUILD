# Maintainer: Alexander Jacocks <alexander@redhat.com>
pkgname=raptor-cos
_pkgname=raptor
pkgver=0.8.0
pkgrel=1
pkgdesc="Raptor is a vertically-scrolling shoot 'em up. It features smooth scrolling VGA graphics, a variety of enemies on ground, air and sea, and an original soundtrack. (from https://www.mobygames.com/game/511/raptor-call-of-the-shadows/)"
arch=('x86_64')
url="https://github.com/skynettx/raptor"
license=('GPL2')
depends=(
  'alsa-lib'
  'fluidsynth'
  'sdl2'
  'soundfont-fluid'
  )
makedepends=(
  'cmake'
  'unzip'
  )
source=(
  ${pkgname}-${pkgver}.tgz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "ftp://ftp.3drealms.com/share/1rap12.zip"
  'raptor-cos.sh'
  )
sha256sums=('14ef26b8f2dfb3654e84c3867c331bdb13988de127b60a52199b0547f27f23dc'
            '7d6b062dcdc76d9ea02d8d71af14e5043223581d792f6ead4eb1316fd0351552'
            '1170c76805d7cb2096b54ed7eca0a7dd390765073a70e4cf7afa721f01c1ce5a')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  { test "$(nproc)" -gt 1 && cmake --build build -j"$(nproc)" ;} || cmake --build build }
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
  unzip -o 1rap12.zip RAPSW12.SHR
  unzip -o RAPSW12.SHR FILE0000.GLB FILE0001.GLB
  install -Dm644 "$srcdir/FILE0000.GLB" "$pkgdir"/usr/share/${pkgname}/FILE0000.GLB
  install -Dm644 "$srcdir/FILE0001.GLB" "$pkgdir"/usr/share/${pkgname}/FILE0001.GLB
  install -Dm755 "$srcdir/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s /usr/share/soundfonts/FluidR3_GM.sf2 "$pkgdir"/usr/share/${pkgname}/SoundFont.sf2
  cd build/bin
  install -Dm755 "${_pkgname}" "$pkgdir"/usr/share/${pkgname}/${pkgname}
  cd ../../${_pkgname}-${pkgver}
  install -Dm644 'SETUP(MIDI).INI' "$pkgdir"/usr/share/${pkgname}/SETUP.INI
}
