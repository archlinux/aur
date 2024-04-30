# Maintainer: sommerfeld <sommerfeld@sommerfeld.dev>

_pkgname=sentrum
pkgname=$_pkgname-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Daemon that monitors watch-only bitcoin wallets"
arch=('x86_64' 'aarch64')
url="https://github.com/sommerfelddev/$_pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz"
    "$url/releases/download/v$pkgver/$_pkgname-v$pkgver-manifest.txt"{,.asc})
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-aarch64.tar.gz"
    "$url/releases/download/v$pkgver/$_pkgname-v$pkgver-manifest.txt"{,.asc})
sha256sums_x86_64=('c662d9b4dc8170aaab80422a34bc167d28c5ab437be6812ae2d74f1ab11400c5'
                   'afd91b0fac9b14d9418721b49d6e484e61edf3eecf40a7cdfa481f37c4a485ba'
                   'SKIP')
sha256sums_aarch64=('b9e572b5d7e75312a83a59cf72b1e5dc8699c1c9b400feeea2013d36656f0e4d'
                    'afd91b0fac9b14d9418721b49d6e484e61edf3eecf40a7cdfa481f37c4a485ba'
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
