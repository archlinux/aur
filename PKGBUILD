# Maintainer: Miquel Lionel <lionel at les-miquelots dot net>
# https://aur.archlinux.org/packages/honk/

pkgname=honk
pkgver=1.3.1
pkgrel=13
epoch=0
pkgdesc="ActivityPub compatible server with web frontend."
arch=("x86_64")
url="https://humungus.tedunangst.com/r/honk"
license=("custom:ISC")
makedepends=("go>=1.16" "sqlite")
depends=("go>=1.16" "sqlite")
optdepends=("nginx: for TLS and reverse proxying.")
changelog="$pkgname.changelog"
provides=("${pkgname}")
conflicts=("${pkgname}" 'honk-hg')
source=("$pkgname-$pkgver.tar::https://humungus.tedunangst.com/r/honk/d/$pkgname-$pkgver.tgz")
sha512sums=("4af94320ea53320b0bc498a5e9d0ec66c59a0d9e0cb780be0bebab059e5a290feffe1bb524af169f6e381cc71c85ff0d84f971a6e890d3d05c65db60cce0ad26")
options=(strip docs zipman)
install="$pkgname.install"

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
   _PKG_HONKDIR="$pkgdir/usr/share/$pkgname"
   DOCS="$pkgname-$pkgver/docs"
   _MANDIR="$pkgdir/usr/share/man/man"

   install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin/"
   install -Dm644 "$pkgname-$pkgver"/views/* -t "$_PKG_HONKDIR/views/"
   install -Dm644 $DOCS/* -t "$_PKG_HONKDIR/docs/"
   
   for i in {1,3,5,8}; do
       install -Dm644 $DOCS/honk.$i -t ${_MANDIR}$i/
   done

   install -Dm644 $DOCS/activitypub.7 ${_MANDIR}7/honk_activitypub.7
   install -Dm644 $DOCS/hfcs.1 ${_MANDIR}1/honk_hfcs.1
   install -Dm644 $DOCS/intro.1 ${_MANDIR}1/honk_intro.1
   install -Dm644 $DOCS/vim.3 ${_MANDIR}3/honk_vim.3

   install -Dm644 "$pkgname-$pkgver"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
   install -Dm644 ../honk.service -t "$pkgdir/usr/lib/systemd/system/"
}
