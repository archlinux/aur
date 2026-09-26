# Maintainer: Mohamed Jouini <amad3v@gmail.com>

# For ShellCheck: makepkg sets $srcdir and $pkgdir.
# shellcheck shell=bash disable=SC2154

pkgname=arsu-bin
_pkgname=arsu
pkgver=1.0.0
pkgrel=1
pkgdesc='Offline TOTP/HOTP authenticator with an encrypted local vault (prebuilt)'
arch=('x86_64')
url='https://github.com/amad3v/arsu'
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# The binary ships as released: don't strip it or split out debug symbols.
options=('!strip' '!debug')
_release="$url/releases/download/v$pkgver"
_tree="https://raw.githubusercontent.com/amad3v/arsu/v$pkgver"
# The release's checksums are signed: makepkg checks SHA256SUMS against
# this key, and prepare() checks the binary against SHA256SUMS.
source=(
  "$_pkgname-$pkgver::$_release/$_pkgname"
  "$pkgname-$pkgver-SHA256SUMS::$_release/SHA256SUMS"
  "$pkgname-$pkgver-SHA256SUMS.asc::$_release/SHA256SUMS.asc"
  "$pkgname-$pkgver-LICENSE::$_tree/LICENSE"
  "$pkgname-$pkgver-32.png::$_tree/src-tauri/icons/32x32.png"
  "$pkgname-$pkgver-64.png::$_tree/src-tauri/icons/64x64.png"
  "$pkgname-$pkgver-128.png::$_tree/src-tauri/icons/128x128.png"
  "$pkgname-$pkgver-256.png::$_tree/src-tauri/icons/256x256.png"
  "$pkgname-$pkgver-512.png::$_tree/src-tauri/icons/icon.png"
  'Arsu.desktop'
)
sha256sums=('8d4942c1a690b25a0b102d032fa9bf05fd9f5c5130712a77613b2079c216289f'
            'f78cd1738579b13d197101477ec5e5ca425dfa206bef6ce35fb506fa28cd41fa'
            '24eba6324a20221fd7b8984b4cd6d0da5294f0839c471ec55ac49b538bb8dc56'
            '083d1f47386dfb5ff3ced55505021ebb00dca5ee7438308ef7b898629c97b59c'
            '1e124c7ced39b868698ac8841ff5f577120c3ffa6812ddd629c7665f1bb7a3f9'
            'f1095a50dca1d94f8d9621fbfac032170e6c060c74092f1e371eaa71fbee4dfc'
            'f270a90a1093cefd2a917cac8d5f0ebd76b8b4acd2f124a038582a08f5f9cce4'
            'deb78035858df255d89809dda8c0bd4be3ef2412a67846d3baa091efe962cb65'
            '6d76029d2062dfd9d311e344532b7f18408c92f193dc9ddba0be34cb17a4a1b2'
            '92992d20dde9d11e7171bd9aab1b1de4b85ecaf8fc62dfe20b3ee665e5adf04b')
validpgpkeys=('6A700E00396820D93A829FF91CAC141C34516CB6') # Mohamed Jouini <amad3v@gmail.com>

prepare() {
  # The binary must be the one the signed checksums list.
  local signed
  signed=$(awk '$2 == "arsu" { print $1 }' "$pkgname-$pkgver-SHA256SUMS")
  echo "$signed  $_pkgname-$pkgver" | sha256sum --check
}

package() {
  install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  # Named after the window's app id (arsu), so desktops match the window
  # to its icon directly.
  install -Dm644 Arsu.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  local size
  for size in 32 64 128 256 512; do
    install -Dm644 "$pkgname-$pkgver-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done

  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
