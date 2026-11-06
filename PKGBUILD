# Maintainer: Qiumix <j487428862@gmail.com>
#
# Prebuilt binary from the release workflow. The tarball unpacks into
# niri-tracker-<target>/ containing the binary, its JSON schema, the systemd
# unit and the licence, so nothing is fetched from a second place.

pkgname=niri-tracker-bin
_pkgname=niri-tracker
pkgver=0.1.3
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
sha256sums_x86_64=('c520e6f6b91ae677810e8d81c335d8cccfdc8e4e687ee96c9a7f6a533cef6b02')
sha256sums_aarch64=('d659126b2b0477acf785b644bc3f3b784f688f002e14a7f02a9d0b0ec9652eee')

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
