# Maintainer: Luke Arms <luke@arms.to>

pkgname=db2-odbc-cli
# Mentioned in clidriver/include/sql.h
pkgver=12.1.0.0
pkgrel=2
pkgdesc='IBM Data Server Driver for ODBC and CLI'
arch=('x86_64')
url='https://www.ibm.com/docs/en/db2/12.1?topic=installing-data-server-drivers-clients'
license=('custom:IBM IPLA')
# Derived from output of:
#
#     readelf -d bin/* {lib,security64}/**/*.so* |
#         awk '/Shared library:/ { gsub(/\[|\]/, ""); if (!seen[$NF]++) { print "/usr/lib/" $NF } }' |
#         pacman -Qqo - |
#         sort -u
depends=('gcc-libs' 'glibc' 'pam' 'libxml2-legacy' 'libxcrypt-compat' 'krb5')
source=("linuxx64_odbc_cli-$pkgver.tar.gz::https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/v${pkgver%.0}/linuxx64_odbc_cli.tar.gz")
sha256sums=('27cc46b5e7309bae9a13c1c3adc705f1c0d6916ed3e1ac162f2e95430262822d')

package() {
    local f
    install -d "$pkgdir/opt"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cd "$srcdir"
    for f in clidriver/license/UNIX/odbc_LI_*; do
        install -m 0644 "$f" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-${f##*/odbc_LI_}.txt"
    done
    mv "$pkgdir/usr/share/licenses/$pkgname"/LICENSE{-en,}.txt
    for f in clidriver/license/odbc_*; do
        install -m 0644 "$f" "$pkgdir/usr/share/licenses/$pkgname/${f##*/odbc_}"
    done
    rm -rf clidriver/{license,db2dump}
    mv -T clidriver "$pkgdir/opt/$pkgname"
}
