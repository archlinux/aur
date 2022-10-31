# Maintainer: Rekaerst <rekaerst@outlook.com>

pkgname=gnome-settings-daemon-nvidia-backlight-patch
pkgver=42.2
pkgrel=1
pkgdesc="GNOME Settings Daemon with patch to skip nvidia backlight on devices with hybrid graphics"
url="https://gitlab.gnome.org/GNOME/gnome-settings-daemon"
arch=(x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas libcanberra-pulse
         libnotify systemd libwacom pulseaudio pulseaudio-alsa upower librsvg
         libgweather-4 geocode-glib geoclue nss libgudev gtk3 libnm gcr)
makedepends=(libxslt docbook-xsl python git meson usbguard)
checkdepends=(python-gobject python-dbusmock)
optdepends=('usbguard: USB protection support')
provides=(gnome-settings-daemon)
conflicts=(gnome-settings-daemon)
groups=(gnome)
backup=(etc/xdg/Xwayland-session.d/00-xrdb)
_commit=4bdf8b5ae38a382be4126bbc0ce8d87bac46177e  # tags/42.2^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/gnome-settings-daemon.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
		"backlight_skip_nvidia.patch")
sha256sums=('SKIP'
            'SKIP'
            '6e9d8998cef14313cada1d3a056a02c8981e06772e4ca9e4af16839d5ed21808')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
  patch -Np1 -i ../backlight_skip_nvidia.patch
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
