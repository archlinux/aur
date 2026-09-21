# Maintainer: LeoDreamer2004

pkgname=plasma6-applets-panon-refreshed-git
pkgver=r5.fe33431
pkgrel=1
pkgdesc='Fork of Panon - Audio spectrum, rotating artwork and synchronized lyrics widget for Plasma 6'
arch=('any')
url='https://github.com/LeoDreamer2004/Panon-Refreshed'
license=('GPL-3.0-or-later')
depends=(
  'plasma-workspace>=6.0'
  'libplasma'
  'plasma5support'
  'kirigami'
  'kcmutils'
  'qt6-declarative'
  'qt6-websockets'
  'qt6-5compat'
  'libpulse'
  'pulse-native-provider'
  'python>=3.10'
  'python-numpy'
  'python-websockets>=13'
  'python-dbus'
  'python-pillow'
)
makedepends=('git' 'gettext' 'qt6-shadertools')
optdepends=(
  'netease-cloud-music-web-player: exact-song-ID NetEase lyrics integration'
  'qqmusic-electron: exact-song-ID QQ Music lyrics integration (1.1.8 adapter)'
  'python-pykakasi: local Japanese furigana readings'
  'python-jaconv: conversion of official romanized Japanese readings'
)
provides=("plasma6-applets-panon-refreshed=$pkgver")
# Both projects install the Plasma plugin ID "panon".
conflicts=('plasma6-applets-panon-refreshed' 'plasma6-applets-panon' 'plasma6-applets-panon-git')
_srcname=panon-refreshed
source=("$_srcname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_srcname"
  local translation language shader
  for translation in po/*.po; do
    language=${translation##*/}
    language=${language%.po}
    mkdir -p "contents/locale/$language/LC_MESSAGES"
    msgfmt --check "$translation" -o "contents/locale/$language/LC_MESSAGES/plasma_applet_panon.mo"
  done
  for shader in contents/ui/shaders/*.frag; do
    /usr/lib/qt6/bin/qsb --qt6 --qsbversion 64 -o "$shader.qsb" "$shader"
  done
}

package() {
  cd "$_srcname"
  local destination="$pkgdir/usr/share/plasma/plasmoids/panon"
  local file
  install -Dm644 metadata.json "$destination/metadata.json"
  # Keep integrations beside contents: QML resolves their launchers relatively.
  # Do not install developer caches, screenshots or per-user launchers.
  while IFS= read -r -d '' file; do
    install -Dm644 "$file" "$destination/$file"
  done < <(find contents integrations -type f \
    ! -path '*/__pycache__/*' ! -name '*.pyc' ! -name '*.pyo' \
    ! -path 'contents/demo/*' -print0)
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.zh-CN.md "$pkgdir/usr/share/doc/$pkgname/README.zh-CN.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
