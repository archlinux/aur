# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=meo-kde-348a25525c52329fef6a784bb33a5d503c8fe881
pkgname=meo-desktop
pkgver=0.4.0
pkgrel=23
pkgdesc="Meo Desktop integration for MeoArch, powered by KDE Plasma"
arch=('x86_64')
url='https://github.com/QwQdoge/meo-kde'
license=('GPL-3.0-or-later' 'GPL-2.0-or-later' 'MIT' 'Apache-2.0' 'OFL-1.1')
depends=('meoui-qml>=1.0.4beta1' 'meo-icons>=0.4.0' 'plasma-desktop' 'plasma-workspace>=6.8'
         'plasma-nm' 'plasma-pa' 'powerdevil' 'bluedevil' 'systemsettings' 'dolphin'
         'konsole' 'breeze' 'kwallet-pam' 'polkit-kde-agent' 'networkmanager-qt' 'bluez-qt'
         'solid' 'pulseaudio-qt' 'kguiaddons' 'kwindowsystem' 'kconfig' 'kirigami'
         'libplasma>=6.8' 'kdecoration' 'kcmutils' 'kcolorscheme' 'kio' 'kservice'
         'fcitx5' 'fcitx5-qt' 'fcitx5-gtk'
         'system76-scheduler' 'zram-generator' 'dbus-broker-units'
         'power-profiles-daemon' 'gamemode')
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative' 'polkit-qt6')
# Release-train companion: 'meo-plasma-login-manager'. It intentionally stays
# out of depends= so installing Meo Desktop beside an existing KDE environment
# never replaces that system's display manager.
optdepends=('meo-plasma-login-manager: MeoArch login experience; the Meo session works with other display managers'
            'preload-ng: optional learned application prefetching (disabled by default)'
            'prelockd: optional bounded desktop memory locking (disabled by default)'
            'fcitx5-configtool: advanced Fcitx configuration fallback')
options=('!debug')
provides=('meo-kde-runtime=0.4.0')
conflicts=('meo-kde-runtime')
replaces=('meo-kde-runtime')
install=meo-desktop.install
# Temporary one-cycle adoption path for installations that predate pacman
# ownership of the KDecoration plugin. If an unowned legacy copy exists,
# pacman writes the reviewed package payload as .pacnew and the install hook
# below atomically adopts it during the same transaction.
backup=('usr/lib/qt6/plugins/org.kde.kdecoration3/org.meo.decoration.so')
source=('meo-kde-348a25525c52329fef6a784bb33a5d503c8fe881.tar.gz::https://codeload.github.com/QwQdoge/meo-kde/tar.gz/348a25525c52329fef6a784bb33a5d503c8fe881')
sha256sums=('9bc424d70392e7ba27d82559fa6046e690e8b472217c6997f0072126331cc39d')

# The release renderer supplies a pinned source tree as $srcdir/$_srcdir. This
# recipe intentionally never reads a developer sibling checkout.
build() {
  cmake -S "$srcdir/$_srcdir/native" -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DBUILD_TESTING=OFF
  cmake --build build --parallel "${MEO_BUILD_PARALLEL_LEVEL:-1}"
}

package() {
  # Use the existing KDE polkit agent for this E2E candidate. Do not install a
  # second agent's overlapping service/autostart paths into the same target.
  # The standalone Layer Shell dock is retired and disabled in current MeoKDE.
  for component in system dynamic-color decoration application-style airouter lockscreen translations; do
    DESTDIR="$pkgdir" cmake --install "build/$component"
  done
  local source="$srcdir/$_srcdir"
  install -d "$pkgdir/usr/lib/qt6/qml/MeoKDE" "$pkgdir/usr/share/plasma/look-and-feel" \
    "$pkgdir/usr/share/plasma/desktoptheme" "$pkgdir/usr/share/plasma/plasmoids" \
    "$pkgdir/usr/share/color-schemes" "$pkgdir/usr/share/fonts/meo" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/fcitx5/conf" \
    "$pkgdir/usr/share/wayland-sessions"
  cp -a "$source/qml/MeoKDE/." "$pkgdir/usr/lib/qt6/qml/MeoKDE/"
  cp -a "$source/themes/look-and-feel/org.meo.desktop" "$pkgdir/usr/share/plasma/look-and-feel/"
  install -d "$pkgdir/usr/share/plasma/shells"
  cp -a "$source/themes/shells/org.meo.shell" "$pkgdir/usr/share/plasma/shells/"
  install -Dm644 "$source/themes/look-and-feel/org.meo.desktop/contents/lockscreen/config.xml" \
    "$pkgdir/usr/share/plasma/shells/org.meo.shell/contents/lockscreen/config.xml"
  for theme in MeoLight MeoDark; do
    cp -a "$source/themes/desktoptheme/$theme" "$pkgdir/usr/share/plasma/desktoptheme/"
  done
  # The default layout remains defined by the source layout script. Install
  # every supported Meo top-bar applet so optional variants are available from
  # Plasma's Widget Explorer without rewriting an existing user panel.
  for plasmoid in org.meo.topbar org.meo.timecenter org.meo.notifications \
                  org.meo.time-notifications org.meo.shelf org.meo.toptasks \
                  org.meo.systemmenu org.meo.time org.meo.widgetexplorer \
                  org.meo.widget.clock org.meo.widget.media org.meo.widget.performance; do
    [ ! -d "$source/plasmoids/$plasmoid" ] || \
      cp -a "$source/plasmoids/$plasmoid" "$pkgdir/usr/share/plasma/plasmoids/"
  done
  install -m644 "$source"/themes/color-schemes/*.colors "$pkgdir/usr/share/color-schemes/"
  install -m644 "$source"/assets/fonts/*.ttf "$pkgdir/usr/share/fonts/meo/"
  install -Dm644 "$source/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$source/assets/licenses/GPL-2.0-or-later.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/GPL-2.0-or-later.txt"
  install -Dm644 "$source/THIRD_PARTY_NOTICES.md" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 "$source/assets/fonts/OFL-Roboto.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/OFL-Roboto.txt"
  install -Dm644 "$source/assets/fonts/OFL-Comfortaa.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/OFL-Comfortaa.txt"
  install -Dm644 "$source/assets/licenses/Material-Symbols-Apache-2.0.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/Material-Symbols-Apache-2.0.txt"
  install -Dm644 "$source/native/third_party/material-color-utilities/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/Material-Color-Utilities-Apache-2.0.txt"
  install -Dm644 "$source/assets/licenses/DankMaterialShell-MIT.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/DankMaterialShell-MIT.txt"
  install -Dm644 "$source/assets/wallpapers/installer_background.png" "$pkgdir/usr/share/wallpapers/MeoArch/installer_background.png"
  install -Dm644 "$source/assets/wallpapers/meoarch_default.jpg" "$pkgdir/usr/share/wallpapers/MeoArch/meoarch_default.jpg"
  install -Dm644 "$source/assets/icons/meoarch-logo.svg" "$pkgdir/usr/share/pixmaps/meoarch-logo.svg"
  install -Dm644 "$source/assets/icons/meoarch-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/meoarch-logo.svg"
  install -Dm755 "$source/tools/theme/apply-meo-mode.sh" "$pkgdir/usr/bin/meo-theme-mode"
  install -Dm755 "$source/tools/theme/apply-meo-desktop.sh" "$pkgdir/usr/bin/meo-desktop-apply"
  install -Dm755 "$source/tools/shell/apply-meo-panel-layout.sh" "$pkgdir/usr/bin/meo-desktop-layout"
  install -Dm755 "$source/tools/input-method/meo-input-method.sh" "$pkgdir/usr/bin/meo-input-method"
  install -Dm755 "$source/tools/session/startmeo-wayland" "$pkgdir/usr/bin/startmeo-wayland"
  install -Dm644 "$source/data/wayland-sessions/meo.desktop" "$pkgdir/usr/share/wayland-sessions/meo.desktop"

  # Meo Desktop is a separate login session. Keep all shell/application
  # defaults in a session-owned seed directory; startmeo-wayland copies only
  # missing files into ~/.config/meo-desktop. Installing this package must not
  # change the user's ordinary Plasma configuration under ~/.config or /etc/xdg.
  install -Dm644 "$source/defaults/kde/kdeglobals" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/kdeglobals"
  if [ -f "$source/defaults/kde/kglobalshortcutsrc" ]; then
    install -Dm644 "$source/defaults/kde/kglobalshortcutsrc" \
      "$pkgdir/usr/share/meo-desktop/session-defaults/kglobalshortcutsrc"
  fi
  install -Dm644 "$source/defaults/kwin/kwinrc" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/kwinrc"
  install -Dm644 "$source/defaults/plasma/plasmarc" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/plasmarc"
  install -Dm644 "$source/defaults/kde/kscreenlockerrc" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/kscreenlockerrc"
  install -Dm644 "$source/defaults/plasma/plasma-welcomerc" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/plasma-welcomerc"
  install -Dm644 "$source/defaults/plasma/meo-shellrc" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/meo-shellrc"
  install -Dm644 "$source/defaults/input-method/fcitx5/conf/classicui.conf" \
    "$pkgdir/usr/share/meo-desktop/session-defaults/fcitx5/conf/classicui.conf"

  # os-release is target branding, not an overwrite of Arch filesystem's
  # package-owned symlink. The Installer applies this packaged template.
  install -Dm644 "$source/defaults/system/os-release" "$pkgdir/usr/share/meo-desktop/os-release"

  install -d "$pkgdir/usr/share/fcitx5/themes"
  cp -a "$source/themes/input-method/fcitx5/MeoInputMethod-Light" "$source/themes/input-method/fcitx5/MeoInputMethod-Dark" "$pkgdir/usr/share/fcitx5/themes/"
  for file in gtk.css.in index.theme; do
    install -Dm644 "$source/themes/input-method/ibus/$file" "$pkgdir/usr/share/meo-desktop/input-method/ibus/$file"
  done
  for unit in \
      meo-dynamic-colors.path meo-dynamic-colors.service \
      meo-session-dynamic-colors.path meo-session-dynamic-colors.service \
      meo-weather-refresh.service meo-weather-refresh.timer; do
    install -Dm644 "$source/defaults/systemd/$unit" "$pkgdir/usr/lib/systemd/user/$unit"
  done
  # The session-specific color units are conditioned on MEO_DESKTOP_SESSION=1
  # (exported by startmeo-wayland and imported into the user manager before
  # graphical-session.target), so enabling them leaves a normal Plasma login
  # unchanged. They are the only Meo user units started by the package.
  install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
  for unit in meo-session-dynamic-colors.path meo-session-dynamic-colors.service; do
    ln -s "../$unit" "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/$unit"
  done
  sed -i 's|%h/.local/bin/|/usr/bin/|g' "$pkgdir/usr/lib/systemd/user/meo-dynamic-colors.service"
  # Deliberately do not enable Meo user units globally. A normal Plasma login
  # must remain unchanged merely because meo-desktop is installed. The Meo
  # session/runtime can opt into its own path/timer lifecycle.
  # Keep the installed package consistent with the target responsiveness contract.
  install -Dm644 "$source/defaults/responsiveness/zram-generator.conf" "$pkgdir/usr/lib/systemd/zram-generator.conf.d/50-meo-desktop.conf"
  install -Dm644 "$source/defaults/responsiveness/gamemode.ini" "$pkgdir/etc/gamemode.ini"
  install -Dm644 "$source/defaults/responsiveness/cachyos-ananicy.kdl" "$pkgdir/etc/system76-scheduler/process-scheduler/meo-cachyos.kdl"
  install -Dm644 "$source/defaults/responsiveness/preload-ng-meo.toml" "$pkgdir/usr/share/meo-desktop/optional/preload-ng.toml"
  install -Dm644 "$source/defaults/responsiveness/prelockd-meo.conf" "$pkgdir/usr/share/meo-desktop/optional/prelockd.conf"
  install -Dm644 "$source/defaults/systemd/50-meo-responsiveness.preset" "$pkgdir/usr/lib/systemd/system-preset/50-meo-responsiveness.preset"
  install -Dm644 "$source/defaults/fonts/50-meo-fonts.conf" "$pkgdir/etc/fonts/conf.avail/50-meo-fonts.conf"
  # Only defines the "Meo Sans"/"Meo Brand" family aliases, so enabling it does
  # not alter ordinary Plasma text.
  install -d "$pkgdir/etc/fonts/conf.d"
  ln -s ../conf.avail/50-meo-fonts.conf "$pkgdir/etc/fonts/conf.d/50-meo-fonts.conf"
}
