# Maintainer:
# Contributor: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="luxtorpeda"
pkgname="$_pkgname-git"
pkgver=73.0.1.r9.g5e505fc
pkgrel=2
pkgdesc="Steam Play compatibility tool to run games using native Linux engines"
url='https://github.com/luxtorpeda-dev/luxtorpeda'
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  'bash'
  'bzip2'
  'xz'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'fontconfig' # used by godot
  'git'
  'godot'
  'godot-export-templates-linux' # AUR
  'zlib-ng'
)
optdepends=(
  'steam: The Steam client'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto' '!strip' '!debug')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # set godot templates location
  for i in debug release; do
    local _template=$(find /usr/share/godot/export_templates -type f -name "linux_${i}.x86_64" -print -quit)
    [[ -z "$_template" ]] && echo "Missing Godot template for $i" && return 1
    sed -E -e 's&^(custom_template/'${i}')=.*$&\1="'"${_template}"'"&' -i "$_pkgsrc/export_presets.cfg"
  done

  # prevent rebuild on install
  sed -E -e 's&^(install:).*$&\1&' -i "$_pkgsrc/Makefile"
}

build() {
  cd "$_pkgsrc"

  # godot fails intermittently
  _retry "make GODOT=/usr/bin/godot release"
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

_retry() {
  local cmd="$1"
  local max_attempts="${2:-3}"
  local delay="${3:-3}"
  local attempt=1

  until eval "$cmd"; do
    if ((++attempt > max_attempts)); then
      echo "Max attempts ($max_attempts) reached. Command failed."
      return 1
    fi
    echo "Attempt $((attempt - 1)) failed. Retrying in $delay seconds..."
    sleep "$delay"
  done
}
