pkgname=maui-shell-bin
_pkgname=${pkgname%-bin}
pkgver=0.0.5
pkgrel=1
pkgdesc='Maui Shell is a convergent shell for desktops, tablets, and phones.'
url='https://github.com/Nitrux/maui-shell'
arch=(x86_64)
license=(GPL3)
depends=(bluedevil
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
         maui-calendar-git
         maui-manager-git
         mauikit-git
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
conflicts=($_pkgname)
source=(https://github.com/Nitrux/maui-shell/releases/download/latest/maui-shell-latest-x86_64.AppImage)
sha256sums=('SKIP')

build() {
  chmod +x ./maui-shell-latest-x86_64.AppImage
}

pkgver() {
  printf "$($srcdir/squashfs-root/usr/bin/cask -v |& grep cask | cut -f2 -d ' ')"
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

  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/maui/cask/libCaskLib.so" "$pkgdir/usr/lib/qt/qml/org/maui/cask/libCaskLib.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/maui/cask/qmldir" "$pkgdir/usr/lib/qt/qml/org/maui/cask/qmldir"

  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/notifications/libCaskNotifications.so" "$pkgdir/usr/lib/qt/qml/org/cask/notifications/libCaskNotifications.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/notifications/qmldir" "$pkgdir/usr/lib/qt/qml/org/cask/notifications/qmldir"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/polkit/libCaskPolkit.so" "$pkgdir/usr/lib/qt/qml/org/cask/polkit/libCaskPolkit.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/polkit/qmldir" "$pkgdir/usr/lib/qt/qml/org/cask/polkit/qmldir"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/power/qmldir" "$pkgdir/usr/lib/qt/qml/org/cask/power/qmldir"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/qt5/qml/org/cask/power/libCaskPower.so" "$pkgdir/usr/lib/qt/qml/org/cask/power/libCaskPower.so"

  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskServerLib.so" "$pkgdir/usr/lib/libCaskServerLib.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskPower.so" "$pkgdir/usr/lib/libCaskPower.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskPolkit.so" "$pkgdir/usr/lib/libCaskPolkit.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskNotifications.so" "$pkgdir/usr/lib/libCaskNotifications.so"
  install -Dm 644 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libCaskLib.so" "$pkgdir/usr/lib/libCaskLib.so"

  #using libexec is against the guide lines but since we are not recompiling we can't change it
  install -Dm 755 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libexec/cask-dbus-run-session-if-needed" "$pkgdir/usr/lib/$pkgname/cask-dbus-run-session-if-needed"
  install -Dm 755 "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu/libexec/cask-sourceenv.sh" "$pkgdir/usr/lib/$pkgname/cask-sourceenv.sh"
}
