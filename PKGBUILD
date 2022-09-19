# Maintainer: Marc barbier <mmarc471@gmail.com>

# Contributor: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

pkgname=maui-shell-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.0
pkgrel=1
pkgdesc='Maui Shell is a convergent shell for desktops, tablets, and phones.'
url='https://github.com/Nitrux/maui-shell'
arch=(x86_64)
license=(GPL3)
depends=(bluedevil
         akonadi-calendar
         fontconfig
         kactivities
         kactivities-stats
         karchive
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kded
         kdesu
         kdoctools
         kglobalaccel
         ki18n
         kiconthemes
         kidletime
         kinit
         kio
         kitemmodels
         knotifications
         knotifyconfig
         kpackage
         kpeople
         krunner
         kservice
         ktexteditor
         kunitconversion
         kwallet
         kwayland
         libcanberra
         mauiman
         mauikit
         mauikit-filebrowsing
         phonon-qt5
         plasma-nm
         plasma-pa
         polkit-qt5
         prison
         qt5-base
         qt5-declarative
         qt5-quickcontrols2
         qt5-svg
         qt5-wayland
         solid
         sound-theme-freedesktop)

makedepends=( patchelf )
optdepends=('maui-settings-git: Settings Manager Apps for the Maui DE')
groups=(maui)
provides=($_pkgname)
conflicts=($_pkgname 'maui-calendar-git')
source=(https://github.com/Nitrux/maui-shell/releases/download/latest/maui-shell-latest-x86_64.AppImage)
sha256sums=('6cc86e7c2ecaef16030953443a8ae99300faeccbfa3c3eef892ec12cb6b36df3')

build() {
  chmod +x ./maui-shell-latest-x86_64.AppImage
}

prepare() {
  chmod +x ./maui-shell-latest-x86_64.AppImage
  ./maui-shell-latest-x86_64.AppImage --appimage-extract

  strip --strip-all "$srcdir/squashfs-root/usr/bin/cask"
  strip --strip-all "$srcdir/squashfs-root/usr/bin/CaskServer"
  strip --strip-all "$srcdir/squashfs-root/usr/bin/cask_session"
  strip --strip-all "$srcdir/squashfs-root/usr/bin/startcask-wayland"

  patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "$srcdir/squashfs-root/usr/bin/cask"
  patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "$srcdir/squashfs-root/usr/bin/CaskServer"
  patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "$srcdir/squashfs-root/usr/bin/cask_session"
  patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "$srcdir/squashfs-root/usr/bin/startcask-wayland"
}
package() {
  install -Dm 755 "$srcdir/squashfs-root/usr/bin/cask" "$pkgdir/usr/bin/cask"
  install -Dm 755 "$srcdir/squashfs-root/usr/bin/CaskServer" "$pkgdir/usr/bin/CaskServer"
  install -Dm 755 "$srcdir/squashfs-root/usr/bin/cask_session" "$pkgdir/usr/bin/cask_session"
  install -Dm 755 "$srcdir/squashfs-root/usr/bin/startcask-wayland" "$pkgdir/usr/bin/startcask-wayland"

  #Configs
  install -Dm 644 "$srcdir/squashfs-root/usr/share/wayland-sessions/cask-session.desktop" "$pkgdir/usr/share/wayland-sessions/cask-session.desktop"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/applications/cask.desktop" "$pkgdir/usr/share/applications/cask.desktop"
  install -Dm 644 "$srcdir/squashfs-root/etc/xdg/autostart/cask.desktop" "$pkgdir/etc/xdg/autostart/cask.desktop"

  install -Dm 644 "$srcdir/squashfs-root/usr/share/wallpapers/Cask/maui_shell_dev_bg.png" "$pkgdir/usr/share/wallpapers/Cask/maui_shell_dev_bg.png"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/wallpapers/Cask/LICENSE" "$pkgdir/usr/share/wallpapers/Cask/LICENSE"


  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libMauiCoreNotifications.so.1.0.0" "$pkgdir/usr/lib/libMauiCoreNotifications.so.1.0.0"
  ln -s "/usr/lib/libMauiCoreNotifications.so.1.0.0" "$pkgdir/usr/lib/libMauiCoreNotifications.so.1"
  ln -s "/usr/lib/libMauiCoreNotifications.so.1.0.0" "$pkgdir/usr/lib/libMauiCoreNotifications.so"

  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskPolkit.so" "$pkgdir/usr/lib/libCaskPolkit.so"

  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libMauiCorePower.so.1.0.0" "$pkgdir/usr/lib/libMauiCorePower.so.1.0.0"
  ln -s "/usr/lib/libMauiCorePower.so.1.0.0" "$pkgdir/usr/lib/libMauiCorePower.so"
  ln -s "/usr/lib/libMauiCorePower.so.1.0.0" "$pkgdir/usr/lib/libMauiCorePower.so.1"

  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskServerLib.so" "$pkgdir/usr/lib/libCaskServerLib.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskLib.so" "$pkgdir/usr/lib/libCaskLib.so"

  install -Dm 644 "$srcdir/squashfs-root/usr/share/dbus-1/services/org.cask.server.service" "$pkgdir/usr/share/dbus-1/services/org.cask.server.service"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/dbus-1/services/org.mauiman.server.service" "$pkgdir/usr/share/dbus-1/services/org.mauiman.server.service"

  #links
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libMauiCoreAudio.so.1.0.0" "$pkgdir/usr/lib/libMauiCoreAudio.so.1.0.0"
  ln -s "/usr/lib/libMauiCoreAudio.so.1.0.0" "$pkgdir/usr/lib/libMauiCoreAudio.so.1"
  ln -s "/usr/lib/libMauiCoreAudio.so.1.0.0" "$pkgdir/usr/lib/libMauiCoreAudio.so"

  install -Dm 755 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libexec/cask-dbus-run-session-if-needed" "$pkgdir/usr/lib/libexec/cask-dbus-run-session-if-needed"
  install -Dm 755 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libexec/cask-sourceenv.sh" "$pkgdir/usr/lib/libexec/cask-sourceenv.sh"

  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/maui-pix.svg" "$pkgdir/usr/share/icons/hicolor/64x64/maui-pix.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/maui-station.svg" "$pkgdir/usr/share/icons/hicolor/64x64/maui-station.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/maui-shelf.svg" "$pkgdir/usr/share/icons/hicolor/64x64/maui-shelf.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/maui-communicator.svg" "$pkgdir/usr/share/icons/hicolor/64x64/maui-communicator.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/maui-contacts.svg" "$pkgdir/usr/share/icons/hicolor/64x64/maui-contacts.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/maui-clip.svg" "$pkgdir/usr/share/icons/hicolor/64x64/maui-clip.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/system-reboot.svg" "$pkgdir/usr/share/icons/hicolor/64x64/system-reboot.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/system-suspend.svg" "$pkgdir/usr/share/icons/hicolor/64x64/system-suspend.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/system-log-out.svg" "$pkgdir/usr/share/icons/hicolor/64x64/system-log-out.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/system-switch-user.svg" "$pkgdir/usr/share/icons/hicolor/64x64/system-switch-user.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/64/system-shutdown.svg" "$pkgdir/usr/share/icons/hicolor/64x64/system-shutdown.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/16/maui-buho.svg" "$pkgdir/usr/share/icons/hicolor/16x16/maui-buho.svg"
  install -Dm 644 "$srcdir/squashfs-root/usr/share/icons/hicolor/apps/16/maui-station.svg" "$pkgdir/usr/share/icons/hicolor/16x16/maui-station.svg"

  install -Dm 644 \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/RadioButton.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/MenuSeparator.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ProgressBar.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Button.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Drawer.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/BusyIndicator.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ItemDelegate.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/SpinBox.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ToolBar.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Popup.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ScrollBar.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Dial.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/StackView.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/TabBar.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/SwitchDelegate.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ComboBox.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/SwitchIndicator.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/DialogButtonBox.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Container.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/RadioIndicator.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/TabButton.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Label.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/CheckIndicator.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Dialog.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/private/MobileCursor.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/private/DefaultListItemBackground.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Page.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/MenuItem.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ToolSeparator.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/TextField.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/CheckBox.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/TextArea.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ApplicationWindow.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/LICENSE" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Frame.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Pane.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/SplitView.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/RangeSlider.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/SwipeView.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ToolTip.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/style.qrc" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Control.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Menu.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/RadioDelegate.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ToolButton.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Slider.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/GroupBox.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/Switch.qml" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/README.md" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls.2/maui-style/ScrollView.qml" \
    -t "$pkgdir/usr/lib/qt/qml/QtQuick/Controls.2/maui-style/"

  install -Dm 644 \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/audio/libMauiCoreAudio.so.1" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/audio/qmldir" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/audio/libMauiCoreAudio.so.1.0.0" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/audio/libMauiCoreAudio.so" \
    -t "$pkgdir/usr/lib/qt/qml/org/mauicore/audio"

  install -Dm 644 \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/notifications/libMauiCoreNotifications.so.1" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/notifications/libMauiCoreNotifications.so.1.0.0" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/notifications/qmldir" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/notifications/libMauiCoreNotifications.so" \
    -t "$pkgdir/usr/lib/qt/qml/org/mauicore/notifications"

  install -Dm 644 \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/power/libMauiCorePower.so.1" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/power/libMauiCorePower.so" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/power/libMauiCorePower.so.1.0.0" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/mauicore/power/qmldir" \
    -t "$pkgdir/usr/lib/qt/qml/org/mauicore/power"

  install -Dm 644 \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/maui/calendar/libMauiCalendarLib.so" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/maui/calendar/qmldir" \
    -t "$pkgdir/usr/lib/qt/qml/org/maui/calendar"

  install -Dm 644 \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/maui/cask/libCaskLib.so" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/maui/cask/qmldir" \
    -t "$pkgdir/usr/lib/qt/qml/org/maui/cask/"


  install -Dm 644 \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/polkit/libCaskPolkit.so" \
    "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/polkit/qmldir" \
    -t "$pkgdir/usr/lib/qt/qml/org/cask/polkit"

}
