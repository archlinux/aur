# Maintainer: Boian Bonev <bbonev@ipacct.com>
# Contributor: Andy Alt <arch_stanton5995 at proton dot me>
# Contributor: Evgeny Grablyk <evgeny.grablyk@gmail.com>

pkgname=vfu
pkgver=5.05
pkgrel=1
pkgdesc="Versatile text-based file-manager"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://cade.noxrun.com/projects/vfu"
license=('GPL')
depends=('ncurses' 'pcre2')
optdepends=('perl: for the rx_* archiving utilities'
            'rpmextract: for rx_rpm'
            'unrar: for rx_rar'
            'unzip: for rx_zip')
source=("http://cade.noxrun.com/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz" "vfu-libexec_2_lib.patch")
sha256sums=('3c2dc49f5e51d4e907b439e7ef3586e93854396e9fc70b5d08510bd6ddb373c1'
            '05226413626342c610df02640abaebce5becc9d69b2297498a57e22abfd85b9c')

prepare() {
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/vfu-libexec_2_lib.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make V=1
  ./build.docs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 vfu/vfu -t "$pkgdir/usr/bin"
  gzip < vfu.1 > vfu.1.gz
  install -Dm644 vfu.1.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 vfu.conf -t "$pkgdir/etc"
  install -Dm755 rx/rx_* -t "$pkgdir/usr/lib/vfu/"
}

