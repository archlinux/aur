# Maintainer: AugusDogus <augie@linux.com>

pkgname=cursor-early-access-bin
pkgver=3.19.7
_upstream_pkgver=3.19.7
pkgrel=1
pkgdesc='AI-first coding environment (early access channel, bundled Electron)'
arch=('x86_64' 'aarch64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
provides=('cursor')
conflicts=('cursor-bin' 'cursor-nightly-bin' 'cursor-ide-bin')
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
_commit=90de2327392570a5f5f625c656c6749d228e6437
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
sha512sums_x86_64[0]=f1749bb4824dd5bff10853ba341320ca79b4d606151bc1ad54ccd9fea3c44aa4b838f3d767ba9396a63c15c461c7d1a389f5a1ecbaf26ed64000cae5e981c342
sha512sums_aarch64[0]=4078b9fafc7b6327e2677201a53f936780d585c2d9f29aa01ec7010a947eec234ced1f78f5e605a951945a36c0f737b8c850c4b71fae0b55385514cf5e284c50
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

































































