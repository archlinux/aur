# Maintainer: Garlicbreadwolfs
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: M0Rf30
# Contributor: unifiedlinux
# Contributor: CReimer

pkgname=cinnamon-disable-nm
_origpkgname=cinnamon
pkgver=6.0.0
pkgrel=1
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience (without NetworkManager version)"
arch=(x86_64)
url="https://github.com/linuxmint/cinnamon"
license=(GPL2)
depends=(accountsservice caribou cinnamon-control-center cinnamon-menus cinnamon-screensaver
         cinnamon-session cinnamon-settings-daemon cjs gnome-backgrounds gsound
         gstreamer libcroco libgnomekbd libkeybinder3 librsvg muffin
         nemo polkit-gnome python-cairo python-dbus
         python-gobject python-pam python-pexpect python-pillow python-pyinotify
         python-pytz python-tinycss2 python-xapp python-requests timezonemap xapps xdg-desktop-portal-xapp)
optdepends=('blueman: Bluetooth support'
            'cinnamon-translations: i18n'
            'gnome-panel: fallback mode'
            'metacity: fallback mode'
            'system-config-printer: printer settings'
            'wget: cover download support in audio applet'
            'gnome-themes-extra: GTK2 themes'
            'gnome-terminal: X terminal emulator'
            'touchegg: touch gestures'
            'switcheroo-control: GPU offloading')
makedepends=(meson samurai gobject-introspection intltool)
options=('!emptydirs')
conflicts=('cinnamon')
provides=('cinnamon')
source=(${url}/archive/${pkgver}/${_origpkgname}-${pkgver}.tar.gz
        set_wheel.diff
        default-theme.patch)
sha512sums=('1c319a8e2623f0f3cb412b667645db796cd22b85873d6cff7ad75f4c41138c157539d4cc78565c1e17f45b7d9970c0e0992729a53259fb09236e1dfcfd9ca396'
            'fd7e117054996ed1c3dfd0f968c2bf98ca4fcee9a100221f8839a232147745ec0140e1f68eeffba58a3c44f66f26e05d433648a7a28858ec669524f7266ba04c'
            'ee7dedd59ea370cf81d75def49060f9a29b22e7b025ca7d5db87a0102d50f138c79aa562b0d36a748c4b1c59a37f600ba1f60ff6caf303cf5b6fc4d110d051b4')
b2sums=('d1f107f6c8ef4fac208b319d823af6aa90b9840a45bd07ca8a8ccad749206d37e94befd9e93a861d19778dca5b190b72bb1df273947f68b560b40207265700a7'
        '3becf1f40068fc629109e6e7d464c3c484296afacc9ab6328b2ccbb3c9735bcbfa9550f9f73b430ede178ae668e37c660ce322b5b4d1873526de3d3d41185160'
        '86c3a29acd132ca321f08fd81dd5a45707accdc035b2aeec95bf358b29072ff1eedb77b2566cf48d7253d1d791599f0f44938c4600761d711cb18b59019f1c62')

prepare() {
  cd ${_origpkgname}-${pkgver}

  # Use wheel group instread of sudo (taken from Fedora)
  patch -p1 < ../set_wheel.diff

  # Set default theme to 'cinnamon'
  patch -p1 < ../default-theme.patch

  # Replace MintInstall with GNOME Software
  sed -i 's/mintinstall.desktop/org.gnome.Software.desktop/' data/org.cinnamon.gschema.xml

  # Add polkit agent to required components
  sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' \
      cinnamon*.session.in

  # https://github.com/linuxmint/cinnamon/issues/3575#issuecomment-374887122
  # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
  sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
      files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py
}

build() {
  arch-meson --libexecdir=lib/cinnamon ${_origpkgname}-${pkgver} build -Ddisable_networkmanager=true
  samu -C build
}

package() {
  DESTDIR="${pkgdir}" samu -C build install
}
