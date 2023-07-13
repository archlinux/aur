# Maintainer: dreieck
# Contributor: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=rusty-keys-nosystemd-git
pkgver=0.0.3.r89.20220429.e9705db
pkgrel=1
pkgdesc="uinput level keyboard mapper for linux"
url="https://code.moparisthebest.com/moparisthebest/rusty-keys"
makedepends=('cargo' 'git')
depends=()
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('AGPL')
backup=('etc/rusty-keys/keymap.toml')
source=("rusty-keys::git+https://code.moparisthebest.com/moparisthebest/rusty-keys.git")
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=(SKIP)
conflicts=(
  "rusty-keys"
)
provides=(
  "rusty-keys=$pkgver"
  "rusty-keys-nosystemd=$pkgver"
  "rusty-keys-git=$pkgver"
)

pkgver() {
  cd "${srcdir}/rusty-keys"

  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' Cargo.toml | awk -F= '{print $2}' | tr -d \"\'' ')" # `git describe --tags` is unreliable.
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/rusty-keys"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo fetch
}

build() {
  cd "${srcdir}/rusty-keys"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo build --release
}

package() {
  cd "${srcdir}/rusty-keys"
  export CARGO_HOME="${srcdir}/.cargo"

  install -Dm755 target/release/rusty-keys "$pkgdir/usr/bin/rusty-keys"
  install -Dm644 keymap.toml "${pkgdir}/etc/rusty-keys/keymap.toml"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/rusty-keys/README.md"
  install -Dm644 systemd/rusty-keys.service "${pkgdir}/usr/share/doc/rusty-keys/rusty-keys.service"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
