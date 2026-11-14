# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=sirinvpn
# 1.0.0-rc.3 in SemVer: pkgver cannot hold a hyphen, and 1.0.0rc3 sorts before 1.0.0.
pkgver=1.0.0rc3
pkgrel=1
_tag="v${pkgver/rc/-rc.}"
_srcname="SirinVPN-${_tag#v}"
pkgdesc="Self-hosted WireGuard VPN: set up your own VPS and connect your devices"
arch=('x86_64' 'aarch64')
url="https://github.com/RamazanBerk20/SirinVPN"
license=('AGPL-3.0-only')
depends=('ca-certificates' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'iproute2' 'iputils' 'libayatana-appindicator' 'libsoup3' 'nftables' 'polkit'
         'procps-ng' 'systemd' 'util-linux' 'webkit2gtk-4.1' 'wireguard-tools' 'zlib')
makedepends=('cargo' 'nodejs' 'perl' 'pkgconf' 'pnpm' 'rust')
optdepends=('networkmanager: Wi-Fi automation and an unmanaged measurement probe interface'
            'org.freedesktop.secrets: remember SSH logins in the desktop keyring')
conflicts=('sirinvpn-bin' 'sirinvpn-git')
install=sirinvpn.install
# The release profile already strips symbols; makepkg must not rewrite the VPS
# payloads, which have to stay the signed release's exact bytes.
options=('!lto' '!strip' '!debug')
# The VPS server payloads are the signed release's own files: they run on the
# VPS (Debian 13 or Ubuntu 24.04), so they are built against Debian Bookworm's
# glibc, which an Arch build cannot promise. Everything on this machine is
# built from source.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
        "sirinvpn-server-x86_64-$pkgver::$url/releases/download/$_tag/sirinvpn-server-x86_64"
        "sirinvpn-server-aarch64-$pkgver::$url/releases/download/$_tag/sirinvpn-server-aarch64")
# Filled from the published release by scripts/update-aur-checksums.sh.
sha256sums=('16bb8a320347865cdc5ed1589cdf43c2467429b50404c04c9051c5813ac4e016'
            'f38ab9351f03e2b7624659ac783db4f5a446cda6f6fd17f8a962ac7099df34c8'
            '1d68af4c623470f836c1c26b408e7896453c4110880cc09016446c6195b3ffbf')

prepare() {
  cd "$_srcname"
  # All network fetches happen here so build() and check() work offline.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  pnpm --dir apps/desktop install --frozen-lockfile
}

build() {
  cd "$_srcname"
  local separator=$'\x1f'
  local rustflags="${CARGO_ENCODED_RUSTFLAGS:-}"
  [[ -z "$rustflags" ]] || rustflags+="$separator"
  rustflags+="--remap-path-prefix=$srcdir/$_srcname=."
  rustflags+="$separator--remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  export CARGO_ENCODED_RUSTFLAGS="$rustflags" CARGO_TARGET_DIR=target
  pnpm --dir apps/desktop build
  cargo build --frozen --release \
    -p sirinvpn-cli -p sirinvpn-linux-helper -p sirinvpn-release -p sirinvpn-release-fetch
  # What `tauri build` adds: serve the built frontend from the binary.
  cargo build --frozen --release -p sirinvpn-desktop --features tauri/custom-protocol
}

check() {
  cd "$_srcname"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release \
    -p sirinvpn-cli -p sirinvpn-linux-helper -p sirinvpn-release -p sirinvpn-release-fetch
  pnpm --dir apps/desktop test
}

package() {
  cd "$_srcname"
  local binaries="$srcdir/binaries" host
  mkdir -p "$binaries"
  for host in sirinvpn sirinvpn-helper sirinvpn-release sirinvpn-release-fetch; do
    install -m755 "target/release/$host" "$binaries/$host"
  done
  install -m755 "$srcdir/sirinvpn-server-x86_64-$pkgver" "$binaries/sirinvpn-server-x86_64"
  install -m755 "$srcdir/sirinvpn-server-aarch64-$pkgver" "$binaries/sirinvpn-server-aarch64"
  install -m755 "$binaries/sirinvpn-server-$CARCH" "$binaries/sirinvpn-server"
  DESTDIR="$pkgdir" PREFIX=/usr scripts/install-linux.sh install \
    "$binaries" target/release/sirinvpn-desktop aur
}
