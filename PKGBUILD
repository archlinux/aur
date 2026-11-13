# Maintainer: Gaou Piou <i.am.piou@gmail.com>

pkgname=runjam
pkgver=1.0.103
pkgrel=1
pkgdesc='Desktop manager for AI coding agents (Claude Code, Codex CLI and Gemini CLI)'
# Upstream ships llama-server only for linux-x86_64 and its Linux code path
# hardcodes that directory, so an aarch64 build would be missing a feature.
arch=('x86_64')
url='https://github.com/peintune/runjam'
license=('MIT')
depends=(
  'bzip2'
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  # The bundled llama-server libraries link against OpenSSL and Vulkan.
  'openssl'
  # Runtime for the agent CLIs RunJam installs and drives, and for the ACP
  # adapters it installs into ~/.local/share/runjam.
  'nodejs'
  'npm'
  'webkit2gtk-4.1'
  'vulkan-icd-loader'
  'xdg-utils'
  'xz'
)
makedepends=(
  'cargo'
  'nodejs'
  'npm'
)
optdepends=(
  'gnome-keyring: store API keys in the OS keyring'
  'kwallet: store API keys in the OS keyring on KDE Plasma'
  'claude-code: Claude Code agent'
  'openai-codex: Codex CLI agent'
  'gemini-cli: Gemini CLI agent'
  'python: run the bundled PDF and skill-creator helper scripts'
  'python-pdf2image: convert PDF pages to images in the PDF skill'
  'python-pillow: render validation images in the PDF skill'
  'python-pypdf: read, split and merge PDFs in the PDF skill'
  'python-reportlab: fill PDF forms in the PDF skill'
  'python-yaml: validate skill frontmatter'
)
conflicts=('runjam-bin' 'runjam-git')
# The build produces a 35 MB Rust binary; a separate -debug package is not
# useful for an end-user application. makepkg's lto option appends -flto to
# CFLAGS, which turns the bundled sqlite3/zstd objects into GCC LTO objects
# that rust-lld cannot link; disable it (Rust's own LTO stays off as upstream
# configures it).
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/peintune/runjam/archive/refs/tags/v$pkgver.tar.gz"
        'runjam.sh'
        'runjam.desktop'
        'system-nodejs.patch'
        'tailwind-source.patch')
sha256sums=('f99ec40b2e5cba2482af0b48110c01f691ec9f379660f8fe3cb8850512f247f9'
            '0633c5e5b851aa72d344a61356b5ded507517a56a631044c067b5431594cb835'
            '4db05897528909af6b0a4a0ce63840897f099beef28b0a85726f8bcf77105f6f'
            '9843b8c3aaf2e00cf7f915a1db5f73e2760f42af35b0b1551f8c7b77cc8caea6'
            '3e6e69b95b3cfe5ea72e57b02e34ea527fe6fb4778c10d0b8d48b3f817891125')

prepare() {
  cd "$pkgname-$pkgver"

  # Build against the distro Node.js instead of downloading a private copy.
  patch -Np1 -i ../system-nodejs.patch

  # A tarball has no .git directory, which breaks Tailwind's automatic source
  # detection; without this the package builds an unstyled frontend.
  patch -Np1 -i ../tailwind-source.patch

  # Upstream's Cargo.lock still records the previous workspace version, which
  # makes `cargo build --locked` refuse to build. Point it at the tagged
  # version so the rest of the lock file stays enforced.
  sed -i "/^name = \"runjam\"$/,/^version = / s/^version = \".*\"$/version = \"$pkgver\"/" src-tauri/Cargo.lock
}

build() {
  cd "$pkgname-$pkgver"

  # npm reads and writes its cache under $HOME; keep it inside $srcdir so the
  # build does not depend on (or pollute) the build user's home directory.
  export npm_config_cache="$srcdir/npm-cache"

  # The lock file resolves packages through a mirror, and npm 12 refuses
  # remote tarballs by default. Pin everything to the configured registry and
  # skip lifecycle scripts: the only ones upstream relies on are optional
  # platform probes (esbuild, vue-demi), and the Vite build works without
  # them.
  npm ci --ignore-scripts --no-audit --no-fund \
    --replace-registry-host=always --allow-remote=all

  # Only bundle the llama-server build for the platform being packaged.
  node scripts/sync-resources.mjs

  ./node_modules/.bin/vue-tsc --noEmit
  ./node_modules/.bin/vite build

  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  # Keep $srcdir out of the binary's panic locations and debug metadata.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=."
  # `tauri build` enables this feature so that generate_context! embeds the
  # frontend instead of loading it from the dev server; without it the packaged
  # binary boots into dev mode and shows an empty window.
  cargo build --release --locked --features tauri/custom-protocol
}

package() {
  cd "$pkgname-$pkgver"

  # Tauri resolves resources relative to the running executable:
  #   <exe dir>/../lib/RunJam   resource_dir(): builtin skills, bundled Node.js
  #   <exe dir>/share/runjam    explicit lookups: llama-server, bundled ACP
  # Installing the binary in /usr/lib/RunJam makes both resolve inside the
  # package, while /usr/bin/runjam stays the only entry on PATH.
  install -Dm755 src-tauri/target/release/runjam "$pkgdir/usr/lib/RunJam/runjam"

  install -dm755 "$pkgdir/usr/lib/RunJam/share/runjam/binaries/llama-server"
  cp -a --no-preserve=ownership src-tauri/binaries/llama-server/linux-x86_64 \
    "$pkgdir/usr/lib/RunJam/share/runjam/binaries/llama-server/"

  cp -a --no-preserve=ownership src-tauri/builtin-skills "$pkgdir/usr/lib/RunJam/"

  # Launcher: also gives the app's `npm install -g` calls a user-writable
  # prefix instead of /usr.
  install -Dm755 "$srcdir/runjam.sh" "$pkgdir/usr/bin/runjam"

  install -Dm644 "$srcdir/runjam.desktop" \
    "$pkgdir/usr/share/applications/runjam.desktop"

  # Upstream ships the icon at the sizes Tauri generates for Linux; install
  # each one where the hicolor index actually looks for it.
  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/runjam.png"
  install -Dm644 src-tauri/icons/64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/runjam.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/runjam.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/runjam.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/runjam.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
