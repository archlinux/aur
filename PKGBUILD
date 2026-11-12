# Maintainer: hanami117 <hello at getuzumaki dot app>
#
# The AUR package `uzumaki-bin`: the files of the release's AppImage, installed like the source
# package `uzumaki` (packaging/aur/PKGBUILD), with nothing built. The AppImage is built in an
# ubuntu:22.04 container (packaging/appimage/container.sh), so it needs glibc 2.35 or newer.
# For a new release:
#   - pkgver, _build   as in packaging/aur/PKGBUILD (pkgrel back to 1)
#   - sha256sums       Uzumaki-<release>-x86_64.AppImage.sha256 on the release
# Then: makepkg --printsrcinfo > .SRCINFO, test, and push PKGBUILD + .SRCINFO to
# ssh://aur@aur.archlinux.org/uzumaki-bin.git.
#
# Layout: the same as `uzumaki`, so the app behaves the same (both conflict):
#   /usr/lib/uzumaki/uzumaki, uzu      the binaries; /usr/bin/uzumaki and /usr/bin/uzu link to them
#   /usr/lib/uzumaki/bridge/           the playback bridge with castLabs Electron
#   /usr/share/applications, /usr/share/icons/hicolor, /usr/share/uzumaki/icons/<variant>,
#   /usr/share/licenses/uzumaki-bin
# Not /opt: the app decides from its own path whether it is a package install (app/src/update.rs,
# install_kind: under /usr, not /usr/local). There its update notice says "update with your
# package manager" instead of offering a download.
#
# Sandbox: the AppImage runs Electron with --no-sandbox, because a file inside an AppImage can't be
# setuid. A package can: chrome-sandbox is installed root-owned and setuid, as in `uzumaki`, and
# nothing here turns the sandbox off. The app adds --no-sandbox only when it runs from inside an
# AppImage (APPIMAGE and APPDIR set and the binary under APPDIR; bridge.rs, running_from_appimage),
# never from /usr/lib. AppImages built from the 0.1.0 source wrapped Electron instead (electron was
# a script that starts electron.bin with --no-sandbox, see packaging/appimage/build.sh); from 0.1.1
# there is no wrapper, and prepare() still puts the real binary back if one ever shows up.
#
# Update notice and channel: the AppImage is built without UZUMAKI_CHANNEL (on purpose), so this
# binary under /usr/lib/uzumaki counts as a package install: its notice says "Update with your
# package manager" (not "yay -Syu uzumaki", which would name the other package) and its daily check
# reports the channel "system". Only a copy running from inside an AppImage reports "appimage".
#
# Libraries: the AppImage bundles libxkbcommon-x11 and libxcb-xkb for distributions without them;
# this package drops that copy and depends on Arch's. Everything else (GTK, NSS, ...) comes from
# the system, as for the source package.
# The Widevine CDM is not in this package: Chromium downloads it from Google on first use.

pkgname=uzumaki-bin
_name=uzumaki
pkgver=0.1.1
# The upstream build: 1 is tag v<version>, a rebuild of the same version is v<version>-<build>.
_build=1
if ((_build > 1)); then _rel=$pkgver-$_build; else _rel=$pkgver; fi
pkgrel=1
pkgdesc='Native desktop client for Apple Music, GPU-rendered in Rust (needs a subscription; prebuilt)'
arch=('x86_64')
url='https://getuzumaki.app'
license=('GPL-3.0-or-later')
# The same run-time needs as `uzumaki` (see its PKGBUILD for why each is listed by hand).
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libnotify'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11' # winit's X11 backend dlopens libxkbcommon-x11.so.0 and panics without it
  'libxkbfile'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
  'pango'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'vulkan-driver: GPU drawing (vulkan-radeon, vulkan-intel or nvidia-utils)'
  'libsecret: Chromium can store its cookies encrypted with the keyring'
)
provides=("$_name=$pkgver")
conflicts=("$_name")
# Prebuilt: don't strip (Electron's binaries) and no debug package.
options=('!strip' '!debug')
_appimage=Uzumaki-$_rel-x86_64.AppImage
source=("$_appimage::https://github.com/hanami117/uzumaki/releases/download/v$_rel/$_appimage")
noextract=("$_appimage")
sha256sums=('3c09eaeed66d9d6b06658691732c183230cdd8abc22ec6146dbe75a5ef77d8ce')

prepare() {
  # The AppImage's runtime unpacks its own squashfs into squashfs-root/ (no FUSE needed). Nothing
  # of the app runs. APPIMAGELAUNCHER_DISABLE keeps AppImageLauncher's binfmt hook out of it.
  rm -rf squashfs-root
  chmod +x "$_appimage"
  APPIMAGELAUNCHER_DISABLE=1 "./$_appimage" --appimage-extract >/dev/null

  local lib=squashfs-root/usr/lib/$_name
  # Arch's libxkbcommon-x11 / libxcb-xkb instead of the bundled copies (the binary's RUNPATH
  # $ORIGIN/lib then finds nothing and the loader uses the system's).
  rm -rf "$lib/lib"
  # A --no-sandbox wrapper (AppImages built from 0.1.0, see the top): back to the real Electron.
  local dist=$lib/bridge/node_modules/electron/dist
  if [[ -f $dist/electron.bin ]]; then
    mv -f "$dist/electron.bin" "$dist/electron"
  fi
  # Fail rather than package a sandbox-less Electron.
  if head -c 2 "$dist/electron" | grep -q '#!'; then
    echo "electron in the AppImage is a script, not the binary" >&2
    return 1
  fi
}

package() {
  cd squashfs-root
  local lib="$pkgdir/usr/lib/$_name"

  install -dm755 "$pkgdir/usr/lib"
  cp -a --no-preserve=ownership "usr/lib/$_name" "$pkgdir/usr/lib/"
  # The extracted tree keeps the AppImage's modes, and Electron's zip has group-writable files
  # (rwxrwxr-x): no write bits for group and others on root-owned files.
  find "$lib" -type d -exec chmod 755 {} +
  chmod -R go-w "$lib"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_name/uzumaki" "$pkgdir/usr/bin/uzumaki"
  ln -s "/usr/lib/$_name/uzu" "$pkgdir/usr/bin/uzu"
  # Chromium's sandbox helper, root-owned and setuid (as in `uzumaki`; Chromium uses it only where
  # unprivileged user namespaces are off).
  chmod 4755 "$lib/bridge/node_modules/electron/dist/chrome-sandbox"

  install -Dm644 "usr/share/applications/io.github.hanami117.uzumaki.desktop" \
    "$pkgdir/usr/share/applications/io.github.hanami117.uzumaki.desktop"
  local icon size
  for icon in usr/share/icons/hicolor/*/apps/io.github.hanami117.uzumaki.png; do
    size=$(basename "$(dirname "$(dirname "$icon")")")
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/io.github.hanami117.uzumaki.png"
  done
  # The variants behind Settings -> Appearance -> App icon (the app never writes here).
  local variant
  for variant in usr/share/$_name/icons/*/; do
    install -dm755 "$pkgdir/usr/share/$_name/icons/$(basename "$variant")"
    install -m644 "$variant"*.png "$pkgdir/usr/share/$_name/icons/$(basename "$variant")/"
  done

  install -Dm644 "usr/share/licenses/$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "usr/share/licenses/$_name/THIRD_PARTY_NOTICES.md" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}
