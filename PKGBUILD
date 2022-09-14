# Contributor: Jan Fader <jan.fader@web.de>
pkgname=mp3rename
pkgver=0.6
pkgrel=13
pkgdesc="Rename mp3 files based on id3tags"
arch=('i686' 'x86_64')
license=('GPL')
#url="http://packages.debian.org/unstable/sound/mp3rename"
url="https://salsa.debian.org/debian/mp3rename"

depends=('glibc')

provides=("$pkgname")
conflicts=("$pkgname")

source=(
  "http://ftp.debian.org/debian/pool/main/m/mp3rename/${pkgname}_${pkgver}.orig.tar.gz"
  "http://ftp.debian.org/debian/pool/main/m/mp3rename/${pkgname}_${pkgver}-${pkgrel}.debian.tar.xz"
  "mp3rename-jf-long-options.patch"
)

sha256sums=(
  '3bd0c73d542901a012ace7a16957ff79a8b297ed98a412004320a22dcfdc8c5e'
  '388dcab2f4deb34a0a857c2fe7c10d2e34b00ac8af56e8bdc004ff8e7da22966'
  '2cf135666f30e315e1023302229a3b9df4db31a78339cb70c00b5efd45a32ee5'
)

build() {
  cd "$srcdir/$pkgname-${pkgver}.orig"

  # apply debian patches
  xargs -a "$srcdir/debian/patches/series" -d "\n" -i -P 1 -- patch -p 1 -i "$srcdir/debian/patches/{}"

  # apply long-options patch
  patch -p 1 -i "$srcdir/mp3rename-jf-long-options.patch"

  # build binary
  make || return 1

  # compress man page
  gzip "$srcdir/debian/${pkgname}.1"
}

package() {
  cd "$srcdir/$pkgname-${pkgver}.orig"

  # install binary
  PREFIX="$pkgdir" make install

  # install man page
  install -D -m644 "$srcdir/debian/${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
}
