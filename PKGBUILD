# Maintainer: AugusDogus <augie@linux.com>

pkgname=cursor-nightly-bin
pkgver=3.16.2
_upstream_pkgver=3.16.2
pkgrel=1
pkgdesc='AI-first coding environment (nightly channel, bundled Electron)'
arch=('x86_64' 'aarch64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
provides=('cursor')
conflicts=('cursor-bin' 'cursor-early-access-bin' 'cursor-ide-bin')
depends=(
  'alsa-lib'
  'dbus'
  'gcc-libs'
  'gtk3'
  'libdrm'
  'libsecret'
  'libxkbfile'
  'mesa'
  'nss'
  'xdg-utils'
)
optdepends=(
  'libnotify: desktop notifications'
  'org.freedesktop.secrets: credential storage via SecretService'
  'libdbusmenu-glib: KDE global menu support'
)
options=(!strip !debug)
_commit=35d1ed8352c5b21573fc69a8645ec758060f5e14
source_x86_64=(
  "cursor_${_upstream_pkgver}_amd64.deb::https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${_upstream_pkgver}_amd64.deb"
)
source_aarch64=(
  "cursor_${_upstream_pkgver}_arm64.deb::https://downloads.cursor.com/production/${_commit}/linux/arm64/deb/arm64/deb/cursor_${_upstream_pkgver}_arm64.deb"
)
source=(
  cursor.desktop
  cursor-launcher.sh
)
sha512sums_x86_64=('SKIP')
sha512sums_aarch64=('SKIP')
sha512sums=(
  '037aa5d878eddb06fc1d5be788e7bc64545773decacb34228053be746dfc33237371ad49cc331dac8e3437d7d885a9bc1564d0f114fc22e308827b33d0c55ad8'
  '9defecd35fd033a484642732605264cc00faf5791d852234d9705bf9ac005c76173780cd496208e4150685ac9ddbb73c8eb87cd5141526dd4521d455342e8233')
sha512sums_x86_64[0]=e37c7f5df9fe963fa3757700f59ae232b69c1e887197047aef798bc92acba1e429a405c439d6bad9d67f32b214c29c2fbdc604bde6e4462fb320940716ac512c
sha512sums_aarch64[0]=5d5efbeb2552374d1cf19bfc03eb7939e72f6bfac9741e11a9faf5d95e6830125e30e42f95c0b518c185bbc606333d7dc3e56580f4f5738bfd9a89a9967169bf
noextract=(
  "cursor_${_upstream_pkgver}_amd64.deb"
  "cursor_${_upstream_pkgver}_arm64.deb"
)

package() {
  case "$CARCH" in
    x86_64)  _deb="cursor_${_upstream_pkgver}_amd64.deb" ;;
    aarch64) _deb="cursor_${_upstream_pkgver}_arm64.deb" ;;
  esac

  # Extract full deb — keep bundled Electron intact.
  bsdtar -xOf "$_deb" data.tar.xz |
    tar -xJf - -C "$pkgdir"

  # Fix zsh completion path for Arch
  if [[ -d "$pkgdir/usr/share/zsh/vendor-completions" ]]; then
    mv "$pkgdir/usr/share/zsh/vendor-completions" \
       "$pkgdir/usr/share/zsh/site-functions"
  fi

  install -Dm644 "$srcdir/cursor.desktop" \
    "$pkgdir/usr/share/applications/cursor.desktop"

  install -Dm755 "$srcdir/cursor-launcher.sh" "$pkgdir/usr/bin/cursor"

  _license="$pkgdir/usr/share/cursor/resources/app/LICENSE.txt"
  if [[ ! -f "$_license" ]]; then
    _license=$(find "$pkgdir/usr/share/cursor" -maxdepth 8 -type f \( -name 'LICENSE.txt' -o -name 'LICENSE' \) -print -quit 2>/dev/null)
  fi
  if [[ -f "$_license" ]]; then
    install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    echo "Warning: Cursor license file not found in .deb; skipping /usr/share/licenses install" >&2
  fi

  if [[ -f "$pkgdir/usr/share/cursor/chrome-sandbox" ]]; then
    chmod 4755 "$pkgdir/usr/share/cursor/chrome-sandbox"
  fi
}









































































































