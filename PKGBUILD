# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds
# fixed by Timo Sarawinski <muhviehstarr>

pkgname='testssl.sh-git'
pkgver=v3.0.r711.ge35f0e8
pkgrel=2
pkgdesc="Testing TLS/SSL encryption (git version)"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL2")
depends=('perl' 'bash' 'coreutils' 'util-linux' 'openssl' 'bind-tools' 'procps-ng')
makedepends=('git')
checkdepends=('perl-data-dump' 'perl-json' 'perl-test-base')
conflicts=('testssl.sh')
provides=('testssl.sh')
install="${pkgname/-git/}.install"
source=(
    "${pkgname}::git+https://github.com/drwetter/${pkgname/-git/}.git"
    'set-install-dir.patch'
)
sha256sums=('SKIP'
            'ed81981de5d8f41de3a36f30fca283d2f668d62da1eda71d3799aa10bd49b617')

pkgver () {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p0 < "${srcdir}/set-install-dir.patch"
    rm bin/openssl.Linux*
}

check() {
    cd "${srcdir}/${pkgname}"
  # the bundled openssl segfaults in the tests
  # TESTSSL_INSTALL_DIR="$(pwd)" prove -v
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm 755 testssl.sh "${pkgdir}/usr/bin/testssl"
    install -Dm 644 etc/* -t "${pkgdir}/usr/share/testssl.sh/etc"
    install -Dm 644 Readme.md doc/testssl.1.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 doc/testssl.1 -t "${pkgdir}/usr/share/man/man1"
}
