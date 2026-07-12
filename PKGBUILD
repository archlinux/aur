# Maintainer: ihipop <ihipop@users.noreply.github.com>

pkgname=brscan
pkgver=1.0.1
pkgrel=6
pkgdesc="Open-source SANE backend for Brother MFC/DCP scanners"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/dmikushin/brscan"
license=('GPL-2.0-only' 'LGPL-2.1-only' 'LicenseRef-Brother')
depends=('sane' 'libusb-compat' 'libjpeg-turbo')
makedepends=('cmake' 'libusb' 'ninja' 'patchelf' 'pkgconf')
conflicts=('brscan-bin' 'brscan2' 'brscan3' 'brscan4' 'brscan5')
backup=('etc/sane.d/dll.d/brscan.conf')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'brscan-1.0.1-arch-fixes.patch'
  'brscan-extra-models.txt'
  'brscan.conf'
  '60-brscan.rules'
)
b2sums=('2b4250ea0f02a1aef9b6c7bfb8ab38745ff11387f0545e982f802c54afa07103d99d249e06807bace81e1c510b2422bfae2b0b78df15a66a5ddeae14360db5b5'
        '8a4e0009f141396040d24ee56c66e1f5bab7989c882924eb0e6ae4c51e0fc15045d1a4b40e18761d1423da6a2326e9c0197437771024762d7914469c2e020a05'
        '05752fcd7e740684d85bcf7ceb48897008fa7b57fc2f93b50df30cdc8b0ba8ca89842eb82620fef2be1aa36d66b8a08aa4005c6074e736f501a257d2c616d1e1'
        'ab8364e68de0fbc8cfe82013f2a1313b477f05db03dcf0bbff3345aee2d9ce6e82205babf9b2cccb858728b209d0e0d3450d5ee027faead6776f2bdb0197bdd4'
        'e81319e87083d8785489a3c4c5621939c821f3e9d78d39b7272f739e791720ee02aadf6152c96bfb0c319b1770841a08e7c60617aa71d031827634d945d6e25f')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/brscan-1.0.1-arch-fixes.patch"
  while IFS= read -r model; do
    [[ -z "${model}" || "${model}" == \#* ]] && continue
    grep -Fxq "${model}" data/Brsane.ini ||
      sed -i "/^\\[Support Model\\]$/a ${model}" data/Brsane.ini
  done < "${srcdir}/brscan-extra-models.txt"
}

build() {
  cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS="${CFLAGS} ${CPPFLAGS} -ffile-prefix-map=${srcdir}=. -fmacro-prefix-map=${srcdir}=." \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${CPPFLAGS} -ffile-prefix-map=${srcdir}=. -fmacro-prefix-map=${srcdir}=." \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBRSCAN_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  patchelf --set-rpath '$ORIGIN/../lib/sane' "${pkgdir}/usr/bin/brsaneconfig"

  install -Dm644 brscan.conf "${pkgdir}/etc/sane.d/dll.d/brscan.conf"
  install -Dm644 60-brscan.rules "${pkgdir}/usr/lib/udev/rules.d/60-brscan.rules"

  install -Dm644 "${pkgname}-${pkgver}/Copying" "${pkgdir}/usr/share/licenses/${pkgname}/Copying"
  install -Dm644 "${pkgname}-${pkgver}/copying.lib" "${pkgdir}/usr/share/licenses/${pkgname}/copying.lib"
  install -Dm644 "${pkgname}-${pkgver}/copying.brother" "${pkgdir}/usr/share/licenses/${pkgname}/copying.brother"
}
