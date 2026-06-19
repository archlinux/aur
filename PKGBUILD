# Maintainer: Alberto Bonizzi <aseoista at gmail dot com>

pkgname=nuxmv-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="State of the art, infinite state model checker built on NuSMV"
arch=('x86_64')
url="https://nuxmv.fbk.eu/"
license=('LicenseRef-nuXmv-FBK-License')
provides=('nuXmv')
depends=('gcc-libs' 'glibc' 'util-linux-libs')
optdepends=('python: For using conversion scripts')
makedepends=('patchelf')

source_x86_64=("nuXmv-${pkgver}-linux64.tar.xz::https://nuxmv.fbk.eu/downloads/${pkgver}/nuXmv-${pkgver}-linux64.tar.xz")
source=("nuxmv.pc")

sha256sums_x86_64=('a495d6de6bb8c95dc9c5ad3368833a897ac2f14841c18624f0e10cbdf28da259')
sha256sums=('50c47088b2d434a3d2e243ae2d54f5c157dcd044563a89ede8622d6a508041c2')

package() {
  _output="${srcdir}/nuXmv-${pkgver}-linux64"

  install -Dm755 "${_output}/usr/local/bin/nuXmv" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${_output}/usr/local/include/nuxmv.h" -t "${pkgdir}/usr/include/"
  install -Dm755 "${_output}/usr/local/lib/x86_64-linux-gnu/libnuxmv.so" -t "${pkgdir}/usr/lib/"

  install -Dm755 \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libbsd.so.0" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libedit.so.2" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libgmp.so.10" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libicudata.so.70" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libicuuc.so.70" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/liblzma.so.5" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libmd.so.0" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libtinfo.so.6" \
    "${_output}/usr/local/lib/x86_64-linux-gnu/libxml2.so.2" \
    -t "${pkgdir}/opt/nuXmv/lib/"

  local _doc="${_output}/usr/local/doc"
  find "${_doc}" -type f | while read -r f; do
    install -Dm644 "${f}" "${pkgdir}/usr/share/doc/${pkgname}/${f#"${_doc}"/}"
  done

  local _share="${_output}/usr/local/share"
  find "${_share}" -type f | while read -r f; do
    install -Dm644 "${f}" "${pkgdir}/usr/share/${f#"${_share}"/}"
  done

  patchelf --force-rpath --set-rpath '/opt/nuXmv/lib' "${pkgdir}/usr/bin/nuXmv"
  patchelf --force-rpath --set-rpath '/opt/nuXmv/lib' "${pkgdir}/usr/lib/libnuxmv.so"

  patchelf --force-rpath --set-rpath '$ORIGIN' "${pkgdir}/opt/nuXmv/lib/libicuuc.so.70"
  patchelf --force-rpath --set-rpath '$ORIGIN' "${pkgdir}/opt/nuXmv/lib/libxml2.so.2"

  install -Dm644 "${srcdir}/nuxmv.pc" -t "${pkgdir}/usr/lib/pkgconfig/"
  install -Dm644 "${_output}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
