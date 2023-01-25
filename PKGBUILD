# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: M0Rf30
# Contributor: unifiedlinux
# Contributor: CReimer

pkgname=cinnamon5-git
_pkgname=cinnamon-git
pkgver=5.6.7.r2.g4af7ab39c
pkgrel=1
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience"
arch=('x86_64')
url="https://github.com/linuxmint/${_pkgname%-git}"
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
provides=("${_pkgname%-git}=${pkgver}")
conflicts=("${_pkgname%-git}")
makedepends=('git' 'intltool' 'gtk-doc' 'gobject-introspection' 'samurai')
options=('!emptydirs')
source=("git+${url}.git"
        "set_wheel.diff"
        "default-theme.patch")
sha256sums=('SKIP'
            '7517d651d440361947f9539fe8f42548d5eb43a09c28c9a11f51cfdfdefd042f'
            '9ebbd38b400331c97754804b029342eb5aafd62c4e44a8e397e2f2f028194466')

pkgver() {
    cd "${srcdir}"/${_pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${_pkgname%-git}

    # Use wheel group instread of sudo (taken from Fedora)
    #patch -Np1 -i ../set_wheel.diff

    # Set default theme to 'cinnamon'
    patch -Np1 -i ../default-theme.patch

    # Replace MintInstall with GNOME Software
    sed -i 's/mintinstall.desktop/org.gnome.Software.desktop/' data/org.cinnamon.gschema.xml

    # Add polkit agent to required components
    sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' \
        cinnamon*.session.in

    # https://github.com/linuxmint/Cinnamon/issues/3575#issuecomment-374887122
    # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
    sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
        files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py
}

build() {
    cd "${srcdir}"/${_pkgname%-git}
    mkdir -p builddir
    cd builddir
    
  # fix -mfpu= flags that break a build e.g. for neon on armv7 due to
  # basically makepkg.conf being "bad' with default CFLAGS having
  # -mfpu=vfpv3-d16
  #export CFLAGS=`echo -n $CFLAGS | sed 's/-mfpu=vfpv3-d16/-mfpu=neon-vfpv4/g'`
  #export CFLAGS="$CFLAGS -fvisibility=hidden"
  #export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"
    
  meson --prefix=/usr \
        --libexecdir=lib/cinnamon \
        --buildtype=plain \
        ..

  samu
}

package() {
    cd "${srcdir}"/${_pkgname%-git}/builddir

    DESTDIR="${pkgdir}" samu install
}
