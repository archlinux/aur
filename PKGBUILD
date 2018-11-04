# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh-git'
pkgver=3.0rc1.r73.gde68488
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
    '722a6538b8cbdf18d4b52f7e5216b56ebefb7fff100e5152de97fc5f57f05158'
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
