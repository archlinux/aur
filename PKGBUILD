# Maintainer: ybfsb <ybfsb2000@sina.com>
pkgname=gnome-terminal-kali
_pkgname=gnome-terminal
pkgver=3.20.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with Kali Linux patches (background transparent, chunked resize & ...)"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appdata-tools
             gnome-shell gconf vala yelp-tools)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=(!emptydirs)
groups=(gnome)
source=("https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
		"http://http.kali.org/pool/main/g/$_pkgname/${_pkgname}_${pkgver}-${pkgrel}kali1.debian.tar.xz"
)

sha256sums=('f5383060730f1de70af35e917f82d5b6a14d963ad9cfd6a0e705f90011645a23'
	'524c7734aa0ec5be11fe575704e6de8699b82b67ef9dfae2a5de81cad37d23b7'
)

prepare () {
	cd "${_pkgname}-${pkgver}"
	while read -a PATCHES
	do
		patch -p1 -i ../debian/patches/${PATCHES[@]}
	done < "../debian/patches/series"
	autoreconf -f -i 
}

build() {
  cd $_pkgname-$pkgver
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
}
