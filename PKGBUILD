# Maintainer: Oliver Cross <you@example.com>
#
# Nightjar desktop client for Linux -- an Arch (-bin) package built from the official release
# tarball. Upstream keeps an equivalent, deliberately unpublished AUR recipe at
#   protocol/desktop/packaging/linux/aur/PKGBUILD.in
# which packaging/linux/build-packages.sh fills in with the version + SHA-256. This is that recipe
# instantiated for v4.12.1, plus aarch64 support, the GPL-3.0 license text, and system-wide
# USB-forwarding integration. See README.md for the design and verification notes.

pkgname=nightjar-desktop-bin
pkgver=4.12.9
# Version string as it appears in GitHub tags and release asset names. Equals $pkgver for stable
# tags. For a prerelease tag v4.13.0-rc.1 use pkgver=4.13.0_rc.1 and _version=4.13.0-rc.1
# (Arch forbids '-' in pkgver; upstream's generator maps '-' <-> '_').
_version=4.12.9
pkgrel=1
pkgdesc='Moonlight-protocol game-streaming client'
arch=('x86_64' 'aarch64')
url='https://github.com/RamazanKara/nightjar'
license=('GPL-3.0-only')
install=nightjar-desktop-bin.install

# Directly linked libraries. The release tarball bundles FFmpeg (libavcodec/libavutil) and dav1d
# in lib/, found through the executable's $ORIGIN/lib RUNPATH, so the system FFmpeg is irrelevant.
# SDL3 is linked statically and dlopen()s the display/audio/input libraries at run time; X11 and
# ALSA are required for SDL to start at all. systemd-libs provides libudev.so.1.
depends=('glibc' 'gcc-libs' 'opus' 'libva' 'alsa-lib' 'libx11' 'libxext'
         'systemd-libs' 'hicolor-icon-theme')
optdepends=('vulkan-icd-loader: PyroWave GPU decoding'
            'libva-mesa-driver: hardware decoding on AMD and Intel GPUs (provided by mesa)'
            'libpulse: PulseAudio and PipeWire audio'
            'libdecor: window decorations on Wayland'
            'usbip: USB forwarding (USB/IP userspace tools)'
            'polkit: USB forwarding (pkexec for the root helper)')
provides=('nightjar')
conflicts=('nightjar')
options=('!strip' '!debug')   # already stripped upstream; no -debug split for a -bin package

# Each archive extracts to a top-level directory named exactly like this (verified for both arches).
_name="nightjar-desktop-$_version-linux-$CARCH"

source=("https://raw.githubusercontent.com/RamazanKara/nightjar/v$_version/LICENSE.txt")
source_x86_64=("https://github.com/RamazanKara/nightjar/releases/download/v$_version/nightjar-desktop-$_version-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/RamazanKara/nightjar/releases/download/v$_version/nightjar-desktop-$_version-linux-aarch64.tar.gz")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('faf9ab5021c395e961fd65d3e3521489e67569adc23804abbc609056c53fc1e9')
sha256sums_aarch64=('3cd3d97c5d213c20845db87c1bd64b2cbed8c4e6c880ea0fe863e3e8c3f1d4c6')

package() {
  # Whole prebuilt tree under /opt: binary, bundled FFmpeg/dav1d/PyroWave libs in lib/, the
  # bundled third-party licence texts, and the share/ and usb/ data directories.
  install -d "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share"
  cp -a "$srcdir/$_name" "$pkgdir/opt/nightjar"

  # Desktop entry, hicolor icons and AppStream metainfo belong under /usr/share (upstream recipe).
  mv "$pkgdir/opt/nightjar/share"/* "$pkgdir/usr/share/"
  rmdir "$pkgdir/opt/nightjar/share"

  # Launcher on PATH.
  ln -s /opt/nightjar/nightjar "$pkgdir/usr/bin/nightjar"

  # USB forwarding: nightjar-usb-helper hardcodes these absolute paths in its polkit policy and
  # udev rule, so install them here (as the official .deb/.rpm do) rather than relying on the
  # app's runtime self-install. Pacman then owns every file. To use upstream's self-install
  # behaviour instead, drop these three lines and the install=/.install file.
  install -Dm755 "$srcdir/$_name/usb/nightjar-usb-helper" \
    "$pkgdir/usr/lib/nightjar/nightjar-usb-helper"
  install -Dm644 "$srcdir/$_name/usb/io.github.ramazankara.nightjar.usb.policy" \
    "$pkgdir/usr/share/polkit-1/actions/io.github.ramazankara.nightjar.usb.policy"
  install -Dm644 "$srcdir/$_name/usb/90-nightjar-usb.rules" \
    "$pkgdir/usr/lib/udev/rules.d/90-nightjar-usb.rules"

  # GPL-3.0 text for Nightjar itself. The release tarball does NOT carry it (it only ships the
  # bundled FFmpeg/dav1d/PyroWave licence texts, which remain in /opt/nightjar/licenses-*).
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
