# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: M0Rf30
# Contributor: unifiedlinux
# Contributor: CReimer

pkgname=cinnamon-git
pkgver=4.4.8.r70.g14e5ccee8
pkgrel=1
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL2')
depends=('accountsservice' 'caribou' 'cinnamon-control-center' 'cinnamon-menus' 'cinnamon-screensaver'
         'cinnamon-session' 'cinnamon-settings-daemon' 'cjs' 'gnome-backgrounds'
         'gnome-themes-extra' 'gstreamer' 'libcroco' 'libgnomekbd' 'libkeybinder3' 'librsvg' 'muffin'
         'network-manager-applet' 'nemo' 'polkit-gnome' 'python-cairo' 'python-dbus'
         'python-gobject' 'python-pam' 'python-pexpect' 'python-pillow' 'python-pyinotify'
         'python-pytz' 'python-tinycss2' 'python-xapp' 'timezonemap' 'xapps')
optdepends=('blueberry: Bluetooth support'
            'cinnamon-translations: i18n'
            'gnome-panel: fallback mode'
            'metacity: fallback mode'
            'system-config-printer: printer settings')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'intltool' 'gtk-doc' 'gobject-introspection')
options=('!emptydirs')
source=("git+${url}.git"
        "0001-cinnamon-settings-don-t-rely-on-the-presence-of-cinn.patch"
        "set_wheel.diff"
        "default-theme.patch")
sha256sums=('SKIP'
            'edb5c1cf43913da086aa11f303b0919bbea232d140afa33ceac52fe367d15fcf'
            '7517d651d440361947f9539fe8f42548d5eb43a09c28c9a11f51cfdfdefd042f'
            '566585873f38a79ec248b916645a2e081abec3c6d4df2c34339cde1f35375cc5')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}

    # Check for the cc-panel module path, not for the irrelevant binary
    # https://github.com/linuxmint/Cinnamon/pull/7382
    patch --no-backup-if-mismatch -p1 -i ../0001-cinnamon-settings-don-t-rely-on-the-presence-of-cinn.patch

    # Use wheel group instread of sudo (taken from Fedora)
    patch -Np1 -i ../set_wheel.diff

    # Set default theme to 'cinnamon'
    patch -Np1 -i ../default-theme.patch

    # Replace MintInstall with GNOME Software
    sed -i 's/mintinstall.desktop/org.gnome.Software.desktop/' data/org.cinnamon.gschema.xml.in

    # Add polkit agent to required components
    sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' \
        files/cinnamon*.session.in

    # https://github.com/linuxmint/Cinnamon/issues/3575#issuecomment-374887122
    # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
    sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
        files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}"/${pkgname%-git}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --libexecdir=/usr/lib/cinnamon \
                --localstatedir=/var \
                --disable-static \
                --disable-gtk-doc \
                --disable-schemas-compile \
                --enable-compile-warnings=yes

    # https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}"/${pkgname%-git}

    make DESTDIR="${pkgdir}" install
}
