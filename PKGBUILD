pkgname=phub-cli-git
pkgver=0.4.0.3.gede080b
pkgrel=1
pkgdesc="CLI tool for browsing pornhub.com content (phub-cli)"
arch=('x86_64')
url="https://github.com/curtosis-org/phub-cli"
license=('custom')
depends=('bash' 'mpv' 'fzf' 'yt-dlp' 'python' 'python-beautifulsoup4')
source=("git+https://github.com/curtosis-org/phub-cli")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/phub-cli"
  git describe --long --tags --always | sed 's/^v//;s/-/./g'
}

package() {
  local PREFIX="/usr"
  local BIN="$pkgdir$PREFIX/bin"
  local SHARE="$pkgdir$PREFIX/share/phub-cli"

  install -d "$BIN"
  install -d "$SHARE"

  cp -r "$srcdir/phub-cli/modules" "$SHARE/"

  install -Dm755 "$srcdir/phub-cli/phub-cli" "$BIN/phub-cli"

  echo "▶ Patching module path"
  sed -i "s|^DIR=.*|DIR=\"/usr/share/phub-cli\"|" "$BIN/phub-cli"

  echo "▶ Setting permissions"
  chmod +x "$SHARE/modules/"*.sh
  chmod +x "$SHARE/modules/"*.py

  echo "$pkgver" > "$SHARE/.version"
}
