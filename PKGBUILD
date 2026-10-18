# Maintainer: Wisbendji Fimerlus <archledger236 at gmail dot com>
# SPDX-FileCopyrightText: 2026 Wisbendji Fimerlus <archledger236@gmail.com>
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Plasma Fusion for Arch Linux (the AUR package plasma-fusion; this file in the Plasma Fusion
# repository is its source of truth, docs/RELEASING.md). One split package: the shared themes,
# widgets, icons, fonts and setup tools (any) and the five compiled parts (x86_64), built from the
# signed release tag. The compiled parts use KWin's and KDecoration's API of the installed Plasma:
# rebuild this package after every kwin or kdecoration update (a pacman hook says so; until then the
# Plasma Fusion login check keeps the version-bound parts off).
pkgbase=plasma-fusion
pkgname=(plasma-fusion plasma-fusion-decoration plasma-fusion-settings plasma-fusion-navigation plasma-fusion-quicklook
         plasma-fusion-copytext)
pkgver=0.6.0
pkgrel=1
pkgdesc="Plasma Fusion desktop for KDE Plasma 6"
arch=(x86_64)
url="https://github.com/archledger/plasma-fusion"
license=('GPL-2.0-or-later' 'CC-BY-SA-4.0' 'OFL-1.1')
makedepends=(git python python-pillow python-numpy pyside6 qt6-shadertools librsvg libxml2
             desktop-file-utils cmake ninja extra-cmake-modules qt6-base qt6-declarative kwin
             kdecoration plasma-activities kcoreaddons kconfig kconfigwidgets kglobalaccel ki18n
             kwindowsystem kpackage kcolorscheme kcmutils kio kdbusaddons kservice vulkan-headers libepoxy libdrm
             plasma-workspace plasma-desktop plasma5support systemsettings layer-shell-qt tesseract)
source=("plasma-fusion::git+https://github.com/archledger/plasma-fusion.git#tag=v${pkgver}?signed")
sha256sums=('SKIP')
validpgpkeys=('F35053398E3C80FE20891B82C10B8492BD7F30C6') # Wisbendji Fimerlus (release key)

build() {
  cd plasma-fusion
  # No display: the generators render offscreen and must not start anything in a session.
  env -u DISPLAY -u WAYLAND_DISPLAY -u XAUTHORITY -u DBUS_SESSION_BUS_ADDRESS QT_QPA_PLATFORM=offscreen \
    STAGE="$srcdir/stage" bash tools/build.sh
  QT_QPA_PLATFORM=offscreen bash generators/plymouth/build.sh "$srcdir/plymouth/plasma-fusion"
  local p
  for p in decoration kcm navigation quicklook; do
    cmake -S packages/$p-cpp -B "$srcdir/build-$p" -G Ninja -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DBUILD_TESTING=OFF
    cmake --build "$srcdir/build-$p"
  done
  # The copy-text overlay goes to the helper directory, which on Arch is /usr/lib/plasma-fusion.
  cmake -S packages/copytext-cpp -B "$srcdir/build-copytext" -G Ninja -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DBUILD_TESTING=OFF \
    -DPF_HELPER_DIR=/usr/lib/plasma-fusion
  cmake --build "$srcdir/build-copytext"
}

package_plasma-fusion() {
  arch=(any)
  pkgdesc="Plasma Fusion desktop for KDE Plasma 6 (themes, widgets, icons, fonts, setup tools)"
  depends=(plasma-workspace plasma-desktop libplasma kwin aurorae plasma5support kscreenlocker
           'breeze-icons>=6.30' kconfig kdbusaddons systemd polkit util-linux bash python python-pillow
           fontconfig glib2)
  optdepends=('plasma-fusion-decoration: the Plasma Fusion window decoration'
              'plasma-fusion-settings: the Plasma Fusion page in System Settings'
              'plasma-fusion-quicklook: Quick Look (Space in Dolphin previews files)'
              'plasma-fusion-copytext: copy text from the screen with an instant selection'
              'plasma-fusion-navigation: tablet navigation gestures (convertibles)'
              'pyside6: draw app icons with QtSvg (else librsvg)'
              'librsvg: draw app icons when pyside6 is missing'
              'plasma-keyboard: on-screen keyboard in tablet posture'
              'xournalpp: notes and whiteboard tiles of the pen menu'
              'kate: the design'\''s Code app' 'marknote: the design'\''s Notes app' 'konsole: terminal theme'
              'libnotify: login check notification'
              'tesseract: copy text from the screen in one step (with a tesseract-data-* language)'
              'plasma-nm: network tile' 'plasma-pa: volume tile' 'bluedevil: Bluetooth tile'
              'powerdevil: brightness, battery and power profile tiles' 'kdeconnect: phone tile')
  cd plasma-fusion
  # Arch has no /usr/libexec (package guidelines): the helpers live in /usr/lib/plasma-fusion.
  bash packaging/install-tree.sh --stage "$srcdir/stage" --plymouth "$srcdir/plymouth/plasma-fusion" \
    --destdir "$pkgdir" --prefix /usr --libexecdir /usr/lib
  install -d "$pkgdir/usr/share/plasma-fusion/built-against"
  # After a kwin or kdecoration upgrade: which compiled part needs a rebuild.
  install -Dm0644 packaging/arch/plasma-fusion-rebuild.hook -t "$pkgdir/usr/share/libalpm/hooks/"
  install -Dm0755 packaging/arch/plasma-fusion-rebuild -t "$pkgdir/usr/share/libalpm/scripts/"
  install -Dm0644 LICENSES/GPL-2.0-or-later.txt LICENSES/CC-BY-SA-4.0.txt \
    "$pkgdir"/usr/share/fonts/plasma-fusion/OFL-*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_plasma-fusion-decoration() {
  license=('GPL-2.0-or-later')
  pkgdesc="Plasma Fusion window decoration (KDecoration3 plugin)"
  depends=("plasma-fusion=$pkgver" kdecoration kcoreaddons kconfig kcolorscheme qt6-base gcc-libs glibc)
  DESTDIR="$pkgdir" cmake --install "$srcdir/build-decoration"
}

package_plasma-fusion-settings() {
  license=('GPL-2.0-or-later' 'CC-BY-SA-4.0')
  pkgdesc="Plasma Fusion settings page for System Settings"
  depends=("plasma-fusion=$pkgver" systemsettings plasma-workspace kirigami kcmutils kconfig kcoreaddons
           ki18n qt6-declarative hicolor-icon-theme gcc-libs glibc)
  DESTDIR="$pkgdir" cmake --install "$srcdir/build-kcm"
}

package_plasma-fusion-navigation() {
  license=('GPL-2.0-or-later')
  pkgdesc="Plasma Fusion tablet navigation gestures (KWin effect; rebuild after every kwin update)"
  depends=("plasma-fusion=$pkgver" kwin plasma-activities kconfigwidgets kglobalaccel ki18n kcoreaddons
           kwindowsystem qt6-declarative gcc-libs glibc)
  DESTDIR="$pkgdir" cmake --install "$srcdir/build-navigation"
}

package_plasma-fusion-quicklook() {
  license=('GPL-2.0-or-later')
  pkgdesc="Plasma Fusion Quick Look: preview files without opening them (Space in Dolphin)"
  depends=("plasma-fusion=$pkgver" kio kdbusaddons kservice kwindowsystem ki18n kcoreaddons kirigami
           qqc2-desktop-style syntax-highlighting qt6-declarative qt6-multimedia qt6-base gcc-libs glibc)
  # Arch ships Qt PDF inside qt6-webengine; without it a PDF shows its thumbnail.
  optdepends=('qt6-webengine: PDF pages'
              'kio-extras: thumbnails of other files'
              'kimageformats: more picture formats'
              'qt6-imageformats: WebP, TIFF and other pictures'
              'qt6-svg: SVG pictures'
              'dolphin: Space in Dolphin opens Quick Look')
  DESTDIR="$pkgdir" cmake --install "$srcdir/build-quicklook"
}

package_plasma-fusion-copytext() {
  license=('GPL-2.0-or-later')
  pkgdesc="Plasma Fusion copy text: its own selection overlay (instead of Spectacle's)"
  depends=("plasma-fusion=$pkgver" layer-shell-qt ki18n qt6-declarative qt6-base tesseract gcc-libs glibc)
  DESTDIR="$pkgdir" cmake --install "$srcdir/build-copytext"
}
