# Maintainer:
# Contributor: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

# options
: ${CARGO_HOME:=${SRCDEST:-${startdir:?}}/cargo}

: ${_pkgtype:=git}

# basic info
_pkgname="systemd-cron-next"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=1.0.2.r18.gd69afa9
pkgrel=1
pkgdesc="Systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-cron-next"
license=('MIT')
arch=('i686' 'x86_64')

# main package
_main_package() {
  depends=(
    'run-parts'
    'systemd'
  )
  makedepends=(
    'rust'
  )
  optdepends=(
    'smtp-forwarder: sending emails'
  )

  provides=(
    'anacron'
    'cron'
    'systemd-cron'
  )
  conflicts=(
    'anacron'
    'cron'
  )

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname-${pkgver%.r*}"
  _pkgext="zip"
  source+=(
    "$_pkgsrc.$_pkgext"::"https://github.com/systemd-cron/systemd-crontab-generator/archive/v${pkgver%%.r*}.$_pkgext"
    "0001-makefile-stable.patch"
  )
  sha256sums+=(
    '455d1ea09ecb29efaec44255f6439794d2118d63133936b389fd3afd9c60cc2f'
    'a3944b5069f3012044c97ef9eac300b6c7a5b58254c89644f659e3350025c82a'
  )
  pkgver() {
    local _pkgver="${pkgver%%.r*}"
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=(
    "$_pkgsrc"::"git+$url.git"
    "0001-makefile-git.patch"
  )
  sha256sums+=(
    'SKIP'
    '095f20fd780717da18c0251df0ff702a5953816120f3040a317ccc9dc3e1572b'
  )

  pkgver() (
    cd "$_pkgsrc"
    local _pkgver=$(
      git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
        | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
    )
    echo "${_pkgver:?}"
  )
}

# common functions
prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]] ; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  sed -E 's@^(\s*rustc-serialize) = \S+\s*$@\1 = "0.3.20"@' -i Cargo.toml

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="${srcdir:?}/target"

  cd "$_pkgsrc"
  ./configure --prefix="/usr" --confdir="/etc"
  DESTDIR="${pkgdir:?}" make build
}

package() {
  cd "$_pkgsrc"
  DESTDIR="${pkgdir:?}" make install

  install -dm775 "${pkgdir:?}/var/spool/cron"

  install -Dm644 LICENSE -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}

# execute
_main_package
