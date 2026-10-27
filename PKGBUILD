# Maintainer: Alberto Bonizzi <aseoista at gmail dot com>

pkgname=nurv-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Assumption Based Runtime Verification tool built on nuXmv"
arch=('x86_64')
url="https://es-static.fbk.eu/tools/nurv/"
license=('LicenseRef-NuRV-FBK-License')
provides=('NuRV')
depends=('glib2' 'glibc' 'gmp' 'jsonrpc-glib' 'libbsd' 'libgcc' 'libstdc++' 'ncurses' 'util-linux-libs' 'xz' 'zlib')
optdepends=('python: For the Python examples and generated Python monitors')
makedepends=('patchelf')

source_x86_64=("NuRV-${pkgver}-linux64.tar.xz::https://es-static-lfs.fbk.eu/access/unit/es-tools-releases/NuRV/${pkgver}/NuRV-${pkgver}-linux64.tar.xz")

sha256sums_x86_64=('b20ec03f53bea50831ae302ac9d8e90f4a8d77f7de2dbc39440e3b72e0c9d09f')

package() {
  _output="${srcdir}/NuRV-${pkgver}-linux64"
  local _libdir="${CARCH}-linux-gnu"

  install -Dm755 \
    "${_output}/usr/local/bin/NuRV" \
    "${_output}/usr/local/bin/NuRV_orbit" \
    -t "${pkgdir}/usr/bin/"

  install -Dm755 \
    "${_output}/usr/local/lib/${_libdir}/libedit.so.2" \
    "${_output}/usr/local/lib/${_libdir}/libicudata.so.70" \
    "${_output}/usr/local/lib/${_libdir}/libicuuc.so.70" \
    "${_output}/usr/local/lib/${_libdir}/libxml2.so.2" \
    "${_output}/usr/local/lib/${_libdir}/libORBit-2.so.0" \
    "${_output}/usr/local/lib/${_libdir}/libORBitCosNaming-2.so.0" \
    -t "${pkgdir}/usr/lib/nurv/"

  local _share="${_output}/usr/local/share"
  find "${_share}" -type f | while read -r f; do
    install -Dm644 "${f}" "${pkgdir}/usr/share/${f#"${_share}"/}"
  done

  install -Dm644 "${_output}/nurv-manual.pdf" "${_output}/NEWS.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

  patchelf --force-rpath --set-rpath '/usr/lib/nurv' "${pkgdir}/usr/bin/NuRV"
  patchelf --force-rpath --set-rpath '/usr/lib/nurv' "${pkgdir}/usr/bin/NuRV_orbit"

  patchelf --force-rpath --set-rpath '$ORIGIN' "${pkgdir}/usr/lib/nurv/libicuuc.so.70"
  patchelf --force-rpath --set-rpath '$ORIGIN' "${pkgdir}/usr/lib/nurv/libxml2.so.2"
  patchelf --force-rpath --set-rpath '$ORIGIN' "${pkgdir}/usr/lib/nurv/libORBitCosNaming-2.so.0"

  install -Dm644 "${_output}/LICENSE.txt" "${_output}/LICENSE_FOR_EVALUATION.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
