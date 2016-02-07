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
#_ppa_ver=3.19.5
#_ubuntu_rel=0ubuntu1
#_ubuntu_ver=3.18.2
pkgver=3.19.5
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

sha512sums=('c6d1529766aff5d90d0cc055d90ae0516700243fc5e86bd96d2a40506da5f356c14fad2db936faeca350407803d358a50a8020b4ecba58e21cb428bf8fccfe88'
            '57708693d527a6f9de9a6ad116d690a00c79831b07f9cba70927554324416f6282b6e168a921d9dd1686cf6ac1ae88e5d0d973e2bd0c4f13936c3027db5102a7')

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
