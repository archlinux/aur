# Maintainer: zabbius <https://github.com/zabbius>
# c0wrk CPU flavor (git build pinned to a fixed commit of the fork).
#
# Symmetric counterpart of c0wrk-zabbius-cuda-git: same binary, same layout,
# CPU-only ONNX Runtime (no CUDA provider libraries). Both packages provide
# `c0wrk` / `c0wrk-desktop` and conflict with each other, so exactly one
# flavor can be installed at a time.
#
# Layout rationale: the app resolves libonnxruntime.so and models/ RELATIVE to
# the real binary path (os.Executable() dereferences the /proc/self/exe
# symlink), so the executable tree lives in /opt/c0wrk and /usr/bin/c0wrk-desktop
# is an absolute symlink — safe by design.

pkgname=c0wrk-zabbius-git
pkgver=0.7.3.r73.g8689191
pkgrel=1
pkgdesc='Desktop AI coding-agent built with Wails (Go + React) — CPU flavor, git build'
arch=(x86_64 aarch64)
url='https://github.com/zabbius/c0wrk'
license=(MIT)
depends=(gtk3 webkit2gtk-4.1)
makedepends=(git go nodejs npm wails)
provides=(c0wrk c0wrk-desktop)
conflicts=(c0wrk c0wrk-desktop c0wrk-zabbius-cuda-git)
options=(!strip)
# Deterministic build: the source is pinned to an exact commit (#commit=) and
# pkgver is STATIC — there is no pkgver() function on purpose. The version
# encodes the pinned commit's position relative to the last tag
# (0.7.3.r60.g8f332bbd = tag v0.7.3 + 60 commits + short SHA g8f332bbd) and
# is known in advance, so it is written by hand here and only changes when
# the pin changes. To move to a newer commit, run ../bump-commit.sh [REF]
# from the sibling AUR repo root — it rewrites #commit=, pkgver=, pkgrel=
# here and in the CUDA package, and regenerates both .SRCINFO files.
# `wails` (AUR) must match the version required by go.mod: v2.15.0.
source=(
  'c0wrk::git+https://github.com/zabbius/c0wrk.git#commit=8689191858ca26db71d6e6068faaef499a26d099'
  'c0wrk.desktop'
)
sha256sums=(
  'SKIP'
  '817980d6896b98a304ade9b151125408e83bdc00c0e7f006eb5f6d7bb486fe62'
)

build() {
  # GOTOOLCHAIN=auto lets Go fetch the toolchain pinned by go.mod when the
  # system one is older; keeps the AUR build working across toolchain bumps.
  export GOTOOLCHAIN=auto

  # The Wails CLI comes from the `wails` makedepend (AUR); its version must
  # match the wails/v2 library pinned in go.mod (v2.15.0).
  cd "$srcdir/c0wrk"

  # `make build` = wails build (webkit2_41 tag) + fetch-onnx (CPU flavor) +
  # fetch-embedding-model. VERSION/GITCOMMIT are `?=` in the Makefile, so
  # passing them here overrides the fallback and keeps the About dialog free
  # of "dev"/"none" placeholders.
  # NOTE: never call `fetch-onnx-gpu` here — this is the CPU package.
  make build \
    VERSION="$(git describe --tags --always)" \
    GITCOMMIT="$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/c0wrk"

  # /opt/c0wrk application tree (binary + ONNX Runtime CPU lib + models,
  # all resolved by the app relative to the real executable path).
  install -Dm755 build/bin/c0wrk-desktop          "$pkgdir/opt/c0wrk/c0wrk-desktop"
  install -Dm755 build/bin/libonnxruntime.so      "$pkgdir/opt/c0wrk/libonnxruntime.so"
  install -Dm644 build/bin/models/jina-v2-small.onnx           "$pkgdir/opt/c0wrk/models/jina-v2-small.onnx"
  install -Dm644 build/bin/models/jina-v2-small-tokenizer.json "$pkgdir/opt/c0wrk/models/jina-v2-small-tokenizer.json"

  # Absolute symlink: os.Executable() dereferences it to /opt/c0wrk, so the
  # app still finds libonnxruntime.so and models/ next to the real binary.
  install -d "$pkgdir/usr/bin"
  ln -s /opt/c0wrk/c0wrk-desktop "$pkgdir/usr/bin/c0wrk-desktop"

  # Desktop entry, icon and license.
  install -Dm644 "$srcdir/c0wrk.desktop"                    "$pkgdir/usr/share/applications/c0wrk.desktop"
  install -Dm644 build/appicon.png                          "$pkgdir/usr/share/icons/hicolor/512x512/apps/c0wrk.png"
  install -Dm644 LICENSE                                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
