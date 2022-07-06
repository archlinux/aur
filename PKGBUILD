# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-control-center-system76
_pkgname=${pkgname%-system76}
pkgver=41.4
pkgrel=2
pkgdesc="GNOME's main interface to configure various aspects of the desktop (with System76 patches)"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(x86_64)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd libibus libcheese
         libgudev bolt udisks2 libhandy gsound colord-gtk
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
            'power-profiles-daemon: Power profiles support'
#            'hidpi-daemon'
            )
provides=("$_pkgname" 'firmware-manager-virtual')
conflicts=("$_pkgname")
_commit=d08fac3f0be63f0a4c65d26f47d3b77f8738cfab  # tags/41.4^0
_pop_commit=0e020896b6cb6b3c3438b6674cd4a6ee42aa5b72 # 1:41.4-1ubuntu6
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
        'git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git'
        'git+https://gitlab.gnome.org/GNOME/libhandy.git'
        "pop-gcc::git+https://github.com/pop-os/gnome-control-center.git#commit=$_pop_commit")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
#validpgpkeys=('D3FB3AF9711C1CD12639C9F587F211AF2BE4C2FE') # Jeremy Soller (https://soller.dev) <jackpot51@gmail.com>

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Install bare logos into pixmaps, not icons
  sed -i "/install_dir/s/'icons'/'pixmaps'/" panels/info-overview/meson.build

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule set-url subprojects/libhandy "$srcdir/libhandy"
  git submodule update

  # Pop!_OS patches
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/pop-mouse-accel.patch
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/pop-hidpi.patch
  patch -Np1 -i ../pop-gcc/debian/patches/pop/system76-firmware.patch
  patch -Np1 -i ../pop-gcc/debian/patches/pop/'0001-mouse-Add-Disable-While-Typing-toggle-for-touchpad.patch'
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/0001-shell-Fix-bug-when-multiple-panels-use-custom-sideba.patch
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/'0001-keyboard-Pop-_OS-changes-with-support-for-multiple-b.patch'

  # meson: drop unused argument for i18n.merge_file()
  # https://gitlab.gnome.org/GNOME/gnome-control-center/-/commit/37b29c32cbecfd89c9c5e0169e0f2876f00ef5eb
  sed -i "/       desktop,/d" panels/firmware/meson.build
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
