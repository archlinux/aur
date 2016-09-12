# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=xenial
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.20
# vercheck-ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=gnome-settings-daemon-ubuntu
_use_ppa=true
_ppa_rel=2ubuntu1~ubuntu16.04.1
_ppa_ver=3.20.1
#_ubuntu_rel=0ubuntu3.1
#_ubuntu_ver=3.18.2
pkgver=3.20.1
pkgrel=1
pkgdesc="The GNOME Settings daemon with Ubuntu's patches"
arch=(i686 x86_64)
url="http://www.gnome.org"
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas-ubuntu libcanberra-pulse
         libnotify libsystemd libwacom pulseaudio pulseaudio-alsa upower librsvg
         libgweather geocode-glib geoclue2 nss libgudev)
makedepends=(intltool xf86-input-wacom libxslt docbook-xsl python2)
groups=(gnome unity)
provides=("gnome-settings-daemon=${pkgver}")
conflicts=(gnome-settings-daemon)
options=(!emptydirs)
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz"
)

if [[ "${_use_ppa}" == "true" ]]; then
    source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gnome-settings-daemon/gnome-settings-daemon_${_ppa_ver:-${pkgver}}-${_ppa_rel}.debian.tar.xz")
else
    source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gnome-settings-daemon_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi

sha512sums=('4d8ec7c8d508a0dead00c08ef591c9814bf1c33d0016626c6cd5153bd2aad601ea1146b0e5617465ee276b44d8d622b664817a83e045cece69c2be76c5e33a84'
            '8eb04cf39ad83c8ed1a1b5d280021f19fe87723be387d5569f1f85bf882f366c7bf8a42870726d91408b28d3b7b39011797eb06b625650123128936b73bf8eee')

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
