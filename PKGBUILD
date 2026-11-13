# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=sirinvpn-git
pkgver=1.0.0rc1.r2.g7ade32e
pkgrel=1
pkgdesc="Self-hosted WireGuard VPN: set up your own VPS and connect your devices (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/RamazanBerk20/SirinVPN"
license=('AGPL-3.0-only')
depends=('ca-certificates' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'iproute2' 'iputils' 'libayatana-appindicator' 'libsoup3' 'nftables' 'polkit'
         'procps-ng' 'systemd' 'util-linux' 'webkit2gtk-4.1' 'wireguard-tools' 'zlib')
makedepends=('cargo' 'git' 'nodejs' 'perl' 'pkgconf' 'pnpm' 'rust')
optdepends=('networkmanager: Wi-Fi automation and an unmanaged measurement probe interface'
            'org.freedesktop.secrets: remember SSH logins in the desktop keyring')
provides=("sirinvpn=$pkgver")
conflicts=('sirinvpn' 'sirinvpn-bin')
install=sirinvpn.install
# The release profile already strips symbols; makepkg must not rewrite the VPS
# payloads, which have to stay the signed release's exact bytes.
options=('!lto' '!strip' '!debug')
# The VPS server payloads come from the newest signed release (see the sirinvpn
# package): they need Debian Bookworm's glibc. Raise _payload_tag with each release.
_payload_tag=v1.0.0-rc.1
source=("sirinvpn::git+$url.git#branch=main"
        "sirinvpn-server-x86_64-$_payload_tag::$url/releases/download/$_payload_tag/sirinvpn-server-x86_64"
        "sirinvpn-server-aarch64-$_payload_tag::$url/releases/download/$_payload_tag/sirinvpn-server-aarch64")
# The payload sums are filled from that release by scripts/update-aur-checksums.sh.
sha256sums=('SKIP'
            'c4e55d4c80550c2ec8887f416c2c0f7306c6f568d59d88288eb94e892bf76063'
            'a57bb04e72c441f88517998f1d2f5a0e906fc6a53c226de0e472de6b213f5550')

pkgver() {
  cd sirinvpn
  local described
  # v1.0.0-rc.1-5-gabc1234 -> 1.0.0rc1.r5.gabc1234, the sirinvpn package's spelling.
  if described=$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null); then
    printf '%s\n' "$described" | sed -E 's/^v//; s/-rc\.([0-9]+)/rc\1/; s/-([0-9]+)-g/.r\1.g/'
  else
    printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd sirinvpn
  # All network fetches happen here so build() and check() work offline.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  pnpm --dir apps/desktop install --frozen-lockfile
}

build() {
  cd sirinvpn
  local separator=$'\x1f'
  local rustflags="${CARGO_ENCODED_RUSTFLAGS:-}"
  [[ -z "$rustflags" ]] || rustflags+="$separator"
  rustflags+="--remap-path-prefix=$srcdir/sirinvpn=."
  rustflags+="$separator--remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  export CARGO_ENCODED_RUSTFLAGS="$rustflags" CARGO_TARGET_DIR=target
  pnpm --dir apps/desktop build
  cargo build --frozen --release \
    -p sirinvpn-cli -p sirinvpn-linux-helper -p sirinvpn-release -p sirinvpn-release-fetch
  # What `tauri build` adds: serve the built frontend from the binary.
  cargo build --frozen --release -p sirinvpn-desktop --features tauri/custom-protocol
}

check() {
  cd sirinvpn
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release \
    -p sirinvpn-cli -p sirinvpn-linux-helper -p sirinvpn-release -p sirinvpn-release-fetch
  pnpm --dir apps/desktop test
}

package() {
  cd sirinvpn
  local binaries="$srcdir/binaries" host
  mkdir -p "$binaries"
  for host in sirinvpn sirinvpn-helper sirinvpn-release sirinvpn-release-fetch; do
    install -m755 "target/release/$host" "$binaries/$host"
  done
  install -m755 "$srcdir/sirinvpn-server-x86_64-$_payload_tag" "$binaries/sirinvpn-server-x86_64"
  install -m755 "$srcdir/sirinvpn-server-aarch64-$_payload_tag" "$binaries/sirinvpn-server-aarch64"
  install -m755 "$binaries/sirinvpn-server-$CARCH" "$binaries/sirinvpn-server"
  DESTDIR="$pkgdir" PREFIX=/usr scripts/install-linux.sh install \
    "$binaries" target/release/sirinvpn-desktop aur
}
