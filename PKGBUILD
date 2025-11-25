# Maintainer: Miquel Lionel <lionel at les-miquelots dot net>
# https://aur.archlinux.org/packages/honk/

pkgname=honk
pkgver=1.5.2
pkgrel=1
epoch=0
pkgdesc="ActivityPub compatible server with web frontend."
arch=("x86_64")
url="https://humungus.tedunangst.com/r/honk"
license=("custom:ISC")
makedepends=("go>=1.22" "sqlite>=3.34.0")
depends=("go>=1.22" "sqlite>=3.34.0")
optdepends=("nginx: for TLS and reverse proxying.")
changelog="$pkgname.changelog"
provides=("${pkgname}")
conflicts=("${pkgname}" 'honk-hg')
source=("$pkgname-$pkgver.tar::https://humungus.tedunangst.com/r/honk/d/$pkgname-$pkgver.tgz")
sha512sums=("76fcfd6cf7ff1c43e6aa769d532bb9f25729ab3525e4e7acc28d5c0a5779a9166149d41641eae8d9af359f7c888ec6b592d88343d8fbc4d5309ddc8d4be301b5")
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
