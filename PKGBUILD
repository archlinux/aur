# SPDX-License-Identifier: LicenseRef-SANSEVIERIA-1.1
# Maintainer: Davide Briani <116493713+brianidavide@users.noreply.github.com>
#
# Kalliope from a published release, already built: unpacks the Linux tarball, compiles nothing.
# The release workflow attaches a copy with the tarball's checksum filled in (kalliope-bin.PKGBUILD),
# and publishes it on AUR as kalliope-bin (.github/workflows/aur.yml). See docs/releasing.md.

pkgname=kalliope-bin
pkgver=0.1
# A test of the release workflow, 0.0-test.N, is written 0.0_test.N here: pkgver cannot contain "-".
_version=${pkgver//_/-}
pkgrel=1
pkgdesc='Type, and be heard in video calls: a local voice through a virtual microphone'
arch=('x86_64')
url='https://github.com/SANSEVIERIA-OU/kalliope'
license=('LicenseRef-SANSEVIERIA-1.1')
# Linked: glibc, gcc-libs, fontconfig. Loaded at run time: libxkbcommon always, then wayland or
# the X11 libraries for the window, and libpipewire for the virtual microphone. ONNX Runtime and
# the voice models come in the tarball (lib/, share/kalliope/): nothing is downloaded.
depends=('glibc' 'gcc-libs' 'fontconfig' 'libxkbcommon')
optdepends=(
  'libpipewire: the virtual microphone'
  'wayland: the window on Wayland'
  'libx11: the window on X11'
  'libxcursor: the window on X11'
  'libxi: the window on X11'
  'libxkbcommon-x11: the window on X11'
)
provides=('kalliope')
conflicts=('kalliope')
options=('!strip' '!debug')
source=("$url/releases/download/v$_version/kalliope-$_version-linux-x86_64.tar.gz")
sha256sums=('e15518909c6491f2de7dbc7da1f0fe770763084f0ffd5fa2c4f0075faa2681ca')

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
