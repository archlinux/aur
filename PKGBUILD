# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=yakkety
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.22
# vercheck-ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=gnome-settings-daemon-ubuntu
_use_ppa=false
#_ppa_rel=2ubuntu1~ubuntu16.04.1
#_ppa_ver=3.20.1
_ubuntu_rel=0ubuntu2
#_ubuntu_ver=3.22.1
pkgver=3.22.1
pkgrel=1
pkgdesc="GNOME Settings Daemon"
url="https://git.gnome.org/browse/gnome-settings-daemon"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf geoclue2 geocode-glib gnome-desktop gsettings-desktop-schemas-ubuntu
	gtk3-print-backends libcanberra-pulse libgudev libgweather libnotify librsvg 
	libsystemd libwacom nss pulseaudio pulseaudio-alsa upower)
makedepends=(docbook-xsl git gnome-common intltool libxslt python xf86-input-wacom)
groups=(gnome unity)
provides=("gnome-settings-daemon=${pkgver}")
conflicts=(gnome-settings-daemon)
_commit=3ee42193f8772b5eb39b0b5a4d175b00abce033d  # tags/GNOME_SETTINGS_DAEMON_3_22_1^0
source=("git://git.gnome.org/gnome-settings-daemon#commit=${_commit}"
        "git://git.gnome.org/libgnome-volume-control")

if [[ "${_use_ppa}" == "true" ]]; then
    source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gnome-settings-daemon/gnome-settings-daemon_${_ppa_ver:-${pkgver}}-${_ppa_rel}.debian.tar.xz")
else
    source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gnome-settings-daemon_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi

sha512sums=('SKIP'
            'SKIP'
            'c1e270e5a1eb89d929d7a5d6b5e538bee3798c64e66ad31b722dd857e80ea288095f6d74867c64708366e151a64ed1607c2584d75c578491cafcc1bf6c170e28')

pkgver() {
    cd "${pkgname%-*}"
    git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
    cd "${pkgname%-*}"

    git submodule init
    git config --local submodule."panels/media-keys/gvc".url "${srcdir}/libgnome-volume-control"
    git submodule update

    # Apply Ubuntu's patches
    patch -p1 -i ../debian/patches/64_restore_terminal_keyboard_shortcut_schema.patch
    patch -p1 -i ../debian/patches/ubuntu-lid-close-suspend.patch
    patch -p1 -i ../debian/patches/revert_background_dropping.patch
    patch -p1 -i ../debian/patches/revert-gsettings-removals.patch

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${pkgname%-*}"

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
    cd "${pkgname%-*}"
    make DESTDIR="${pkgdir}" install
}
