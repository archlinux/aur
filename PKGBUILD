# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-control-center-system76
_pkgname=${pkgname%-system76}
pkgver=41.2
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
  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Fix build with Meson 0.61.0
  git cherry-pick -n 37b29c32cbecfd89c9c5e0169e0f2876f00ef5eb

  # https://gitlab.gnome.org/GNOME/gnome-control-center/-/issues/1562
  git cherry-pick -n 293e191e399123c91ef5d7b5c796ea0f42b8bd91

  # Install bare logos into pixmaps, not icons
  sed -i "/install_dir/s/'icons'/'pixmaps'/" panels/info-overview/meson.build

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule set-url subprojects/libhandy "$srcdir/libhandy"
  git submodule update

#  patch -Np1 -i ../pop-gcc/debian/patches/pop/'0001-mouse-Add-Disable-While-Typing-toggle-for-touchpad.patch'
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/pop-mouse-accel.patch
#  patch -Np1 -i ../pop-gcc/debian/patches/pop/pop-hidpi.patch
  patch -Np1 -i ../pop-gcc/debian/patches/pop/system76-firmware.patch

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
