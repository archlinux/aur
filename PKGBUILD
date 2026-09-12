# Maintainer: robertfoster
pkgname=meshcore-open-bin
_pkgname="${pkgname%-bin}"
pkgver=9.5.1 # renovate: datasource=github-releases depName=zjs81/meshcore-open extractVersion=^PRE-BETA-(?<version>.+)$
pkgrel=1
pkgdesc="Open-source Flutter client for MeshCore LoRa mesh networking devices"
arch=('x86_64')
url="https://github.com/zjs81/meshcore-open"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gtk3' 'xdg-user-dirs' 'zlib')
makedepends=('patchelf')
optdepends=('vulkan-icd-loader: GPU acceleration for on-device message translation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/PRE-BETA-${pkgver}/meshcore-linux-release.zip"
  "LICENSE::https://raw.githubusercontent.com/zjs81/meshcore-open/PRE-BETA-${pkgver}/LICENSE"
  "${_pkgname}.desktop")

prepare() {
  cd "${srcdir}/bundle"

  # the bundle is AOT (lib/libapp.so carries the Dart snapshots), so the leftover
  # JIT kernel is 111 MiB of never-loaded payload
  rm data/flutter_assets/kernel_blob.bin

  # upstream ships build-host and bazel-tree RUNPATHs, so these libraries cannot
  # find the ones shipped next to them (libonnxruntime.so.1, libLiteRt.so, ...)
  local _lib
  for _lib in libfile_selector_linux_plugin libflutter_onnxruntime_plugin \
    liburl_launcher_linux_plugin libLiteRtLm libLiteRtTopKWebGpuSampler; do
    patchelf --set-rpath '$ORIGIN' "lib/${_lib}.so"
  done

  # upstream duplicates every versioned library as a full copy
  ln -sf libonnxruntime.so.1.22.0 lib/libonnxruntime.so.1
  ln -sf libonnxruntime.so.1 lib/libonnxruntime.so
  local _soname
  for _soname in lib/*.so.0; do
    ln -sf "${_soname##*/}" "${_soname%.0}"
  done
}

package() {
  install -d "${pkgdir}/usr/lib/${_pkgname}" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/bundle/." "${pkgdir}/usr/lib/${_pkgname}/"
  ln -s "/usr/lib/${_pkgname}/meshcore_open" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/bundle/data/flutter_assets/assets/images/mesh-icon.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('5a34e87885722d523383395dcef3098d0c92bc04856404f3c47f726e846f012c'
            '00fb1faaf18628b7be50522b3ae5c42af771ac3bb1e7907dd35338f39fb000fa'
            '42ab4bb9a565b5caa26d77cca02d7cdc044b7b2703275e500ef579b699c62d36')
