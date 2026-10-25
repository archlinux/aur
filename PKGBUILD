# Maintainer: zabbius <https://github.com/zabbius>
# c0wrk OpenVINO flavor — binary repack of the upstream GitHub Release
# (https://github.com/v0lka/c0wrk). Nothing is compiled locally: the archive
# is the official c0wrk-desktop-linux-amd64-openvino.tar.gz built by
# .github/workflows/release.yml (wails build + stock CPU ONNX Runtime + the
# additive OpenVINO EP stack + embedding model), pinned here by its sha256.
#
# Symmetric counterpart of c0wrk and c0wrk-cuda: same binary, same layout.
# Unlike the CUDA flavor it does NOT replace libonnxruntime.so — the stock
# CPU runtime stays the base, and the OpenVINO execution-provider plugin
# (libonnxruntime_providers_openvino_plugin.so, harvested by
# `make fetch-onnx-openvino` from Intel's digest-pinned PyPI wheel) is
# registered into it at run time together with the OpenVINO/TBB/hwloc runtime
# libraries it needs. All three packages provide `c0wrk-desktop` and conflict
# with each other, so exactly one flavor can be installed at a time.
#
# Intel GPU/NPU execution goes through the system OpenCL/Level Zero stack
# (intel-compute-runtime, level-zero-loader); clinfo and intel-xpu-smi-bin
# are the on-system diagnostic helpers for that stack.
#
# Layout rationale: the app resolves libonnxruntime.so and models/ RELATIVE to
# the real binary path (os.Executable() dereferences the /proc/self/exe
# symlink), so the executable tree lives in /opt/c0wrk and /usr/bin/c0wrk-desktop
# is an absolute symlink — safe by design.

pkgname=c0wrk-openvino
pkgver=0.13.0
pkgrel=1
pkgdesc='Desktop AI coding-agent built with Wails (Go + React) — OpenVINO flavor, upstream release binaries'
arch=(x86_64)
url='https://github.com/v0lka/c0wrk'
license=(MIT)
depends=(gtk3 webkit2gtk-4.1 libx11 intel-compute-runtime level-zero-loader clinfo intel-xpu-smi-bin)
provides=(c0wrk-desktop)
conflicts=(c0wrk-desktop c0wrk c0wrk-cuda c0wrk-zabbius-git c0wrk-zabbius-cuda-git)
options=(!strip)

# Version-independent files: LICENSE and the 512x512 app icon are taken from
# the same tag as the binary (release archives do not ship them); the desktop
# entry is local. Kept on single lines — bump-release.sh rewrites these arrays
# wholesale.
source=("LICENSE::$url/raw/v$pkgver/LICENSE" 'c0wrk.desktop' 'c0wrk.png')
sha256sums=('26a0f4863f365c987a6762b0a48e987136543118989b2f00f2d57c70a45ffd15' '817980d6896b98a304ade9b151125408e83bdc00c0e7f006eb5f6d7bb486fe62' '7004f261089ce6744435156a4c6952e2d4d87ad6eec1a1a9af347ae6a1f76938')

source_x86_64=("c0wrk-desktop-$pkgver-linux-amd64-openvino.tar.gz::$url/releases/download/v$pkgver/c0wrk-desktop-linux-amd64-openvino.tar.gz")
sha256sums_x86_64=('839490445438d93b94c701e34ee164601b770f9723374e69e06cdff0b2f4159a')

package() {
  cd "$srcdir"

  # /opt/c0wrk application tree (binary + stock CPU ONNX Runtime + the
  # OpenVINO execution-provider plugin with its OpenVINO/TBB/hwloc runtime
  # libraries + embedding model, all resolved by the app relative to the real
  # executable path). The internal .onnxruntime(-openvino)-version stamp files
  # are NOT packaged — they only matter for the Makefile stamp policy during
  # a source build.
  install -Dm755 c0wrk-desktop                       "$pkgdir/opt/c0wrk/c0wrk-desktop"
  install -Dm755 libonnxruntime.so                   "$pkgdir/opt/c0wrk/libonnxruntime.so"
  # Flavor-added libraries are installed by glob: their versioned names
  # (libopenvino.so.2641, libtbb.so.12, libhwloc.so.15, …) track the pinned
  # OpenVINO EP wheel and shift on upstream bumps, unlike the CPU base above.
  # Same glob family the Makefile's clean-onnx target enumerates.
  install -Dm755 -t "$pkgdir/opt/c0wrk" \
    libonnxruntime_providers_openvino_plugin.so* \
    libopenvino*.so* \
    libtbb*.so* \
    libhwloc.so.*
  install -Dm644 models/jina-v2-small.onnx           "$pkgdir/opt/c0wrk/models/jina-v2-small.onnx"
  install -Dm644 models/jina-v2-small-tokenizer.json "$pkgdir/opt/c0wrk/models/jina-v2-small-tokenizer.json"

  # Absolute symlink: os.Executable() dereferences it to /opt/c0wrk, so the
  # app still finds libonnxruntime.so and models/ next to the real binary.
  install -d "$pkgdir/usr/bin"
  ln -s /opt/c0wrk/c0wrk-desktop "$pkgdir/usr/bin/c0wrk-desktop"

  # Desktop entry, icon and license.
  install -Dm644 c0wrk.desktop "$pkgdir/usr/share/applications/c0wrk.desktop"
  install -Dm644 c0wrk.png     "$pkgdir/usr/share/icons/hicolor/512x512/apps/c0wrk.png"
  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Third-party program notices bundled in the OpenVINO EP wheel — legal text
  # that must ship alongside the libraries it covers.
  install -Dm644 openvino-third-party-programs.txt \
    "$pkgdir/usr/share/licenses/$pkgname/openvino-third-party-programs.txt"
}
