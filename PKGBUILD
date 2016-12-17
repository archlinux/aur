# Maintainer: Akira Wakana <jalen.cn@gmail.com>

pkgname=file-roller-ja
pkgver=3.22.2
pkgrel=3
provides=('file-roller')
conflicts=('file-roller')
pkgdesc="the file-roller with an additional patch to use unzip-iconv for unzip archive file cp932 charset."
_pkgname=file-roller
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'dconf' 'libarchive' 'file' 'json-glib' 'libnotify' 'zip' 'unzip-iconv')
makedepends=('intltool' 'pkg-config' 'libnautilus-extension' 'itstool' 'docbook-xsl')
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support'
            'cdrkit: ISO image support')
groups=('gnome-extra')
options=('!emptydirs')
url="http://www.gnome.org"
source=("http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
        'fc-init.patch'
        'Z99-zip-cp932.sh')
sha256sums=('27158cdcc366f82100312b1e0a02ad1f3aa7a6c32d4eba68fc5a2a8829685df9'
            '2b8c0be032bab317cf8b95d5b6970e450acb18a246d5fdedf272f5e7941a1263'
            '47d0e369be6f8df7fbdc56b794eccccf877fe3d8a6dfcc4fccb00649f77b54bc')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch src/fr-init.c < ../../fc-init.patch
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
   --libexecdir=/usr/lib/$_pkgname --disable-static --disable-schemas-compile

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../../Z99-zip-cp932.sh "${pkgdir}/etc/profile.d/Z99-zip-cp932.sh"
}
