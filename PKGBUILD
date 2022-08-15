# Maintainer: Zhang Hua<zhanghua.00 at qq dot com>
# Contributor: Alejandro Quisbert <alejandropqc at protonmail dot com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com> 

pkgname=mongosh-git
pkgver=1.5.4.r11.g1db42a4c
pkgrel=1
pkgdesc="The MongoDB Shell."
arch=("x86_64" "aarch64")
depends=("krb5")
makedepends=("npm" "python")
provides=("mongosh" "mongosh-bin")
conflicts=("mongosh" "mongosh-bin")
url="https://github.com/mongodb-js/mongosh"
license=("Apache" "MPL" "custom:Customer Agreement")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/mongosh"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/mongosh"
    npm run bootstrap
    npm install --save-dev pretty-repl
    SEGMENT_API_KEY=makepkg npm run compile-exec 
    # Anything except empty string in key is OK. But I am not sure the actual meaning of this.
    case ${CARCH} in
        x86_64)
            _arch=x64
            ;;
        aarch64)
            _arch=arm64
            ;;
        *)
            _arch=
            ;;
    esac
    npm run evergreen-release package -- --build-variant=linux-${_arch}
    install -Dm644 tmp/crypt-store/linux-${_arch}/mongodb-linux-none-${_arch}-stable-enterprise/LICENSE-Enterprise.txt \
        "LICENSE-Customer Agreement.txt"
}
check(){
    cd "${srcdir}/mongosh"
    npm run test
}
package(){
    cd "${srcdir}/mongosh"
    install -Dm755 dist/mongosh "${pkgdir}/usr/bin/mongosh"
    install -Dm644 tmp/mongosh_crypt_v1.so "${pkgdir}/usr/lib/mongosh_crypt_v1.so"
    install -Dm644 tmp/manpage/mongosh.1.gz "${pkgdir}/usr/share/man/man1/mongosh.1.gz"
    install -Dm644 "LICENSE-Customer Agreement.txt" "${pkgdir}/usr/share/licenses/mongosh/LICENSE-Customer Agreement.txt"
}

