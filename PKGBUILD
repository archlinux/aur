# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: ybfsb <ybfsb2000@sina.com>

pkgname=gnome-terminal-kali
_pkgname=gnome-terminal
pkgver=3.30.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with Kali Linux patches (background transparent, chunked resize & ...)"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appdata-tools
             gnome-shell vala yelp-tools)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!emptydirs)
groups=(gnome)
source=("https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
		"http://http.kali.org/pool/main/g/$_pkgname}/${_pkgname}_${pkgver}-1kali1.debian.tar.xz")
sha256sums=('6b1fc2720e3bfc592645d41e38d0d3a0f2bdf5ef7bce490b2d5c8ba39f395e38'
            'b8942366d1d00b8ff42535c418b69ee9e525d958affdd844293123651bace60b')

prepare () {
	cd "${_pkgname}-${pkgver}"
	while read -a PATCHES
	do
		patch -p1 -i ../debian/patches/${PATCHES[@]}
	done < "../debian/patches/series"
	autoreconf -f -i 
}

build() {
	cd "${_pkgname}-${pkgver}"
  LDFLAGS+=" -pthread"  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --with-nautilus-extension
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
