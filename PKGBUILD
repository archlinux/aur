# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=wily
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.18
# vercheck-ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=gnome-settings-daemon-ubuntu
_use_ppa=true
_ppa_rel=0ubuntu1~wily1
#_ppa_ver=3.18.2
#_ubuntu_rel=0ubuntu1
#_ubuntu_ver=3.16.3
pkgver=3.18.2
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

sha512sums=('53d6f57330c453d94ae643023209f9524681a129b88e9077fab305c57a707e2118e9d7a0a5f5ffe76b1349deecd26ea96e232b04298f9306c3e437c4dffc286f'
            '72b1416a5daacb3e46193ed90a51adbc0f3edd11fa927f5f69794aab8a8dcca58c3bed102bb925017aedcbd10bd548ec6fc6168a56bd3f0622aa6a6d760c2dc4')

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
