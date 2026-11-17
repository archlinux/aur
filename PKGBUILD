# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=zero-breach-toolkit-bin
_pkgname=zero-breach-toolkit
pkgver=3.0.2
pkgrel=1
pkgdesc='Offline checks for known mercenary spyware and other signs of compromise (upstream program build)'
arch=('x86_64')
url='https://github.com/interplains/Zero-Breach-Toolkit'
license=('Apache-2.0')
depends=('glibc' 'zlib')
optdepends=('android-tools: adb access for Android acquisition')
provides=("$_pkgname")
conflicts=("$_pkgname")
# PyInstaller one-file program: stripping corrupts its embedded archive.
options=('!strip' '!debug')
_rel="$url/releases/download/v$pkgver"
source=("$_pkgname-$pkgver-linux-x64.tar.gz::$_rel/$_pkgname-linux-x64.tar.gz"
        "SHA256SUMS-programs-$pkgver.txt::$_rel/SHA256SUMS-programs.txt"
        "SHA256SUMS-programs-$pkgver.txt.asc::$_rel/SHA256SUMS-programs.txt.asc")
sha256sums=('31dc9cf01dd0334c27fac662fb6710ed48c5071e2fa66071bdc6852dd44047ab'
            '825b3b6099f1670995e33ea9d3aa49d331a3a73f67b9ac51a459b14f0190aac3'
            '7e2811f1ba48ac0ee473ea15c0f64f195f01ca82822d9708bf8e3f9cd3f8746d')
# Archive Genocide <archive@archivegenocide.com>; key also in keys/pgp/
validpgpkeys=('C24EC92B12D6670A2516065F9B4D575499AFA53C')

prepare() {
    # makepkg has checked the signature on SHA256SUMS-programs; the tarball must match it.
    local _sum
    _sum=$(awk -v f="$_pkgname-linux-x64.tar.gz" '$2 == f { print $1 }' "SHA256SUMS-programs-$pkgver.txt")
    if [[ -z $_sum ]] || ! echo "$_sum  $_pkgname-$pkgver-linux-x64.tar.gz" | sha256sum -c --quiet -; then
        error 'tarball does not match the signed SHA256SUMS-programs.txt'
        return 1
    fi
}

package() {
    install -Dm755 "$_pkgname-linux-x64/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
