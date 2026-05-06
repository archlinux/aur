# Maintainer: Cenk Kılıç <cenk1cenk2cenk3@gmail.com>
pkgname=hyprpilot-git
pkgver=0.0.0.r293.650598a
pkgrel=1
pkgdesc="Tauri overlay daemon for agent-driven workflows on Hyprland (VCS)"
arch=('x86_64')
url="https://github.com/hyprpilot/hyprpilot"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'gtk-layer-shell'
  'libappindicator-gtk3'
)
makedepends=(
  'git'
  'git-lfs'
  'cargo'
  'nodejs>=24'
  'pnpm'
  'pkgconf'
)
provides=('hyprpilot')
conflicts=('hyprpilot-bin')
source=("$pkgname::git+https://github.com/hyprpilot/hyprpilot.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # `git describe --long --tags` emits `<tag>-<count>-g<sha>`; the
  # sed dance strips a leading `v` and converts the dashes into
  # `.r<count>.g<sha>` so pacman's version comparator sorts later
  # commits over earlier tags. Falls back to `0.0.0.r<rev-count>.<sha>`
  # when no tag exists yet (initial commits).
  #
  # Capture git describe to a var BEFORE piping through sed —
  # `git | sed || printf` doesn't fall through because sed exits 0
  # on empty input, so the `||` branch never fires when there are
  # no tags. Branching on the captured value covers the unreleased
  # case correctly.
  # `|| true` because makepkg runs pkgver() with `set -e` and
  # `git describe` exits non-zero when no tags exist — would abort
  # the function before we even reach the branch.
  local described
  described=$(git describe --long --tags 2>/dev/null || true)
  if [[ -n "$described" ]]; then
    printf '%s' "$described" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.0.0.r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$pkgname"
  # Icons under src-tauri/icons/ are LFS-tracked. `git+https` clones
  # only the pointer files; tauri's generate_context!() rejects them
  # with "Invalid PNG signature" at compile time. makepkg's source
  # cache uses a local bare clone as `origin` — that bare has no LFS
  # objects, so we point the LFS endpoint at GitHub's HTTPS URL
  # before pulling.
  git lfs install --local
  git config --local lfs.url "https://github.com/hyprpilot/hyprpilot.git/info/lfs"
  git lfs pull
  pnpm install --frozen-lockfile
}

build() {
  cd "$srcdir/$pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  pnpm --filter hyprpilot-ui run build
  # `--locked` (not `--frozen`): pin to the checked-in Cargo.lock
  # but still allow registry fetches. `--frozen` implies offline,
  # which fails on a fresh clone where ~/.cargo/registry is empty.
  cargo build --release --locked --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/target/release/hyprpilot" "$pkgdir/usr/bin/hyprpilot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/hyprpilot.desktop "$pkgdir/usr/share/applications/hyprpilot.desktop"
  install -Dm644 packaging/hyprpilot.service "$pkgdir/usr/lib/systemd/user/hyprpilot.service"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprpilot.png"
  done
  install -Dm644 src-tauri/src/config/defaults.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
