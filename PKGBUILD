# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=gtk+3.0, repo=wily
# vercheck-archlinux: name=gtk3, repo=extra, arch=x86_64
# vercheck-gnome: name=gtk+, majorver=3.18
# vercheck-ppa: name=gtk+3.0, url=ppa:gnome3-team/gnome3-staging

_use_ppa=true

pkgname=gtk3-ubuntu
_ppa_rel=1ubuntu1~wily1
#_ubuntu_rel=0ubuntu3.3
#_ubuntu_ver=3.16.7
pkgver=3.18.6
pkgrel=1
pkgdesc="GObject-based multi-platform toolkit (v3)"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo gtk-update-icon-cache libcups libepoxy libxcursor libxinerama
         libxrandr libxi libxcomposite libxdamage pango shared-mime-info
         colord at-spi2-atk wayland libxkbcommon adwaita-icon-theme
         json-glib rest)
makedepends=(gobject-introspection)
provides=("gtk3=${pkgver}")
conflicts=(gtk3)
license=(LGPL)
source=("http://ftp.gnome.org/pub/GNOME/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz")

if [[ "${_use_ppa}" != "true" ]]; then
  source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
else
  source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gtk+3.0/gtk+3.0_${_ppa_ver:-${pkgver}}-${_ppa_rel}.debian.tar.xz")
fi

sha512sums=('a606bfeb7e6991c9c367d6c93d04d70daed6c59b95d1ef14b971acb32b23e71894b0aef16b4c673e1cb2ae0fd08de3f65b7aa5512fd74253efe30f16b0dbac11'
            '03296946286788d96572b7a17381191ee86d30736f652f678190b0c305ab70b10c65b0d732e213745bb24e44c3981c7dcafb1e83d0c519deef440fa25a36e00f')

prepare() {
    cd "gtk+-${pkgver}"

    # Apply Ubuntu Patches
    echo > ../debian/patches/series

    # https://bugs.launchpad.net/indicator-messages/+bug/1088162
    # Dependency check: grep -R ubuntu-private.h * | cut -d/ -f1
    echo 'ubuntu_gtk_custom_menu_items.patch' >> ../debian/patches/series
    # Do not allow offscreen widgets to grab the cursor
    echo '016_no_offscreen_widgets_grabbing.patch' >> ../debian/patches/series
    echo '017_no_offscreen_device_grabbing.patch' >> ../debian/patches/series
    # Allow printing to printers advertised using Avahi/Bonjour when CUPS 1.6
    echo 'print-dialog-show-options-of-remote-dnssd-printers.patch' >> ../debian/patches/series
    # Unity-specific
    #echo '0001-Add-style-classes-to-the-title-buttons.patch' >> ../debian/patches/series
    echo 'message-dialog-restore-traditional-look-on-unity.patch' >> ../debian/patches/series
    # Other
    echo 'bzg_gtkcellrenderer_grabbing_modifier.patch' >> ../debian/patches/series
    for i in $(grep -v '#' ../debian/patches/series); do
        msg "Applying ${i} ..."
        patch -p1 -i "../debian/patches/${i}"
    done
}

build() {
    cd "gtk+-${pkgver}"

    autoreconf -vfi

    #CXX=/bin/false ./configure \
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "gtk+-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "$pkgdir/usr/bin/gtk-update-icon-cache"
}
