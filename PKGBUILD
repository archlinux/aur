# Maintainer: Rodney Osodo <socials@rodneyosodo.com>

# Installs the release's prebuilt static binaries. CI updates pkgver and the checksums when upstream releases
# (see .github/workflows/release-packages.yml).

pkgname=clacks-bin
_pkgname=clacks
pkgver=0.2.1
pkgrel=1
pkgdesc='Encrypted, self-hosted sync for AI coding sessions (prebuilt)'
arch=(x86_64 aarch64)
url='https://github.com/rodneyosodo/clacks'
license=(MIT)
optdepends=('opencode: the sessions clacks syncs')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip !debug)
# The release's file names carry no version, so name them per version to keep makepkg's source cache apart.
source=(clacks.service)
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-arm64.tar.gz")
sha256sums=('f40acb644896600724a249e5d6b261ff38bcd3adffd70cc9034961f17681999f')
sha256sums_x86_64=('538d0d0ccfff23423d32bdc5d83440448c03231d8615383a447ee2fc4ad9f933')
sha256sums_aarch64=('b347cc1d0219fb7cc7e647439b1b71fabaa68b07a09e081b8713fa0b0e5c5666')

package() {
  local goarch
  case "$CARCH" in
    x86_64) goarch=amd64 ;;
    aarch64) goarch=arm64 ;;
  esac
  install -Dm755 "$_pkgname-linux-$goarch" "$pkgdir/usr/bin/$_pkgname"

  local shell
  for shell in bash zsh fish; do
    "$pkgdir/usr/bin/$_pkgname" completion "$shell" >"completion.$shell"
  done
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

  install -Dm644 clacks.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
