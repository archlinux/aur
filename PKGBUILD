# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=wily

pkgname=unity-settings-daemon
_actual_ver=15.04.1
_extra_ver=+15.10.20151012
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=2
pkgdesc="Unity Settings Daemon"
arch=(i686 x86_64)
url="https://launchpad.net/unity-settings-daemon"
license=(GPL)
groups=(unity)
depends=(gnome-settings-daemon-ubuntu gsettings-desktop-schemas-ubuntu fcitx
         gperf hicolor-icon-theme ibus libappindicator3 libcanberra-pulse
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
sha512sums=('2ba49c34e86eb5bb05c88981009aea472b53a2c29237c146ef798b61f76c455eed9fc4a22f2dc703442c99086a7ab3eb60dfa13ab96512d5f7fca6a827754835'
'57b35496544132c606fcfa50a72c3b2d1a61ef1327d60c3121f02baec65ffc0b9870d62a465ffb59ffac967a51b95a3ea2889fe9e845c9c045b774a0418fded7'                        
'44d067ac6e813c8be20d9dba4980bcc27bf700b210e80f3256e2ba240406a34b9d1f208a2e1eda9d2d9a12ca0a5be9a21d54caeac43d8242aa0eb6ccaf439f6d'
'ca017a06b8d8974205cdbf9fe3de99e29bc4fc791749f526c356998e093deed220d61c9ca8e75544782e105b8c4ba67e67a65a0f729a56522ccae5279b49544b')

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
