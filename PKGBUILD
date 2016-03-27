# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=xenial

pkgname=unity-settings-daemon
_actual_ver=15.04.1
_extra_ver=+16.04.20160209
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Unity Settings Daemon"
arch=(i686 x86_64)
url="https://launchpad.net/unity-settings-daemon"
license=(GPL)
groups=(unity)
depends=(gnome-settings-daemon-ubuntu gsettings-desktop-schemas-ubuntu fcitx
         gperf hicolor-icon-theme ibus libappindicator-gtk3-ubuntu libcanberra-pulse
         libnotify librsvg libsystemd libwacom libxkbfile mesa pulseaudio
         pulseaudio-alsa upower)
makedepends=(intltool xf86-input-wacom libxslt docbook-xsl python2)
conflicts=(gnome-desktop-compat upower-compat)
unity=settings-install-daemon.install
#options=('!emptydirs')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/unity-settings-daemon_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001-Remove-accountsservice-dependency.patch
        0002-Add-gnome-settings-daemon-3.12-rfkill-plugin.patch
        0003-Use-GNOME-3.16-deprecated-schemas.patch)
sha512sums=('a40ea34883e9a7d1726754c0ee154531296d58faba2b1fba008e0ad50fdf268ce8d055120d98d4be108b3dd31ab83e5aef6cab2cb74d0f6334b9237113f93a83'
            '38e49274e9e12dabb7f5d6a2fd058aad94c749e46e44030cd6c550e544f9f0ef30f56effa8dd55b46a208221d04b179b3f16d4894e0e887820685b4c7b8273f2'
            '3cb2735c15c3acb4bcbd78da1c31dddda2f707b48fec46294a705a7688d277040aa1f7891b8c56cbd73b4f138805006bd0a2d569b7b4ac8f4ac3f297d5abb6ac'
            '9d036512105a20f1a2f045a7c6b87faedacb25748239babe3f79514c7899af74ab0e56e8d184406d183cdb2be6518f37681b03cdb6ce20901f0381b6bd0d7d68')

prepare() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"

  patch -p1 -i ../0001-Remove-accountsservice-dependency.patch
  patch -p1 -i ../0002-Add-gnome-settings-daemon-3.12-rfkill-plugin.patch
  patch -p1 -i ../0003-Use-GNOME-3.16-deprecated-schemas.patch

  # Temporarily disable since it fails to link to glib
  sed -i '/noinst_PROGRAMS += test-wm-button-layout-translations/d' plugins/xsettings/Makefile.am
}

build() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"

  autoreconf -vfi
  intltoolize -f

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/unity-settings-daemon \
    --disable-static \
    --enable-systemd \
    --enable-fcitx

  # https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"
  make DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s /usr/lib/unity-settings-daemon/unity-settings-daemon \
    "${pkgdir}/usr/bin/unity-settings-daemon"

  # Use language packs
  rm -r "${pkgdir}/usr/share/locale/"
}
