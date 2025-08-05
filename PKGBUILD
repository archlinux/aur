# Maintainer:
# Contributor: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

: ${CARGO_HOME:=$SRCDEST/cargo}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=nightly-2025-02-01}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="systemd-cron-next"
pkgname="$_pkgname-git"
pkgver=1.0.2.r22.gfe1f4a6
pkgrel=3
pkgdesc="Systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-cron-next"
license=('MIT')
arch=('i686' 'x86_64')

depends=(
  'run-parts'
  'systemd'
)
makedepends=(
  'git'
  'rustup'
)
optdepends=(
  'smtp-forwarder: sending emails'
)

provides=(
  "$_pkgname=$pkgver"
  'anacron'
  'cron'
  'systemd-cron'
)
conflicts=(
  "$_pkgname"
  'anacron'
  'cron'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "0001-makefile-git.patch"
)
sha256sums=(
  'SKIP'
  '095f20fd780717da18c0251df0ff702a5953816120f3040a317ccc9dc3e1572b'
)

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2> /dev/null \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "$srcdir/$src"
    fi
  done

  sed -E \
    -e '1i #![feature(rustc_encodable_decodable)]' \
    -i "src/bin/crontab.rs"

  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc"
  ./configure --prefix="/usr" --confdir="/etc"
  DESTDIR="$pkgdir" make build
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" make install
  install -dm775 "$pkgdir/var/spool/cron"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
