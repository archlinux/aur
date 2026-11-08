# Maintainer: Qiumix <j487428862@gmail.com>
#
# Prebuilt binary from the release workflow. The tarball unpacks into
# niri-tracker-<target>/ containing the binary, its JSON schema, the systemd
# unit and the licence, so nothing is fetched from a second place.

pkgname=niri-tracker-bin
_pkgname=niri-tracker
pkgver=0.1.6
pkgrel=1
pkgdesc="Screen time tracking for the niri Wayland compositor (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Qiumix/niri-tracker"
license=('MIT')
depends=('glibc')
makedepends=()
checkdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
options=('!strip')
source_x86_64=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8e9d528bdc72b82fc3da4912aa8b6c7601be0890fa1f03f9172b37d4798119df')
sha256sums_aarch64=('91a2a47293ebc854132aa9f23ed026594ee34771fb1d81d11a7c2e073d7e4f07')

package() {
  local _target _dir
  case "$CARCH" in
    x86_64)  _target=x86_64-unknown-linux-gnu ;;
    aarch64) _target=aarch64-unknown-linux-gnu ;;
    *) error "unsupported architecture: $CARCH" ;;
  esac
  _dir="$srcdir/${_pkgname}-${_target}"

  install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_dir/niri-tracker.service" \
    "$pkgdir/usr/lib/systemd/user/niri-tracker.service"
  install -Dm644 "$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_dir/schema.json" "$pkgdir/usr/share/niri-tracker/schema.json"

  # Completions come from the shipped binary, so they match the prebuilt one
  # rather than whatever the packager happens to have installed.
  install -d "$srcdir/completions"
  local shell
  for shell in bash zsh fish; do
    "$_dir/$_pkgname" completions "$shell" > "$srcdir/completions/$shell"
  done
  install -Dm644 "$srcdir/completions/bash" \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "$srcdir/completions/zsh" \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 "$srcdir/completions/fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
