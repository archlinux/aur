# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/presenton-bin

pkgname=presenton-bin
pkgver=0.9.12_beta # renovate: datasource=github-releases depName=presenton/presenton versioning=semver-coerced extractVersion=^electron-v(?<version>.*)$
pkgrel=1
pkgdesc="Open-source AI presentation generator"
arch=('x86_64')
url="https://github.com/presenton/presenton"
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
provides=("presenton=${pkgver}")
conflicts=('presenton')
options=('!strip')

_upstream_version="${pkgver//_/-}"
_tag="electron-v${_upstream_version}"
_deb="Presenton-${_upstream_version}.deb"
source=(
  "${_deb}::https://github.com/presenton/presenton/releases/download/${_tag}/${_deb}"
  "LICENSE::https://raw.githubusercontent.com/presenton/presenton/${_tag}/LICENSE"
)
sha256sums=('d7579f44c0eaeee2e9b0c91cc2341e180788e6f7eb8808ef19d5617a97b961f8'
            '23d6fd64bfcbd46b331098ed89454717fd1719faccbf632f8234b962aa43ed1a')

package() {
  local _deb_extract_dir="$srcdir/deb-extract"
  local _data_archive

  rm -rf "$_deb_extract_dir"
  mkdir -p "$_deb_extract_dir"
  bsdtar -xf "$srcdir/$_deb" -C "$_deb_extract_dir"
  _data_archive=$(find "$_deb_extract_dir" -maxdepth 1 -name 'data.tar.*' -print -quit)
  bsdtar -xf "$_data_archive" -C "$_deb_extract_dir"

  for _directory in opt usr; do
    if [[ -d "$_deb_extract_dir/$_directory" ]]; then
      cp -a "$_deb_extract_dir/$_directory" "$pkgdir/"
    fi
  done

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
