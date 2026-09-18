# Maintainer: Yangtse Su <yangtsesu at gmail dot com>
# Upstream: https://github.com/BennyThink/NFCX
#
# NFCX does not use a system libnfc: it links and ships a private libnfc 1.8.0
# built with the pn532_uart driver only (the sole validated driver), plus
# mfoc/mfcuk/mfoc-hardnested and nfc-mfsetuid built against that same private
# libnfc. The application resolves its runtime relative to its own executable
# (runtime/linux-amd64, rpath $ORIGIN/runtime/linux-amd64), so the runtime is
# installed under /usr/lib/nfcx next to the binary (/usr/lib/nfcx/nfcx, with
# /usr/bin/nfcx symlinked to it) and the manifest of that directory is
# hash-verified by the built-in self-check.
#
# license covers the NFCX source only. The redistribution terms of the bundled
# LGPL/GPL/BSD engines are met by shipping their license texts, which land in
# /usr/share/licenses/nfcx/runtime/ and inside the runtime directory itself.
#
# The bundled third-party sources are pinned twice: by the sha256sums below and
# by third_party/*/*.lock, which the upstream toolchain scripts re-verify while
# building.
#
# build() needs network access for two dependency fetches that upstream does
# not vendor: `npm ci` for the Vite/TypeScript frontend and the Go module
# download for the Wails CLI and the application itself. Architecture support
# follows scripts/toolchain/platform.sh, which handles Linux x86_64 only.

pkgname=nfcx
pkgver=1.0.1
pkgrel=2
pkgdesc='NFC workbench for PN532 readers: reader discovery, MIFARE Classic reads, dumps, and key recovery'
arch=('x86_64')
url='https://nfcx.tools'
license=('MIT')
# One entry per library the packaged ELF files need directly: gtk3 and
# webkit2gtk-4.1 for the GUI shell, their direct leaf providers, xz for
# mfoc-hardnested. libnfc.so.6 resolves inside the private runtime.
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'libsoup3' 'pango' 'xz' 'zlib')
makedepends=('go' 'nodejs' 'npm' 'pkgconf' 'autoconf' 'automake' 'libtool' 'patchelf' 'xz' 'curl')
# Every bundled engine is already stripped with `strip --strip-unneeded` after
# being compiled with -g0, and runtime/linux-amd64/manifest.json pins the
# SHA-256 of each of those files. Re-stripping them in fakeroot would break the
# self-check, so the package ships the upstream-built binaries verbatim.
options=('!strip')
_nfcx_commit='b4dbbcd7bc0ef64b25ba280732cb479586264e44'
_wails_version='2.15.0'
_libnfc_version='1.8.0'
_mfoc_version='0.10.7'
_mfcuk_version='0.3.8'
_hardnested_commit='a6007437405a0f18642a4bbca2eeba67c623d736'
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/BennyThink/NFCX/archive/refs/tags/v$pkgver.tar.gz"
  "libnfc-$_libnfc_version.tar.bz2::https://github.com/nfc-tools/libnfc/releases/download/libnfc-$_libnfc_version/libnfc-$_libnfc_version.tar.bz2"
  "mfoc-$_mfoc_version.tar.gz::https://github.com/nfc-tools/mfoc/archive/refs/tags/mfoc-$_mfoc_version.tar.gz"
  "mfcuk-$_mfcuk_version.tar.gz::https://github.com/nfc-tools/mfcuk/archive/refs/tags/mfcuk-$_mfcuk_version.tar.gz"
  "mfoc-hardnested-$_hardnested_commit.tar.gz::https://github.com/nfc-tools/mfoc-hardnested/archive/$_hardnested_commit.tar.gz"
)
sha256sums=(
  '74570b61012d51757c57b0c65af7d60f1c7110fd92c3cf7ec042f65f0a551219'
  '6d9ad31c86408711f0a60f05b1933101c7497683c2e0d8917d1611a3feba3dd5'
  '2dfd8ffa4a8b357807680d190a91c8cf3db54b4211a781edc1108af401dbaad7'
  'c7091d1a16b132e1a4917ebc705065b60f3d1a0b449a776411ba39612a62ee89'
  'cc2f631828175c0c0e624572f83b74ee5e010ffbc9591d790433c8e5938969ea'
)

build() {
  cd "NFCX-$pkgver"

  local sdk="$PWD/build/toolchain/linux-amd64/sdk" runtime="$PWD/runtime/linux-amd64" ldflags

  export GOBIN="$srcdir/wails-bin"
  # Private build cache: the resolved #cgo pkg-config flags (libnfc -L/-I/-l)
  # are not part of the Go build cache key, so an entry produced from a
  # different source directory makes the link step use a stale -L path.
  export GOCACHE="$srcdir/go-build"
  export CGO_ENABLED=1
  export NFCX_LIBNFC_SDK_DIR="$sdk"
  export NFCX_RUNTIME_DIR="$runtime"
  export PKG_CONFIG_PATH="$sdk/lib/pkgconfig"
  export LD_LIBRARY_PATH="$runtime"
  export PATH="$runtime:$PATH"
  # The toolchain scripts accept the pinned archives from source=() instead of
  # downloading their own copies, and verify them against their lock files.
  export NFCX_LIBNFC_ARCHIVE="$srcdir/libnfc-$_libnfc_version.tar.bz2"
  export NFCX_MFOC_ARCHIVE="$srcdir/mfoc-$_mfoc_version.tar.gz"
  export NFCX_MFCUK_ARCHIVE="$srcdir/mfcuk-$_mfcuk_version.tar.gz"
  export NFCX_HARDNESTED_ARCHIVE="$srcdir/mfoc-hardnested-$_hardnested_commit.tar.gz"

  # Wails CLI pinned to the version go.mod requires.
  GOFLAGS= go install "github.com/wailsapp/wails/v2/cmd/wails@v$_wails_version"
  npm ci --prefix frontend
  "$GOBIN/wails" generate module
  (cd frontend && npm run build)

  # Private native runtime: libnfc SDK + pn532_uart driver, nfc-mfsetuid, and
  # the three recovery engines linked against that SDK. One goal per make
  # call: makepkg exports MAKEFLAGS=-j<n>, and make would otherwise verify and
  # smoke-test libnfc before it is built.
  make libnfc-build
  make libnfc-verify
  make libnfc-smoke
  make mfoc-build
  make mfcuk-build
  make hardnested-build

  # Version metadata: wails.json feeds the About dialog, the linker flags feed
  # the build info reported by the self-check.
  go run ./cmd/nfcx-release set-version -file wails.json -version "$pkgver"
  ldflags="-X github.com/BennyThink/NFCX/internal/buildinfo.Version=$pkgver"
  ldflags+=" -X github.com/BennyThink/NFCX/internal/buildinfo.Commit=$_nfcx_commit"
  ldflags+=" -X github.com/BennyThink/NFCX/internal/buildinfo.BuildDate=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  ldflags+=" -X github.com/BennyThink/NFCX/internal/buildinfo.Dirty=false"

  # -s: the frontend and its bindings were built above, so the Wails CLI must
  # not run npm again. The Makefile's `build` target is this same invocation
  # without -s, followed by scripts/package-runtime.sh.
  "$GOBIN/wails" build -s -trimpath -tags 'libnfc,webkit2_41' -ldflags "$ldflags"
  ./scripts/package-runtime.sh

  runtime="$PWD/build/bin/NFCX-linux-amd64/runtime/linux-amd64"
  ./scripts/release/collect-go-licenses.sh "$runtime/LICENSES/go"
  go run ./cmd/nfcx-release manifest -repository "$PWD" -root "$runtime" \
    -output "$runtime/manifest.json" -platform linux-amd64 -version "$pkgver" -commit "$_nfcx_commit"
  go run ./cmd/nfcx-release verify -root "$runtime"
  go run ./cmd/nfcx-release scan-paths -root "$PWD/build/bin/NFCX-linux-amd64" -needle "$PWD"
}

check() {
  cd "NFCX-$pkgver"

  export CGO_ENABLED=1
  export GOCACHE="$srcdir/go-build"
  export NFCX_LIBNFC_SDK_DIR="$PWD/build/toolchain/linux-amd64/sdk"
  export NFCX_RUNTIME_DIR="$PWD/runtime/linux-amd64"
  export PKG_CONFIG_PATH="$NFCX_LIBNFC_SDK_DIR/lib/pkgconfig"
  export LD_LIBRARY_PATH="$NFCX_RUNTIME_DIR"
  export PATH="$NFCX_RUNTIME_DIR:$PATH"

  # Full Go suite against the freshly built private libnfc bindings.
  make libnfc-binding-test
}

package() {
  cd "NFCX-$pkgver"

  install -d "$pkgdir/usr/lib/nfcx" \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps" \
    "$pkgdir/usr/share/licenses/nfcx"

  # NFCX plus the runtime it resolves relative to itself. The manifest is
  # hashed over exactly this tree, symlinked libnfc.so* included. Upstream
  # names the executable NFCX (its product name, as in the AppImage); the
  # package installs it lowercase, which is what the Arch naming conventions
  # expect and what makes the GTK/Wayland application id line up with
  # nfcx.desktop.
  cp -a build/bin/NFCX-linux-amd64/. "$pkgdir/usr/lib/nfcx/"
  mv "$pkgdir/usr/lib/nfcx/NFCX" "$pkgdir/usr/lib/nfcx/nfcx"
  ln -s /usr/lib/nfcx/nfcx "$pkgdir/usr/bin/nfcx"

  sed -e 's|^Exec=.*|Exec=nfcx|' -e 's|^Icon=.*|Icon=nfcx|' \
    build/linux/NFCX.desktop > "$pkgdir/usr/share/applications/nfcx.desktop"
  # Upstream ships a single 1024x1024 icon; hicolor has no native 1024 slot, so
  # it lands in 512x512 and toolkits scale it down.
  install -Dm644 build/appicon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/nfcx.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nfcx/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/nfcx/THIRD_PARTY_NOTICES.md"
  cp -a runtime/linux-amd64/LICENSES "$pkgdir/usr/share/licenses/nfcx/runtime"
}
