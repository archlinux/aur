# Maintainer: Miquel Lionel <lionel at les-miquelots dot net>
# https://aur.archlinux.org/packages/honk/

pkgname=honk
pkgver=1.2.0
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
sha512sums=("895cd73e156e6ed5c36a6c9991809cd4637243fbc4a88c2fafef970eef61fe8d0ec8371b63020e99fdfcf60569cca1055d1e2635875343a3ebd987287b306f3e")
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
