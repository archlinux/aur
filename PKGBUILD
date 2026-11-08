# Maintainer: Swastik Patel <ping at cptdawn dot dev>
#
# Source of truth: packaging/aur/ in https://github.com/CPT-Dawn/Hoarder.

pkgname=hoarder-git
_pkgname=hoarder
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Pixel-exact screenshots and a clipboard that outlives the app that set it, for Wayland (latest commit)'
arch=('x86_64' 'aarch64')
url='https://github.com/CPT-Dawn/Hoarder'
license=('MIT')
depends=('glibc' 'libgcc' 'libxkbcommon')
makedepends=('cargo' 'git')
optdepends=('xdg-utils: open a Capture from its notification'
            'hoarder-wl-compat: wl-copy and wl-paste served by Hoarder')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
# The dist profile already strips the binary and does its own LTO; makepkg's
# -flto would turn the bundled C (SQLite, libwebp) into GCC bitcode that
# Rust's linker cannot read.
options=('!debug' '!lto')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # 1.0.0.r12.gabc1234 after a release tag; 0.r345.gabc1234 before the first.
  local described
  if described=$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' --exclude '*-dryrun*' 2>/dev/null); then
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<<"$described"
  else
    printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --profile dist -p hoarder
  ./target/dist/hoarder dist dist --bindir /usr/bin
}

# No check(): the test suite drives a headless Sway session, which a clean
# chroot does not have. CI runs it on every change.

package() {
  cd "$_pkgname"
  install -Dm755 target/dist/hoarder -t "$pkgdir/usr/bin"
  install -Dm644 dist/systemd/hoarder.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 dist/man/man1/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 dist/completions/hoarder.bash "$pkgdir/usr/share/bash-completion/completions/hoarder"
  install -Dm644 dist/completions/_hoarder -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 dist/completions/hoarder.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 dist/config.toml README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
