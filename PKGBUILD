# $Id: PKGBUILD 319146 2018-05-07 16:19:07Z eschwartz $
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: M0Rf30
# Contributor: unifiedlinux
# Contributor: CReimer

pkgname=cinnamon-metacity-1
pkgver=3.8.2
pkgrel=1
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience"
arch=('x86_64')
url="https://github.com/linuxmint/Cinnamon"
license=('GPL2')
depends=('accountsservice' 'caribou' 'cinnamon-control-center' 'cinnamon-menus' 'cinnamon-screensaver'
         'cinnamon-session' 'cinnamon-settings-daemon' 'cjs' 'clutter-gtk' 'gnome-backgrounds'
         'gnome-themes-standard' 'gstreamer' 'libgnomekbd' 'libkeybinder3' 'librsvg' 'muffin36'
         'network-manager-applet' 'nemo' 'polkit-gnome' 'python-cairo' 'python-dbus'
         'python-gobject' 'python-pam' 'python-pexpect' 'python-pillow' 'python-pyinotify' 'xapps')
optdepends=('blueberry: Bluetooth support'
            'cinnamon-translations: i18n'
            'gnome-panel: fallback mode'
            'metacity: fallback mode'
            'system-config-printer: printer settings')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
options=('!emptydirs')
conflicts=('cinnamon')
provides=('cinnamon')
source=("cinnamon-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "0001-cinanmon-settings-don-t-rely-on-the-presence-of-cinn.patch::${url}/pull/7382.patch"
        "set_wheel.patch"
        "default-theme.patch"
	"cs_themes.patch")
sha512sums=('beaa93a2881acfb5e9c738d49f150fd7ae7cba8827a607a394607fe2893f47a5e94cd6b2835d056f31986621f4d1fedc3d8d8f3ce75c8fd094782d6fb4a2a419'
            'a0a9f4d25053fe96f9b1495394adb829252367099931d3f0e9bdfd2371093b4e86ff13fc945301b3a59691bbb7ee14da89e68c4ef3d8e7a1b5ec6bdedccb9137'
            'fd7e117054996ed1c3dfd0f968c2bf98ca4fcee9a100221f8839a232147745ec0140e1f68eeffba58a3c44f66f26e05d433648a7a28858ec669524f7266ba04c'
            '3c460141b277df61c4546cc311fa5ecc7e7ea19a7d39a92d1d0214c37a91b4e163bc91823df7098bd2cf6fb430361cdb9839ab96abe53fe82f2a735e187de563'
            '6f96c1d5786d33c47823da8ad81eb8413e5ccb958238e9537d20cb192e73139717db27ac76e269e1584de6d54485f20f527f3f3b7c2e530d582dd1c100891a33')

prepare() {
    cd "${srcdir}"/Cinnamon-${pkgver}

    # Check for the cc-panel module path, not for the irrelevant binary
    patch -p1 -i ../0001-cinanmon-settings-don-t-rely-on-the-presence-of-cinn.patch

    # Use wheel group instread of sudo (taken from Fedora)
    patch -Np1 -i ../set_wheel.patch

    # Set default theme to 'cinnamon'
    patch -Np1 -i ../default-theme.patch

    patch -p1 -i ../cs_themes.patch

    # Replace MintInstall with GNOME Software
    sed -i 's/mintinstall.desktop/org.gnome.Software.desktop/' data/org.cinnamon.gschema.xml.in

    # Add polkit agent to required components
    sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' \
        files/usr/share/cinnamon-session/sessions/cinnamon*.session

    # https://github.com/linuxmint/Cinnamon/issues/3575#issuecomment-374887122
    # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
    sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
        files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}"/Cinnamon-${pkgver}

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
    cd "${srcdir}"/Cinnamon-${pkgver}

    make DESTDIR="${pkgdir}" install
}
