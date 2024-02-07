# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

## options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="image-roll"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.1.0.r0.g5087079
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
url="https://github.com/weclaw1/image-roll"
license=('MIT')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    gtk4
  )
  makedepends=(
    cargo
    git
  )

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _update_version

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=${_pkgver:?}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() (
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  )
}

_rust_env() {
  export CARGO_HOME="${CARGO_HOME:-${SRCDEST:-${startdir:?}}/cargo-home}"
  export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
  export CARGO_TARGET_DIR=target
}

prepare() {
  _rust_env

  cd "$_pkgsrc"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  _rust_env

  cd "$_pkgsrc"
  cargo build --release --frozen --all-features
}

check() {
  _rust_env

  cd "$_pkgsrc"
  cargo test --tests -- --skip current_file || true
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$CARGO_TARGET_DIR/release/image-roll" -t "$pkgdir/usr/bin/"

  install -Dm644 "src/resources/com.github.weclaw1.ImageRoll.desktop" \
    -t "$pkgdir/usr/share/applications/"

  install -Dm644 "src/resources/com.github.weclaw1.ImageRoll.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  install -Dm644 "src/resources/com.github.weclaw1.ImageRoll.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ x"${_autoupdate::1}" != "xt" ]] ; then
    return
  fi

  _repo="${url#*//*/}"
  _response=$(curl "https://api.github.com/repos/${_repo:?}/tags" -s)

  _get() {
    printf '%s' "$_response" \
      | awk -F '"' '/"'"$1"'":/{print $4}' \
      | sed 's@^.*[a-z-].*$@@' | sort -rV | head -1
  }
  _pkgver_new=$(_get name)

  # update pkgver
  if [ x"$_pkgver" != x"${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
