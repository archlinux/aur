# Maintainer: lightjunction <lightjunction.me@gmail.com>
# AUR VCS package: builds from the latest git HEAD of this project.

pkgname=video-work-api-git
_pkgname=video-work-api
_pkgsrc=video-work-api
pkgver=0.1.0.r0.g0000000
pkgrel=2
pkgdesc="Local Video Work API toolkit: CosyVoice3 cloning and FunClip subtitles (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/LIghtJUNction/video-work-api"
license=('Apache-2.0')

depends=(
  'python>=3.10'
  'python-huggingface-hub' # provides `hf` CLI (model download + Hub cache)
  'uv'
  'ffmpeg'
  'sox'
  'git-lfs'
  'util-linux' # runuser
)
makedepends=(
  'git'
  'cargo'
  'rust'
)
optdepends=(
  'cuda: NVIDIA GPU acceleration for CosyVoice / FunASR'
  'cudnn: CUDA deep learning primitives'
)

provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()

backup=('etc/video-work-api/config.env')
install=video-work-api-git.install
options=('!lto') # cargo release already sets LTO; avoid double-LTO with pacman

source=(
  "$_pkgsrc::git+https://github.com/LIghtJUNction/video-work-api.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgsrc"
  local _ver
  if _ver=$(git describe --long --tags 2>/dev/null); then
    # v0.1.0-12-gabcdef0 -> 0.1.0.r12.gabcdef0
    printf '%s' "$_ver" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  elif _ver=$(git describe --long --always 2>/dev/null); then
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    # Unborn / empty repo fallback (local test only)
    printf '0.1.0.r0.g%s' "$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
  fi
}

prepare() {
  cd "$srcdir/$_pkgsrc"
  # Vendored CosyVoice + FunClip (required at runtime)
  git submodule update --init --recursive
  # Cargo offline-friendly vendor is not used; network fetch happens in build().
  export CARGO_HOME="${CARGO_HOME:-$srcdir/cargo-home}"
  mkdir -p "$CARGO_HOME"
}

build() {
  cd "$srcdir/$_pkgsrc"
  export CARGO_HOME="${CARGO_HOME:-$srcdir/cargo-home}"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"

  cargo build --release --locked 2>/dev/null \
    || cargo build --release
}

check() {
  cd "$srcdir/$_pkgsrc"
  export CARGO_HOME="${CARGO_HOME:-$srcdir/cargo-home}"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"

  bash -n scripts/vwactl
  cargo test --release --offline 2>/dev/null \
    || cargo test --release
}

package() {
  cd "$srcdir/$_pkgsrc"
  local dest="$pkgdir/usr/lib/video-work-api"
  local target_dir="${CARGO_TARGET_DIR:-$srcdir/cargo-target}"

  install -dm755 "$dest"

  # Application payload (no VCS / build caches / secrets)
  local item
  for item in Cargo.toml Cargo.lock LICENSE README.md README.zh-CN.md \
              SECURITY.md config.env.example scripts src static systemd vendor; do
    if [[ -e $item ]]; then
      cp -a "$item" "$dest/"
    fi
  done

  # Drop junk that may have been copied from a dirty tree
  find "$dest" \( \
      -name .git -o \
      -name .venv -o \
      -name __pycache__ -o \
      -name target -o \
      -name .ruff_cache -o \
      -name .pytest_cache \
    \) -type d -prune -exec rm -rf {} + 2>/dev/null || true
  find "$dest" -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete 2>/dev/null || true
  # Do not redistribute upstream demo/reference audio.
  find "$dest/vendor" -type f \( \
      -iname '*.wav' -o \
      -iname '*.mp3' -o \
      -iname '*.m4a' -o \
      -iname '*.flac' -o \
      -iname '*.ogg' -o \
      -iname '*.opus' -o \
      -iname '*.aac' \
    \) -delete 2>/dev/null || true
  # Never ship local data / tokens if present in a dirty checkout
  rm -rf "$dest"/models "$dest"/voices "$dest"/profiles \
         "$dest"/generations "$dest"/output "$dest"/setup-token \
         "$dest"/*.sqlite* "$dest"/*.db "$dest"/*.env 2>/dev/null || true

  # Native Rust binary (required)
  if [[ -x "$target_dir/release/vwactl" ]]; then
    install -Dm755 "$target_dir/release/vwactl" "$dest/bin/vwactl"
  elif [[ -x target/release/vwactl ]]; then
    install -Dm755 target/release/vwactl "$dest/bin/vwactl"
  else
    error "vwactl release binary missing after cargo build"
    return 1
  fi

  # Admin / service entry point (handles root -> service-user reexec)
  install -Dm755 scripts/vwactl "$pkgdir/usr/bin/vwactl"

  # systemd unit — never enabled by package hooks
  install -Dm644 systemd/video-work-api.service \
    "$pkgdir/usr/lib/systemd/system/video-work-api.service"

  # Default config (backup= preserves local edits on upgrade)
  install -Dm644 config.env.example \
    "$pkgdir/etc/video-work-api/config.env"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
