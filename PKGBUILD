# Maintainer: ohemilyy <ohemilyy@proton.me>
pkgname=flavor
pkgver=0.1.0beta4
_ver=${pkgver/beta/-beta.}
pkgrel=1
pkgdesc='Several Tailscale and Headscale networks side by side, in one desktop app and daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/tame-gg/Flavor'
license=('MIT')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo-auditable' 'git' 'go' 'jq' 'npm' 'rust')
optdepends=('polkit: system-wide names through the flavor-netd helper')
backup=('etc/apparmor.d/flavor-netd')
options=('!debug')
install=flavor.install
validpgpkeys=('0DFC432162BF84C0FD780619FBB96BCEC0361F01')
source=("git+$url.git#tag=v$_ver?signed")
sha256sums=('SKIP')

prepare() {
  export GOPATH="$srcdir/gopath" CARGO_HOME="$srcdir/cargo" npm_config_cache="$srcdir/npm-cache" GOFLAGS="-modcacherw"
  cd Flavor
  ./scripts/go.sh mod download
  cargo fetch --locked
  (cd desktop && npm ci)
}

build() {
  export GOPATH="$srcdir/gopath" CARGO_HOME="$srcdir/cargo" npm_config_cache="$srcdir/npm-cache" GOFLAGS="-modcacherw"
  local _arch=amd64
  [[ $CARCH == aarch64 ]] && _arch=arm64
  cd Flavor
  ./scripts/release.sh "$_ver" "$_arch"
}

package() {
  local _arch=amd64
  [[ $CARCH == aarch64 ]] && _arch=arm64
  cd "Flavor/dist/flavor-$_ver-linux-$_arch"
  cp -a usr etc "$pkgdir/"
  rm "$pkgdir/usr/libexec/flavor/uninstall" "$pkgdir/usr/share/flavor/manifest"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
