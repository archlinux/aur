# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh-git'
pkgver=v2.4.r2097.g7585ab6
pkgrel=1
pkgdesc="Testing TLS/SSL encryption (git version)"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL2")
depends=('perl' 'bash' 'coreutils' 'util-linux' 'openssl' 'inetutils' 'bind-tools' 'procps-ng')
makedepends=('git')
checkdepends=('perl-data-dump' 'perl-json' 'perl-test-base')
conflicts=('testssl.sh')
provides=('testssl.sh')
install="${pkgname/-git/}.install"
source=(
    "${pkgname}::git+https://github.com/drwetter/${pkgname/-git/}.git"
    'set-install-dir.patch'
)
sha256sums=(
    'SKIP'
    '896d9867cd816b706ca6170fea07285e6daee5ff7bfc246a8ee9a7f682dcbdeb'
)

pkgver () {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p0 < "${srcdir}/set-install-dir.patch"
}

check() {
    cd "${srcdir}/${pkgname}"
    TESTSSL_INSTALL_DIR="$(pwd)" prove -v
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm 755 testssl.sh "${pkgdir}/usr/bin/testssl"
    install -Dm 644 etc/* -t "${pkgdir}/usr/share/testssl.sh/etc"
    install -Dm 644 Readme.md doc/testssl.1.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 doc/testssl.1 -t "${pkgdir}/usr/share/man/man1"
}
