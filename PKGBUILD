# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=xenial
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.19
# vercheck-ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=gnome-settings-daemon-ubuntu
_use_ppa=true
_ppa_rel=0ubuntu1~xenial1
#_ppa_ver=3.19.92
#_ubuntu_rel=0ubuntu3
#_ubuntu_ver=3.18.2
pkgver=3.19.92
pkgrel=1
pkgdesc="The GNOME Settings daemon with Ubuntu's patches"
arch=(i686 x86_64)
url="http://www.gnome.org"
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas-ubuntu hicolor-icon-theme
         libcanberra-pulse libnotify libsystemd libwacom pulseaudio
         pulseaudio-alsa upower librsvg libgweather geocode-glib geoclue2 nss)
makedepends=(intltool xf86-input-wacom libxslt docbook-xsl python2)
groups=(gnome unity)
provides=("gnome-settings-daemon=${pkgver}")
conflicts=(gnome-settings-daemon)
options=(!emptydirs)
install=gnome-settings-daemon.install
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz"
)

if [[ "${_use_ppa}" == "true" ]]; then
    source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gnome-settings-daemon/gnome-settings-daemon_${_ppa_ver:-${pkgver}}-${_ppa_rel}.debian.tar.xz")
else
    source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gnome-settings-daemon_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi

sha512sums=('7a243216e19520937c90c8b7e5a18081721cf82e7f936a27352e7ceac0acd3cf638a7ef7130b20f63e75172d0fa44c4d104b39a0c6dcb15e1af9cf72d28e6f07'
            '86b149a70e0bcb0af01e2b1cb7b7ee63cc4ae115539b446e78cb2fb11ce40ae6c1dc7f98d7b28d1e3293f1141a9135b5c9ef1f6c6f78ebbca4b1d754adfe600b')

prepare() {
  cd "${pkgname%-*}-${pkgver}"

  # Apply Ubuntu's patches
  patch -p1 -i ../debian/patches/64_restore_terminal_keyboard_shortcut_schema.patch
  patch -p1 -i ../debian/patches/ubuntu-lid-close-suspend.patch
  patch -p1 -i ../debian/patches/revert_background_dropping.patch
  patch -p1 -i ../debian/patches/revert-gsettings-removals.patch
}

build() {
  cd "${pkgname%-*}-${pkgver}"

  autoreconf -vfi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/gnome-settings-daemon \
    --disable-static
      
  # https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
