# Maintainer:
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname="thorium-browser"
pkgname="$_pkgname-bin"
pkgbase="$pkgname"
pkgver=138.0.7204.300
pkgrel=1
pkgdesc="Chromium fork focused on high performance and security"
url="https://github.com/Alex313031/thorium"
license=('BSD-3-Clause')
arch=('x86_64')

options=('!emptydirs' '!strip' '!debug')

install="$_pkgname.install"

_dl_url="$url/releases/download/M${pkgver}"
_dl_filename="${_pkgname}_${pkgver}_SSE3.deb"
noextract+=("$_dl_filename")

source=("$_dl_url/$_dl_filename")
sha256sums=('24ec07b74fb2f920fdca16b909f917131bcc6d2cec873546a92e5269ac838b58')

prepare() {
  install -Dm644 /dev/stdin "$_pkgname.sh" << END
#!/usr/bin/env bash

# check microprocessor architecture level
if grep -qsE '\bpni\b' /proc/cpuinfo ; then
  _message=''
  _message+=\$'The fastest browser on Earth.'
else
  _message=''
  _message+=\$'Your processor does not support SSE3 instructions.\n'
  _message+=\$'thorium-browser may not work on your computer.'
fi

# Allow users to override command-line options
XDG_CONFIG_HOME=\${XDG_CONFIG_HOME:-~/.config}
_FLAGS_FILE="\$XDG_CONFIG_HOME/thorium-flags.conf"

if [[ -f "\$_FLAGS_FILE" ]]; then
  _USER_FLAGS="\$(cat "\$_FLAGS_FILE")"
fi

# display processor support message
if tty -s ; then
  echo "\$_message"
else
  [ ! -e "\$XDG_CONFIG_HOME/thorium" ] && notify-send -a "thorium-browser" -t 7500 "\$_message"
fi

# Launch
exec /opt/thorium-browser/thorium-browser \$_USER_FLAGS "\$@"
END
}

package() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

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
  bsdtar -xf "$_dl_filename" data.tar.xz
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  rm data.tar.xz

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
  echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
  rm -r -- \
    "$pkgdir/opt/chromium.org" \
    "$pkgdir/etc/cron.daily/" \
    "$pkgdir/usr/share/doc/" \
    "$pkgdir/opt/$_pkgname/cron/" \
    "$pkgdir/opt/$_pkgname"/product_logo_*.{png,xpm} \
    "$pkgdir/usr/share/menu/"
}
