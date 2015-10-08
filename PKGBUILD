# Maintainer: Akira Wakana <jalen.cn@gmail.com>

pkgname=file-roller-ja
pkgver=3.16.3
pkgrel=1
provides=('file-roller')
conflicts=('file-roller')
pkgdesc="the file-roller with an additional patch to use unzip-iconv for unzip archive file cp932 charset."
_pkgname=file-roller
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'dconf' 'libarchive' 'file' 'json-glib' 'libnotify' 'zip' 'unzip-iconv')
makedepends=('intltool' 'pkg-config' 'libnautilus-extension' 'itstool' 'docbook-xsl')
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support'
            'cdrkit: ISO image support')
groups=('gnome-extra')
options=('!emptydirs')
install=file-roller.install
url="http://www.gnome.org"
source=("http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
        'fc-init.patch'
        'Z99-zip-cp932.sh')
sha256sums=('2b3a1111caba26e67b96559a3118a700dbfb6a4c6ad7ebd3e509df227995411c'
            '27df085f1d6c8fad4bceb503267e767e7c43ad920f3cf9e91ee03e7f751addaf'
            '1ad7e934405a9c407a35d0e185503fff8f5f869156cc5598db1035c0900a89f0')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch src/fr-init.c < ../../fc-init.patch
}

build() {
  cd $_pkgname-$pkgver
  
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/file-roller \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../../Z99-zip-cp932.sh "${pkgdir}/etc/profile.d/Z99-zip-cp932.sh"
}
