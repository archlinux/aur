# Maintainer: gohryt
# Based on the official Arch Linux wine package by Peter Jung <ptr1337@archlinux.org>
#
# Pure WoW64 build (no lib32/multilib), Wayland-only (no X11 driver),
# NTSYNC (auto-enabled via linux/ntsync.h from linux-api-headers >= 6.14),
# GStreamer media support.
#
# Source is our Wine fork (gitlab.winehq.org/gohryt/wine), branch wayland-wow64,
# which carries the custom Wayland/Vulkan feature commits (described below) on
# top of upstream Wine. To pin a commit instead of tracking the branch tip,
# replace #branch=wayland-wow64 with #commit=<sha> in source().
#
# LTO is enabled for the native ELF side (the official Arch package uses !lto,
# so revert to that if anything misbehaves at runtime). The PE side is built
# without LTO. mold links the ELF side; Wine 11 builds the preloader as
# -static-pie, so mold's missing -Ttext-segment support is no longer an issue.
#
# The preloader and ntdll.so are compiled with -fno-lto: their hand-written
# asm (_start, __wine_syscall_dispatcher) references C symbols by name, which
# LTO would otherwise discard, breaking the link with undefined references.
#
# Feature commits carried on the branch (in apply order):
#
# - Client-side WSI presenting cross-process Vulkan frames: swapchain images are
#   allocated as DMABUFs, exported, and duplicated into the GDI/Steam process to
#   present on Wayland. Integrates GPU-compositor synchronization via sync_file
#   (SYNC_FD semaphores) to prevent flickering/black frames during scrolls/resizes.
# - Cross-process and GL/VK-obscured child window rendering (WineHQ bug #56014):
#   required for CEF applications (Steam, Battle.net, ...) to display their UI.
#   Includes bottom-up restacking of subsurfaces to match Win32 Z-order (resolving
#   flickering of store/library content), and healing orphaned subsurfaces.
# - Live tracking of compositor text-input (IME): zwp_text_input_v3 is only
#   enabled when an input context is associated (ImmAssociateContext), preventing
#   gameplay keys from getting swallowed after chat interactions.
# - System tray icons via the StatusNotifierItem D-Bus protocol instead of the
#   floating tray window (needs an SNI host: KDE natively, GNOME via the
#   AppIndicator extension; WINEWAYLAND_NO_SNI=1 reverts to the floating window).
#   Requires libdbus at configure time, hence dbus in makedepends.
# - 16bpp cursor fix for Source 2 games (Dota 2): color cursors that GetDIBits
#   cannot convert to 32bpp fall back to a GDI DIB blit. Also fixes 16bpp icons.
# - Windows implicit Vulkan layer loading from the registry (Steam overlay:
#   Shift+Tab in Vulkan/DXVK games works). On by default, disable with
#   WINE_VK_LAYERS=0.
# - Monitor EDID synthesis so games can identify the output (UE titles like
#   Gothic 1 Remake otherwise see no display/resolution list and fall back to
#   borderless native).
# - Per-window surface scale derived from the real compositor output scale
#   (physical mode size / xdg_output logical size) instead of Wine's DPI. Fixes
#   HiDPI / fractional / mixed-DPI window mis-sizing (off-screen or black-border
#   fullscreen) and mouse-offset; also stretches a non-native exclusive
#   fullscreen surface to fill the output.
# - Per-process emulated display modes: a game changing the resolution only
#   affects itself (Windows "fullscreen optimizations" semantics) instead of
#   zooming every other window in the prefix; EmulateModeset restores the old
#   global behaviour. Also runs inside gamescope's nested compositor: prefers
#   GAMESCOPE_WAYLAND_DISPLAY, works without wl_subcompositor/wp_viewporter
#   (GL/VK takes over the toplevel surface, gamescope scales buffers itself),
#   so -w/-h game resolution is honoured.
pkgname=wine-gohryt-wayland-wow64
pkgver=11.17
pkgrel=4
_monover=11.3.0   # must match MONO_VERSION in dlls/appwiz.cpl/addons.c
_geckover=2.47.4  # must match GECKO_VERSION in dlls/appwiz.cpl/addons.c
pkgdesc="Includes fixes for wayland + vulkan, gamepad, steam, unreal, unity, affinity."
url="https://www.winehq.org"
arch=(x86_64)
options=(lto !debug)
license=(LGPL-2.1-or-later)
provides=("wine=$pkgver" "wine-mono=$_monover" "wine-gecko=$_geckover")
conflicts=(wine wine-staging wine-mono wine-gecko)

depends=(
  desktop-file-utils
  fontconfig
  freetype2
  gettext
  glib2
  glibc
  libgcc
  libpcap
  libunwind
  libxkbcommon
  systemd-libs
  wayland
)
makedepends=(
  alsa-lib
  dbus
  ffmpeg
  git
  gnutls
  gst-plugins-base-libs
  libpulse
  mesa
  mingw-w64-gcc
  sdl2
  vulkan-headers
  vulkan-icd-loader
)
optdepends=(
  'alsa-lib: ALSA audio driver'
  'alsa-plugins: ALSA audio plugins'
  'dbus: system tray icons (StatusNotifierItem)'
  'ffmpeg: WMA decoding (winedmo)'
  'gnutls: TLS/SSL support (strongly recommended)'
  'gst-plugins-bad: extra media codecs'
  'gst-plugins-base: media playback'
  'gst-plugins-base-libs: GStreamer media support'
  'gst-plugins-good: extra media codecs'
  'gst-plugins-ugly: extra media codecs'
  'gst-libav: steam video player'
  'libpulse: PulseAudio/PipeWire audio driver'
  'sdl2: game controller support'
  'vulkan-icd-loader: Vulkan support'
)

source=(git+https://gitlab.winehq.org/gohryt/wine.git#branch=wayland-wow64
        https://dl.winehq.org/wine/wine-mono/$_monover/wine-mono-$_monover-x86.tar.xz
        https://dl.winehq.org/wine/wine-gecko/$_geckover/wine-gecko-$_geckover-x86.tar.xz
        https://dl.winehq.org/wine/wine-gecko/$_geckover/wine-gecko-$_geckover-x86_64.tar.xz
        30-win32-aliases.conf
        wine-binfmt.conf
        ntsync.conf)
noextract=(wine-mono-$_monover-x86.tar.xz
           wine-gecko-$_geckover-x86.tar.xz
           wine-gecko-$_geckover-x86_64.tar.xz)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

install=wine.install

prepare() {
  # The Wayland/Vulkan feature commits live in the fork branch (see source),
  # so there is nothing to patch here; just set up the out-of-tree build dir.
  rm -rf build
  mkdir build
}

build() {
  # ccache for the MinGW cross compilers (the native side is handled by
  # makepkg's ccache BUILDENV option, see ~/.config/pacman/makepkg.conf)
  if command -v ccache > /dev/null; then
    local _cc
    mkdir -p "$srcdir/ccache-cross"
    for _cc in x86_64-w64-mingw32-gcc i686-w64-mingw32-gcc \
               x86_64-w64-mingw32-g++ i686-w64-mingw32-g++; do
      printf '#!/bin/sh\nexec ccache /usr/bin/%s "$@"\n' "$_cc" > "$srcdir/ccache-cross/$_cc"
      chmod +x "$srcdir/ccache-cross/$_cc"
    done
    export PATH="$srcdir/ccache-cross:$PATH"
  fi

  # Link the native ELF side with mold (PE side keeps mingw ld)
  export LDFLAGS+=" -fuse-ld=mold"

  # Flags for the MinGW cross-compiled PE parts (no LTO, no mold here)
  export CROSSCFLAGS="-O2 -pipe"
  export CROSSCXXFLAGS="-O2 -pipe"
  export CROSSLDFLAGS="-Wl,-O1"

  cd "$srcdir/build"
  ../wine/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --disable-tests \
    --enable-archs=x86_64,i386 \
    --enable-build-id \
    --without-x \
    --with-wayland \
    --with-gstreamer \
    --with-ffmpeg

  # Build the preloader and ntdll.so without LTO first (see header comment),
  # then everything else; make skips the already-built objects.
  make -j"$(nproc)" CFLAGS="$CFLAGS -fno-lto" \
    loader/preloader.o loader/preloader_mac.o dlls/ntdll/ntdll.so
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/build"
  make -j"$(nproc)" \
    prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  # Load the ntsync kernel module at boot
  install -Dm644 "$srcdir/ntsync.conf" "$pkgdir/usr/lib/modules-load.d/10-ntsync.conf"

  # Bundle wine-mono and wine-gecko: new prefixes pick these up from
  # /usr/share/wine/{mono,gecko} offline, shared across all prefixes
  install -d "$pkgdir/usr/share/wine/mono" "$pkgdir/usr/share/wine/gecko"
  tar xf "$srcdir/wine-mono-$_monover-x86.tar.xz" -C "$pkgdir/usr/share/wine/mono"
  tar xf "$srcdir/wine-gecko-$_geckover-x86.tar.xz" -C "$pkgdir/usr/share/wine/gecko"
  tar xf "$srcdir/wine-gecko-$_geckover-x86_64.tar.xz" -C "$pkgdir/usr/share/wine/gecko"
}
