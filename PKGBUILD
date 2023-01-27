# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: M0Rf30
# Contributor: unifiedlinux
# Contributor: CReimer

pkgname=cinnamon-git
pkgver=5.6.7.r2.g4af7ab39c
pkgrel=1
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience"
arch=(x86_64)
url="https://github.com/linuxmint/cinnamon"
license=(GPL2)
depends=(accountsservice caribou cinnamon-control-center cinnamon-menus cinnamon-screensaver
         cinnamon-session cinnamon-settings-daemon cjs gnome-backgrounds gsound
         gnome-themes-extra gstreamer libcroco libgnomekbd libkeybinder3 librsvg muffin
         network-manager-applet nemo polkit-gnome python-cairo python-dbus
         python-gobject python-pam python-pexpect python-pillow python-pyinotify
         python-pytz python-tinycss2 python-xapp python-requests timezonemap xapps)
optdepends=('blueman: Bluetooth support'
            'cinnamon-translations: i18n'
            'gnome-panel: fallback mode'
            'metacity: fallback mode'
            'system-config-printer: printer settings'
            'wget: cover download support in audio applet')
makedepends=(git meson samurai gobject-introspection intltool)
provides=(cinnamon)
conflicts=(cinnamon)
options=('!emptydirs')
source=("git+https://github.com/linuxmint/cinnamon.git"
        "set_wheel.diff"
        "default-theme.patch")
b2sums=('SKIP'
        '3becf1f40068fc629109e6e7d464c3c484296afacc9ab6328b2ccbb3c9735bcbfa9550f9f73b430ede178ae668e37c660ce322b5b4d1873526de3d3d41185160'
        '86c3a29acd132ca321f08fd81dd5a45707accdc035b2aeec95bf358b29072ff1eedb77b2566cf48d7253d1d791599f0f44938c4600761d711cb18b59019f1c62')

pkgver() {
  cd cinnamon
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cinnamon

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

  [[ -d build ]] || mkdir build
}

build() {
  cd cinnamon/build

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
  cd cinnamon/build
  DESTDIR="${pkgdir}" samu install
}
