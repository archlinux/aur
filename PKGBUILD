# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=xenial
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.19
# vercheck-ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=gnome-settings-daemon-ubuntu
_use_ppa=true
_ppa_rel=0ubuntu1~xenial1
#_ppa_ver=3.19.4
#_ubuntu_rel=0ubuntu1
#_ubuntu_ver=3.18.2
pkgver=3.19.4
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

sha512sums=('27398c96dffbc1e1098b0b4e6601f460247f002e0217c578b632edd883fc7fc0a0c5f92f2916eaee68a0859c967de849a7e8d5dfe99064bc0a39edbccfc56c45'
            '3a18c8fc7661c0799e8e9dc6c6c97dba4f89eb4c5bcb797da7ffd15fcba3e88ea390cf44ca4cfcca48d8d9ef1243be382b32cf4e8879ba17c6060e3898538500')
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
