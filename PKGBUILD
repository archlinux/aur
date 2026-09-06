# Maintainer: Sean Behan <codebam@riseup.net>
#
# The same compositor as `viewport-webkitgtk`, already built. The
# source package compiles the whole tree — Smithay, wgpu and a WebKitGTK shell
# process — which is an hour on a laptop; this one unpacks the binaries the
# release was cut with instead.
#
# The upstream artifact is itself an Arch package, built from the recipe in
# packaging/aur/viewport-webkitgtk of the tagged tree, so what lands in $pkgdir here is
# byte for byte what the source package would have produced.

pkgname=viewport-webkitgtk-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Wayland compositor whose shell is a web page — WebKitGTK, out of process (binary release)'
arch=('x86_64')
url='https://github.com/codebam/viewport'
license=('GPL-3.0-or-later')

# The pkgrel of the upstream artifact, which moves independently of this
# package's own: a fix to this recipe bumps pkgrel without a new release to
# download.
_pkgrel=1

depends=(
  'wayland'
  'libxkbcommon'
  'libdrm'
  'libinput'
  'seatd'
  'systemd-libs'
  'mesa'
  'libglvnd'
  'vulkan-icd-loader'
  'pipewire'
  'libxcb'
  'webkitgtk-6.0'
  'gtk4'
  # WebKit guesses the type of a file:// page from the shared MIME database.
  # Without it the bundled shell loads "successfully" and draws nothing.
  'shared-mime-info'
)

optdepends=(
  'xorg-xwayland: X11 clients'
  'xdg-desktop-portal-gtk: the portal interfaces the compositor does not answer itself'
  # Vulkan is the renderer wherever a Vulkan device owns the display; without
  # one the compositor draws with OpenGL instead, so these are what decide
  # which of the two a machine gets rather than whether it starts at all.
  'vulkan-radeon: AMD hardware'
  'vulkan-intel: Intel hardware'
  'nvidia-utils: NVIDIA hardware, and hardware video decode with it'
  # In a virtual machine: Venus passes Vulkan through to the host's GPU, and
  # needs the host to offer it — QEMU wants
  # `-device virtio-gpu-gl-pci,venus=on,blob=on,hostmem=2G`. Without it the
  # only device that loads is lavapipe, which owns no DRM node, cannot drive
  # a display, and turns every shell-frame copy into a copy on the CPU.
  'vulkan-virtio: a virtual machine with 3D acceleration'
  'vulkan-swrast: software Vulkan, for tests rather than a session'
  'libva-mesa-driver: hardware video decode, for zero-copy video'
  # The bar's icons are Material Design glyphs from a Nerd Font patch, and the
  # family names in the shell's CSS are the ones fontconfig reports:
  # "FiraCode Nerd Font" first, "Symbols Nerd Font" as the fallback that
  # carries the glyphs without the monospace face. With neither installed the
  # bar still lays out and every icon in it is a replacement box.
  'ttf-firacode-nerd: the icons in the bar, and the font the shell names first'
  'ttf-nerd-fonts-symbols: the icons in the bar, without the patched monospace family'
)

provides=("viewport=$pkgver" "viewport-webkitgtk=$pkgver")
# Every engine's package installs a binary called `viewport` and provides that
# name, so a system takes one of them — this one, the source recipe it was
# built from, or another engine's.
conflicts=('viewport'
           'viewport-webkitgtk'
           'viewport-wpe'
           'viewport-chromium')

# Nothing to strip and nothing to index: these binaries were stripped where
# they were built, and a -debug package cut from them would hold no symbols.
options=('!strip' '!debug')

# Downloaded under a name that is not *.pkg.tar.*, so the artifact sitting in
# the build directory is not mistaken for the package this recipe produced.
source_x86_64=("$pkgname-$pkgver.tar.zst::$url/releases/download/v$pkgver/viewport-webkitgtk-$pkgver-$_pkgrel-$CARCH.pkg.tar.zst")
sha256sums_x86_64=('66e60b18767c23615716dbb04c19fc4a8bb735f3f9dd2fd08a11f6e0e8224354')

package() {
  # The source is an Arch package, so makepkg has already unpacked a $pkgdir
  # tree into $srcdir; everything beside usr/ is package metadata that pacman
  # generates again for this package.
  cp -a "$srcdir/usr" "$pkgdir/usr"

  # The man page comes with the artifact rather than being installed here:
  # this recipe unpacks a built package, so `$srcdir` holds `usr/` and the
  # metadata pacman regenerates, and there is no source tree to copy a page
  # out of. The source recipe installs it, so the `cp -a` above carries it.

  # The licence directory is named for the package that installed it, and that
  # is a different name here.
  mv "$pkgdir/usr/share/licenses/viewport-webkitgtk" \
     "$pkgdir/usr/share/licenses/$pkgname"
}
