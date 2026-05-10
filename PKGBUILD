# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=qmd
_npmname="@tobilu/qmd"
pkgver=2.1.0
pkgrel=3
pkgdesc="On-device search engine for markdown files with BM25, vector, and LLM-powered search"
arch=('x86_64')
url="https://github.com/tobi/qmd"
license=('MIT')
depends=('nodejs>=22' 'libstdc++.so' 'libgcc')
makedepends=('npm' 'patchelf')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/qmd-${pkgver}.tgz")
sha256sums=('4f1b000c5b9daa36fcf5d05228d7966fd7df87607af572fca3360597f64286e6')

latestver() {
  curl -s "https://registry.npmjs.org/${_npmname}" | jq -r '.["dist-tags"].latest'
}

build() {
  npm install --cache "${srcdir}/npm-cache" \
    --prefix="${srcdir}/staging" \
    --global \
    --omit=peer \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
}

package() {
  install -d "${pkgdir}/usr/lib/node_modules/@tobilu"
  cp -a "${srcdir}/staging/lib/node_modules/@tobilu/qmd" "${pkgdir}/usr/lib/node_modules/@tobilu/qmd"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/@tobilu/qmd/bin/qmd" "${pkgdir}/usr/bin/qmd"

  # License
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@tobilu/qmd/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Keep only CPU x86_64 llama binaries (remove CUDA, Vulkan, ARM variants)
  local node_root="${pkgdir}/usr/lib/node_modules/@tobilu/qmd"
  local llama_dir="${node_root}/node_modules/@node-llama-cpp"
  for d in "${llama_dir}"/*/; do
    [[ "$(basename "$d")" == "linux-x64" ]] && continue
    rm -rf "$d"
  done

  # Remove non-linux native modules
  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*android*' -o -name '*freebsd*' -o -name '*-musl*' \) \
    -delete 2>/dev/null || true

  # Remove native prebuilds for non-target Linux architectures
  find "${node_root}" -path '*/prebuilds/linux-arm64' -type d \
    -exec rm -rf {} + 2>/dev/null || true

  # Upstream llama libraries ship RUNPATH=$ORIGIN:, where the trailing empty
  # entry makes the dynamic linker search the current working directory.
  find "${node_root}/node_modules/@node-llama-cpp/linux-x64/bins/linux-x64" \
    -type f \( -name '*.so' -o -name '*.node' \) \
    -exec patchelf --set-rpath '$ORIGIN' {} +

  # Remove build artifacts with $srcdir references, but keep the native .node binding
  find "${node_root}/node_modules/better-sqlite3/build" -type f \
    ! -name '*.node' -delete 2>/dev/null || true
  find "${node_root}/node_modules/better-sqlite3/build" -type d -empty \
    -delete 2>/dev/null || true

  # Remove peer deps not needed at runtime (dist/ is prebuilt JS)
  rm -rf "${node_root}/node_modules/typescript"
  # Clean dangling .bin symlinks left by removed peer deps
  find "${node_root}/node_modules/.bin" -xtype l -delete 2>/dev/null || true

  # Remove build obj.target hardlink duplicates
  rm -rf "${node_root}/node_modules/better-sqlite3/build/Release/obj.target"
}
