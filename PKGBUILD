# Maintainer: alfdupont <93726722+alfdupont@users.noreply.github.com>

pkgname=i3status-rs-ai-usage
pkgver=1.0.3
pkgrel=1
pkgdesc='AI subscription quota (Claude, Codex, Copilot) as an i3status-rust block for swaybar and i3bar'
arch=('any')
url='https://github.com/alfdupont/i3status-rs-ai-usage'
license=('GPL-3.0-or-later')
# i3status-rust is a hard dependency: `render` emits i3status-rust's custom
# block JSON, which is the entire point of the package. Note that the AUR
# i3status-rust-git / -full-git packages do not declare provides=('i3status-rust'),
# so users of those will need to add it locally.
depends=('python' 'i3status-rust')
makedepends=('git')
# The font is genuinely optional: the default labels are the ASCII strings
# CL/CX/CP, and the only other glyphs on the default path are the ordinary
# text characters U+221E, U+2026 and U+00B7. Icons are opt-in via config.
optdepends=(
  'github-cli: fallback for reading the Copilot quota'
  'otf-font-awesome: vendor logo glyphs instead of text labels'
  'libnotify: right-click usage breakdown via notify-send'
)
# Sourced from the signed-off tag rather than a generated tarball: this
# PKGBUILD ships inside the repository, so a tarball checksum would have to
# live inside the tarball it verifies. The tag is the integrity anchor.
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # The shipped units point at ~/.local/bin for manual installs; a packaged
  # install lives in /usr/bin.
  install -dm755 "$pkgdir/usr/lib/systemd/user"
  for unit in systemd/"$pkgname".{service,timer}; do
    sed "s|%h/\.local/bin/$pkgname|/usr/bin/$pkgname|" "$unit" \
      > "$pkgdir/usr/lib/systemd/user/${unit##*/}"
    chmod 644 "$pkgdir/usr/lib/systemd/user/${unit##*/}"
  done

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 examples/* -t "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
