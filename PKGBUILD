# Maintainer:
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname="thorium-browser"
pkgname="$_pkgname-bin"
pkgbase="$pkgname"
pkgver=138.0.7204.303
pkgrel=2
pkgdesc="Chromium fork focused on high performance and security"
url="https://github.com/Alex313031/thorium"
license=('BSD-3-Clause')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!emptydirs' '!strip' '!debug')

_dl_url="$url/releases/download/M${pkgver}"
_dl_filename="${_pkgname}_${pkgver}_SSE3.deb"
noextract+=("$_dl_filename")

source=("$_dl_url/$_dl_filename")
sha256sums=('bacb67c4b8a4e685e505c09d46c7f55cdd5f66ed2e75b970fc3b63d59314563e')

prepare() {
  install -Dm644 /dev/stdin "$_pkgname.sh" << END
#!/usr/bin/env bash

set -euo pipefail

name=thorium
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
  mapfile -t lines < "\${flags_file}"
fi

flags=()
for line in "\${lines[@]}"; do
  if [[ ! "\${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "\${line}" ]]; then
    flags+=("\${line}")
  fi
done

exec /opt/thorium-browser/thorium-browser "\${flags[@]}" "\$@"
END
}

package() {
  depends+=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'libcups'
    'libnotify' # notify-send
    'libxcomposite'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
  )

  echo "  -> Extracting the archive..."
  bsdtar -xf "$_dl_filename" data.tar.*
  bsdtar -C "$pkgdir/" -xf data.tar.*

  echo "  -> Moving files in place..."
  mv "$pkgdir/opt/chromium.org/thorium" "$pkgdir/opt/$_pkgname"
  unlink "$pkgdir/usr/bin/thorium-browser"
  unlink "$pkgdir/usr/bin/pak"

  # thorium-browser
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  chmod 4755 "$pkgdir/opt/$_pkgname/chrome-sandbox"

  # thorium-shell
  sed -E \
    -e "s@/opt/chromium.org/thorium/@/opt/$_pkgname/@" \
    -i "$pkgdir/usr/bin/thorium-shell"

  # thorium-browser.xml
  sed -E \
    -e "s@/opt/chromium.org/thorium/@/opt/$_pkgname/@" \
    -i "$pkgdir/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

  # Icons
  install -Dm644 "$pkgdir/opt/$_pkgname/product_logo_256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 "$pkgdir/opt/$_pkgname/thorium_shell.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/thorium-shell.png"

  # clean-up
  rm -r -- \
    "$pkgdir/opt/chromium.org" \
    "$pkgdir/etc/cron.daily/" \
    "$pkgdir/usr/share/doc/" \
    "$pkgdir/opt/$_pkgname/cron/" \
    "$pkgdir/opt/$_pkgname"/product_logo_*.{png,xpm} \
    "$pkgdir/usr/share/menu/"
}
