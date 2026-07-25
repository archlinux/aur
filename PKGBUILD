# Maintainer: Kevin <developer@kev314.dev>

# This PKGBUILD repackages Anthropic's official Debian package for Arch.
# Only the .deb's file payload (data.tar.xz) is used: its embedded install
# scripts do Debian/Ubuntu-specific work (apt repository registration and
# an AppArmor exception for Ubuntu's user namespace restriction), so none
# of that is reproduced here.

pkgname=claude-desktop
pkgver=1.24012.9
pkgrel=1
pkgdesc="Official Claude AI desktop app from Anthropic — Chat, Cowork, and Claude Code"
arch=('x86_64' 'aarch64')
url="https://claude.com/download"
license=('LicenseRef-Proprietary')

# Runtime dependencies, from two sources:
#  - the .deb's "Depends:" field, translated to Arch names (Debian and
#    Arch name the same libraries differently, e.g. libgtk-3-0 -> gtk3);
#  - libraries namcap verified the shipped binaries link directly
#    (cairo, dbus, libx11, ... — otherwise they would only be reachable
#    transitively through gtk3's own dependencies, which is fragile).
# alsa-lib is only a "Recommends:" on Debian, but Chromium needs it for
# audio output, so it is a hard dependency here.
# namcap flags some of these as "may not be needed": those are loaded
# with dlopen(), spawned as programs, or used via D-Bus, all invisible
# to namcap's ELF-header analysis. They are needed.
depends=('alsa-lib'
         'at-spi2-core'
         'cairo'
         'dbus'
         'expat'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libcap-ng'
         'libcups'
         'libdrm'
         'libnotify'
         'libseccomp'
         'libsecret'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'libxtst'
         'mesa'
         'nspr'
         'nss'
         'pango'
         'socat'
         'systemd-libs'
         'util-linux-libs'
         'virtiofsd'
         'xdg-desktop-portal'
         'xdg-utils')

# The Cowork feature runs its sandbox inside a QEMU virtual machine.
# Upstream ships the VM stack under "Recommends:", which apt installs by
# default — depending on it here gives Arch users the same out-of-the-box
# experience.
depends_x86_64=('qemu-system-x86' 'edk2-ovmf')
depends_aarch64=('qemu-system-aarch64' 'edk2-aarch64')

optdepends=('gnome-keyring: credential storage via Secret Service (GNOME)'
            'kwallet: credential storage (KDE Plasma)'
            'libayatana-appindicator: system tray icon'
            'xdg-desktop-portal-gtk: portal backend for GTK desktops'
            'xdg-desktop-portal-kde: portal backend for KDE Plasma')

conflicts=('claude' 'claude-desktop-bin')

# makepkg normally strips debug symbols from binaries after package().
# These are prebuilt Electron/Chromium binaries: stripping can corrupt
# them (embedded resources, V8 snapshot data) and saves nothing, so it
# is disabled. !debug disables the companion -debug package, which only
# makes sense when compiling from source.
options=('!strip' '!debug')

_baseurl="https://downloads.claude.ai/claude-desktop/apt/stable/pool/main/c/claude-desktop"
source_x86_64=("${_baseurl}/${pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_baseurl}/${pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('302e6d208dd8c8e9e52067daa28ef3b1171a1613586fd0e10bedc642225b6ee1')
sha256sums_aarch64=('1a9be177b063365b92e522fedd19c87daf6ebc92a9f71121bdff729e27de408c')

package() {
  # A .deb is an ar archive, which makepkg unpacks like any other source:
  # $srcdir holds debian-binary, control.tar.xz (package metadata and the
  # maintainer scripts, both unused here) and data.tar.xz — the file
  # payload, which is the entire package.
  tar -xf data.tar.xz -C "$pkgdir"

  # chrome-sandbox is Chromium's setuid sandbox helper: mode 4755
  # (setuid root) lets it create the browser sandbox on kernels where
  # unprivileged user namespaces are disabled. Arch enables those, so
  # this is only a fallback (e.g. linux-hardened), but we ship it the
  # way upstream and every Chromium-based package does. The tarball
  # already carries this mode; setting it explicitly documents that the
  # setuid bit is intentional.
  chmod 4755 "$pkgdir/usr/lib/claude-desktop/chrome-sandbox"

  # lintian is Debian's package linter; its override file has no
  # consumer on Arch.
  rm -r "$pkgdir/usr/share/lintian"

  # --- Cowork compatibility shims -------------------------------------
  # The app hardcodes Debian's filesystem paths for the Cowork VM stack;
  # these symlinks map them to where Arch actually installs the pieces.
  #
  # virtiofsd: Debian ships it in /usr/bin, Arch in /usr/lib.
  ln -s ../lib/virtiofsd "$pkgdir/usr/bin/virtiofsd"

  # UEFI firmware: on x86_64 the app opens /usr/share/OVMF/OVMF_CODE_4M.fd
  # (Debian naming). On Arch, /usr/share/OVMF is a compat symlink to
  # /usr/share/edk2 (owned by our edk2-ovmf dependency), so links with
  # the Debian names are placed in /usr/share/edk2, pointing at the real
  # firmware in its x64/ subdirectory. Verified against edk2-ovmf 202605.
  #
  # aarch64 needs no such shim: there the app opens
  # /usr/share/AAVMF/AAVMF_CODE.fd, and edk2-aarch64 installs the firmware
  # under exactly that Debian-compatible path.
  if [[ $CARCH == x86_64 ]]; then
    install -d "$pkgdir/usr/share/edk2"
    ln -s x64/OVMF_CODE.4m.fd "$pkgdir/usr/share/edk2/OVMF_CODE_4M.fd"
    ln -s x64/OVMF_VARS.4m.fd "$pkgdir/usr/share/edk2/OVMF_VARS_4M.fd"
  fi
  #
  # Cowork's host<->VM channel also needs the vhost_vsock kernel module,
  # but no configuration is shipped for it: the module declares a
  # devname alias ("devname:vhost-vsock"), so its device node exists at
  # boot and the kernel auto-loads the module on first open (verified on
  # a live Cowork session).

  # Arch convention: every package with a non-common license installs
  # its license text under /usr/share/licenses/<pkgname>/.
  install -Dm644 "$pkgdir/usr/share/doc/claude-desktop/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
