# Maintainer: Shawn McCool <shawn@mccool.email>
pkgname=dredge
pkgver=0.4.1
pkgrel=1
pkgdesc="Ear-first practice looper: loop sections, slow them down pitch-preserving, drill passages"
arch=('x86_64')
url="https://github.com/ShawnMcCool/dredge"
license=('MIT')
depends=('rubberband' 'pipewire' 'webkit2gtk-4.1' 'gtk3')
makedepends=('rust' 'nodejs' 'pnpm' 'just' 'clang' 'pkgconf' 'git')
optdepends=('ffmpeg: MP3 export, extra container formats, and demucs stem export'
            'uv: bootstrap the analyze/songformer ML venvs (beats, sections)'
            'python: ML analysis runtime'
            'demucs: 4-stem separation (vocals/drums/bass/other)')
provides=('dredge')
conflicts=('dredge-looper-bin')
# rusqlite bundles + cc-compiles sqlite3.c; makepkg's default LTO makes that a
# GCC LTO object that Rust's lld can't link (undefined sqlite3_* symbols).
options=('!lto')
source=("git+https://github.com/ShawnMcCool/dredge.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  # Headless daemon.
  cargo build -p server --release
  # Desktop app — install frontend deps, then build without OS bundling
  # (we install the raw binaries ourselves below).
  cd apps/desktop
  pnpm install --frozen-lockfile
  pnpm tauri build --no-bundle
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 target/release/dredge                       "${pkgdir}/usr/bin/dredge"
  install -Dm755 target/release/dredged                      "${pkgdir}/usr/bin/dredged"
  install -Dm755 scripts/analyze                              "${pkgdir}/usr/bin/dredge-analyze"
  install -Dm755 scripts/dredge-enable-ml                    "${pkgdir}/usr/bin/dredge-enable-ml"
  install -Dm755 scripts/dredge-doctor                       "${pkgdir}/usr/bin/dredge-doctor"
  install -Dm644 scripts/analyze_impl.py                      "${pkgdir}/usr/lib/dredge/analyze_impl.py"
  install -Dm644 scripts/songformer_impl.py                   "${pkgdir}/usr/lib/dredge/songformer_impl.py"
  install -Dm644 dredge.desktop                              "${pkgdir}/usr/share/applications/dredge.desktop"
  install -Dm644 apps/desktop/src-tauri/icons/128x128@2x.png  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dredge.png"
}
