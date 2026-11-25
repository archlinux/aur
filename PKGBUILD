# Maintainer: MareDevi <me@maredevi.moe>
# Binary repackage of the official NetEase UU Remote (uuyc) Debian package,
# fetched through the release endpoint used by https://uuyc.163.com/install.sh.
# The payload already uses FHS paths (/opt/uuyc, /usr/bin, /usr/lib/systemd,
# /usr/share); only the Debian /lib/systemd copy is relocated and the
# maintainer-script work is reimplemented in uu-remote-official-bin.install.

pkgname=uu-remote-official-bin
pkgver=4.48.6.41668
pkgrel=1
pkgdesc='UU远程官方 Linux 客户端'
arch=('x86_64')
url='https://uuyc.163.com/'
license=('custom')
depends=(
  'glibc' 'gcc-libs' 'libatomic' 'systemd' 'systemd-libs'
  'ca-certificates' 'curl' 'dbus' 'glib2' 'fontconfig' 'freetype2'
  'cairo' 'libpng' 'zlib' 'zstd'
  'libx11' 'libxcb' 'libxext' 'libxfixes' 'libxi' 'libxrender' 'libxrandr' 'libxres'
  'xcb-util' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm'
  'libxkbcommon' 'libxkbcommon-x11' 'libdrm' 'libglvnd' 'vulkan-icd-loader'
  'libpulse' 'webkit2gtk-4.1' 'bubblewrap' 'apparmor' 'xkeyboard-config'
)
optdepends=(
  'xdg-desktop-portal: native file dialogs via the xdgdesktopportal platform theme'
  'ibus: CJK input in the Qt 5 client when ibus is your input method'
  'qt5-translations: Qt 5 UI strings in non-English locales'
)
provides=('uuyc' 'uuyc-bin')
conflicts=('uuyc' 'uuyc-bin')
options=('!strip' '!debug')
install="$pkgname.install"
# Same endpoint the official installer uses (it 302s to a versioned .deb on
# gdl.netease.com with rotating signed query strings, so it cannot be pinned).
# The installer verifies package name/arch/version only; we pin the checksum
# instead - a new upstream release fails verification and needs `updpkgsums`.
source=("uuyc.deb::https://api.nrd.nie.163.com/api/v1/release/dl/8?channel=gwqd")
sha256sums=('ceec564f9e80c891d1e3b586e7e1520a98e6c3e98997400c8e5fb63f145bf07a')
makedepends=('libarchive')

# Re-derives pkgver from the control member so a release bump is just
# `updpkgsums` + rebuild; the Debian revision belongs to pkgrel.
pkgver() {
  local version
  version=$(bsdtar -xOf "$srcdir/uuyc.deb" control.tar.zst \
    | bsdtar -xOf - ./control \
    | sed -n 's/^Version:[[:space:]]*//p')
  printf '%s\n' "${version%-*}"
}

package() {
  # data.tar.zst is the FHS payload; control.tar.* only holds Debian scripts.
  bsdtar -xf "$srcdir/uuyc.deb" -C "$srcdir" data.tar.zst
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  # Debian ships units under /lib; Arch's /lib is a symlink to /usr/lib, so a
  # real /lib directory would collide with the filesystem package.
  if [[ -d "$pkgdir/lib" ]]; then
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    mv "$pkgdir/lib/systemd/system/"* "$pkgdir/usr/lib/systemd/system/"
    rm -rf "$pkgdir/lib"
  fi

  # Debian maintainer scripts are not run by pacman; equivalent work lives in
  # uu-remote-official-bin.install (state dirs, AppArmor profile, systemd units).
  rm -f "$srcdir/data.tar.zst"
}
