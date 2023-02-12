# Maintainer: Andy Alt <arch_stanton5995 at proton dot me>
# Co-maintainer: Boian Bonev <bbonev@ipacct.com>
# Contributor: Evgeny Grablyk <evgeny.grablyk@gmail.com>

pkgname=vfu
pkgver=5.02
pkgrel=2
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
sha256sums=('cd10f00a86ba71150203582d50783e30ab31b76adfe4b7fb88d1ae88325f0d9e'
            '9c2f50b78e9fc4b9fbd7c457bf8c14976fe7c245fd0472512d609ef3b2d68512')

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

