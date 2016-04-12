# Maintainer: Peter Weber <peter.weber@ttyhoney.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.20.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, with background transparency and dark theme"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf libnautilus-extension)
makedepends=(intltool itstool docbook-xsl desktop-file-utils
             libnautilus-extension appstream-glib gnome-shell gconf vala yelp-tools)
optdepends=('gconf: settings migration when upgrading from older version')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome')
install=gnome-terminal-transparency.install
changelog=$pkgname.changelog
source=("https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
        'gnome-terminal-transparency.patch'
        'org.gnome.Terminal.gschema.override'
)
sha256sums=('98b7f48b13b37f05c92aa6b09006f608985efaf5440a1d76c28eda5f46b50894'
            '12f4c7d4ea57abc7730085fe2675cb0c5c1cae81dda41a78444de9dac9aa517e'
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
