# Maintainer: Boian Bonev <bbonev@ipacct.com>
# Contributor: Andy Alt <arch_stanton5995 at proton dot me>
# Contributor: Evgeny Grablyk <evgeny.grablyk@gmail.com>

pkgname=vfu
pkgver=5.09
pkgrel=1
pkgdesc="Versatile text-based file-manager"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://cade.noxrun.com/projects/vfu"
license=('GPL')
depends=('ncurses' 'pcre2')
makedepends=('pkgconf')
optdepends=('perl: for the rx_* archiving utilities'
            'rpmextract: for rx_rpm'
            'unrar: for rx_rar'
            'unzip: for rx_zip')
source=("http://cade.noxrun.com/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz" "vfu-libexec_2_lib.patch")
sha256sums=('05f5cf694bc43d1b769453a7756338a2f0e1f47cfed59581f0bd08b24d313b99'
            '05226413626342c610df02640abaebce5becc9d69b2297498a57e22abfd85b9c')

prepare() {
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/vfu-libexec_2_lib.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make V=1 YASCREEN_LD=
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

