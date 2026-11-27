# SPDX-License-Identifier: LicenseRef-SANSEVIERIA-1.1
# Maintainer: Davide Briani <116493713+brianidavide@users.noreply.github.com>
#
# Kalliope from a published release, already built: unpacks the Linux tarball, compiles nothing.
# The release workflow attaches a copy with the tarball's checksum filled in (kalliope-bin.PKGBUILD),
# and publishes it on AUR as kalliope-bin (.github/workflows/aur.yml). See docs/releasing.md.

pkgname=kalliope-bin
pkgver=0.4
# A test of the release workflow, 0.0-test.N, is written 0.0_test.N here: pkgver cannot contain "-".
_version=${pkgver//_/-}
pkgrel=1
pkgdesc='Type, and be heard in video calls: a local voice through a virtual microphone'
arch=('x86_64')
url='https://github.com/SANSEVIERIA-OU/kalliope'
license=('LicenseRef-SANSEVIERIA-1.1')
# One Slint window on every desktop, drawn by Skia on the CPU: no toolkit, no scripting runtime, no GPU driver. Linked: glibc, gcc-libs,
# fontconfig. Loaded at run time for the window: libxkbcommon, libwayland-client (Wayland), libX11, libX11-xcb, libXcursor, libXi and
# libxkbcommon-x11 (X11). All are required: the window falls back to X11 where Wayland is missing, and a missing X11 library stops it
# (a desktop already has them all). libpipewire is the virtual microphone and records a personal voice; libopus reads Opus voice
# messages (WhatsApp, Telegram) to make a voice from; libdbus asks the desktop's file chooser (portal) for the file to import, with zenity
# as the fallback. ONNX Runtime and the voice models come in the tarball
# (lib/, share/kalliope/): nothing is downloaded. tools/test_packaging.py checks this list against the binary and the CI.
depends=('glibc' 'gcc-libs' 'fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcursor' 'libxi')
optdepends=(
  'libpipewire: the virtual microphone, and recording a personal voice'
  'opus: making a personal voice from WhatsApp and Telegram voice messages'
  'dbus: the desktop file chooser to import a recording (zenity otherwise)'
)
provides=('kalliope')
conflicts=('kalliope')
options=('!strip' '!debug')
source=("$url/releases/download/v$_version/kalliope-$_version-linux-x86_64.tar.gz")
sha256sums=('999119d2f99979b57f2f7d0535c65b2f0c6b63a7b26de7684f6dccf837a2fe26')

package() {
  cd "kalliope-$_version-linux-x86_64"
  install -Dm755 -t "$pkgdir/usr/bin" bin/kalliope bin/kalliope-cli
  install -d "$pkgdir/usr/lib/kalliope"
  cp -P lib/libonnxruntime.so.* "$pkgdir/usr/lib/kalliope/"
  # share/ holds the desktop file, the icons (scalable, symbolic, 48 and 256 px), the AppStream metadata and the voice models
  cp -r share "$pkgdir/usr/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/kalliope/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
