# Maintainer:
# Contributor: spikecodes <19519553+spikecodes@users.noreply.github.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="xcp"
pkgname="$_pkgname-git"
pkgver=0.24.2.r35.gee00e7a
pkgrel=1
pkgdesc="An extended 'cp'"
url="https://github.com/tarka/xcp"
license=("GPL-3.0-only")
arch=('x86_64')

depends=(
  'glibc'
  'libgcc'
)
makedepends=(
  'git'
  'cargo'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  local _nproc=$(nproc)
  export CARGO_PROFILE_RELEASE_LTO=false
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=$((_nproc > 16 ? _nproc : 16))

  cd "$_pkgsrc"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgsrc"
  if grep --quiet '^mail:' /etc/passwd; then
    ./tests/scripts/test-linux.sh
  else
    ./tests/scripts/test-linux.sh test_no_acl
  fi
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "completions/$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm644 "completions/$_pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
