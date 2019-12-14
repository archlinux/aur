# Based on the file created for Arch Linux by:
# Eli Schwartz <eschwartz@archlinux.org>
# Maintainer: Andrey Vetrov <vetrov at mail dot ru>

pkgname=cinnamon-slim
pkgver=4.4.5
pkgrel=1
pkgdesc="Innovative Linux desktop. Slim version."
arch=('x86_64')
url="https://github.com/linuxmint/Cinnamon"
license=('GPL2')
provides=("cinnamon=$pkgver")
conflicts=('cinnamon')
replaces=('cinnamon')

depends=('accountsservice' 'caribou' 'cinnamon-control-center' 'cinnamon-menus' 'cinnamon-screensaver'
         'cinnamon-session' 'cinnamon-settings-daemon' 'cjs' 'gnome-backgrounds'
         'gnome-themes-extra' 'gstreamer' 'libgnomekbd' 'libkeybinder3' 'librsvg' 'muffin'
         'nemo' 'polkit-gnome' 'python-cairo' 'python-dbus' 'python-gobject' 'python-pam'
         'python-pexpect' 'python-pillow' 'python-pyinotify' 'python-pytz' 'python-tinycss'
         'python-xapp' 'timezonemap' 'xapps')
optdepends=('blueberry: Bluetooth support'
            'cinnamon-translations: i18n'
            'gnome-panel: fallback mode'
            'metacity: fallback mode'
            'system-config-printer: printer settings')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
options=('!emptydirs')
source=("${pkgname%-*}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "0001-cinnamon-settings-don-t-rely-on-the-presence-of-cinn.patch"
        "set_wheel.patch"
        "default-theme.patch")

sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "${srcdir}"/cinnamon-${pkgver}

    # Check for the cc-panel module path, not for the irrelevant binary
    # https://github.com/linuxmint/cinnamon/pull/7382
    patch --no-backup-if-mismatch -p1 -i ../0001-cinnamon-settings-don-t-rely-on-the-presence-of-cinn.patch

    # Use wheel group instread of sudo (taken from Fedora)
    patch -Np1 -i ../set_wheel.patch

    # Set default theme to 'cinnamon'
    patch -Np1 -i ../default-theme.patch

    # Replace MintInstall with GNOME Software
    sed -i 's/mintinstall.desktop/org.gnome.Software.desktop/' data/org.cinnamon.gschema.xml.in

    # Add polkit agent to required components
    sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' \
        files/cinnamon*.session.in

    # https://github.com/linuxmint/cinnamon/issues/3575#issuecomment-374887122
    # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
    sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
        files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}"/cinnamon-${pkgver}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --libexecdir=/usr/lib/cinnamon \
                --localstatedir=/var \
                --disable-static \
                --disable-gtk-doc \
                --disable-schemas-compile \
                --disable-networkmanager \
                --enable-compile-warnings=yes

    # https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}"/cinnamon-${pkgver}

    make DESTDIR="${pkgdir}" install
}
