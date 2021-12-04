# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-control-center-system76
_pkgname=${pkgname%-system76}
pkgver=41.2
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop (with System76 patches)"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(x86_64)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd libibus libcheese
         libgudev bolt udisks2 libhandy gsound colord-gtk power-profiles-daemon
         libfirmware-manager
#         libs76-hidpi-widget
         )
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login'
#            'hidpi-daemon'
            )
provides=("$_pkgname" 'firmware-manager-virtual')
conflicts=("$_pkgname")
_commit=babeb0ce357d55406b0ba0a4597e0513a0419de8  # tags/41.2^0
_pop_commit=b0ac308c24521fbd8e82f74b479a99e68167d109 # 1:40.0-1ubuntu5pop0
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
        'git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git'
        'git+https://gitlab.gnome.org/GNOME/libhandy.git'
        "pop-gcc::git+https://github.com/pop-os/gnome-control-center.git#commit=$_pop_commit")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule set-url subprojects/libhandy "$srcdir/libhandy"
  git submodule update

#  patch -Np1 -i ../pop-gcc/debian/patches/pop/'0001-mouse-Add-Disable-While-Typing-toggle-for-touchpad.patch'
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/pop-mouse-accel.patch
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/pop-hidpi.patch
  patch -Np1 -i ../pop-gcc/debian/patches/pop/system76-firmware.patch
}


build() {
  arch-meson $_pkgname build -D documentation=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
