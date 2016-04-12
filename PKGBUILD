# Maintainer: Peter Weber <peter.weber@ttyhoney.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.20.0
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, with background transparency and dark theme"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf libnautilus-extension)
makedepends=(intltool itstool docbook-xsl desktop-file-utils
             libnautilus-extension appdata-tools gnome-shell gconf vala yelp-tools)
optdepends=('gconf: settings migration when upgrading from older version')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome')
install=gnome-terminal-transparency.install
source=("https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
        'gnome-terminal-transparency.patch'
        'org.gnome.Terminal.gschema.override'
)
sha256sums=('2fe7f6bd3ca4e93ce156f83e673b9e8c3f0155b6bc603e109edc942718eb4150'
            'b769ef400a5756959dcfd014efa268eba82dd184373a41d2fabe5d38d8fc0189'
            '0465a249cf7e1ff489a345d288557e520cfccf22ff0f880a61e46d02f98f881e'
)

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i '../gnome-terminal-transparency.patch'

	autoreconf -f -i
}


build() {
  cd $_pkgname-$pkgver
  # Build with prerelease, no tarball yet
  sed -i -e 's/0.44.0/0.43.92/' configure
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname --disable-static --with-nautilus-extension
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 '../org.gnome.Terminal.gschema.override' \
                 "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.Terminal.gschema.override"
}
