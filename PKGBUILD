# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>

pkgname=openai-codex-desktop-bin
pkgver=26.1007.71326
pkgrel=1
pkgdesc='ChatGPT desktop application by OpenAI (upstream Debian binary)'
arch=('x86_64')
url='https://developers.openai.com/codex/app'
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
  'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libglvnd'
  'libnotify' 'libusb' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
  'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss'
  'openssl' 'pango' 'systemd-libs' 'tpm2-tss' 'vulkan-driver' 'wayland'
  'xdg-utils' 'xz'
)
optdepends=('git: Git repository integration')
provides=("chatgpt=${pkgver}")
conflicts=('chatgpt' 'chatgpt-bin')
replaces=('chatgpt-bin')
options=('!strip' '!debug')
_deb="chatgpt_${pkgver}_amd64.deb"
source=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/${_deb}")
noextract=("${_deb}")
sha256sums=('0e006b4931712f5a90d4cd04972c6e0b533cedcdfdb2b51946d5b9367471f556')

package() {
  bsdtar -xOf "${srcdir}/${_deb}" data.tar.xz | bsdtar -xf - -C "$pkgdir" ./usr

  rm -r "$pkgdir/usr/share/lintian"
  install -Dm644 "$pkgdir/usr/share/doc/chatgpt/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/copyright"
  ln -s /usr/lib/chatgpt/LICENSES.chromium.html \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

  rm "$pkgdir/usr/bin/chatgpt"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/chatgpt" << 'EOF'
#!/bin/sh
set -eu

args=
if [ -n "${WAYLAND_DISPLAY-}" ] || [ "${XDG_SESSION_TYPE-}" = wayland ]; then
  case " $* " in
    *' --ozone-platform='* | *' --ozone-platform '*) ;;
    *) args='--ozone-platform=wayland' ;;
  esac
fi

exec /usr/lib/chatgpt/codex-launcher $args "$@"
EOF
}
