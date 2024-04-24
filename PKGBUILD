# Maintainer: sommerfeld <sommerfeld@sommerfeld.dev>

_pkgname=sentrum
pkgname=$_pkgname-bin
pkgver=0.1.7
pkgrel=2
pkgdesc="Daemon that monitors watch-only bitcoin wallets"
arch=('x86_64')
url="https://github.com/sommerfelddev/$_pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz"
    "$url/releases/download/v$pkgver/$_pkgname-v$pkgver-manifest.txt"{,.asc})
sha256sums=('4013871ff1ce90cb654981a7e5752a4ae70c4a91b6d19ccf35e194a13e0766c9'
            '10c31a229224c7ac9b168ecc1e962a10ac6d84d22d06c65c9c0a5abd32bb6e2a'
            'SKIP')
validpgpkeys=('B79DF5F37D7F9B0F390238D53298945F717C85F8')
backup=("etc/$_pkgname/$_pkgname.toml")
provides=('sentrum')
confllicts=('sentrum')

prepare() {
    sha256sum --check --ignore-missing "$_pkgname-v$pkgver-manifest.txt"
}

package() {
    cd "$_pkgname-v$pkgver-linux-x86_64"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"

    install -Dm644 "contrib/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "contrib/systemd/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "contrib/systemd/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "$_pkgname.sample.toml" "$pkgdir/etc/$_pkgname/$_pkgname.toml"

    install -Dm644 "man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
