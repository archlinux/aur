# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli
pkgver=0.5.1
pkgrel=1
pkgdesc="The Lingua Franca compiler and command line tools"
arch=('x86_64' 'aarch64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'bash')
conflicts=('lfc-bin' 'lf-cli-bin' 'lf-cli-nightly' 'lf-cli-nightly-bin')
source=("https://github.com/lf-lang/lingua-franca/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0102f703cfa2d65a111ef552e0806afe626fe3ed8967beb283931a40415c49a39e2907fc25f4968c0e39454060ee85f79cbe90cee330ed7864a8eb1bcf9b2b14')

package() {
    cd "${srcdir}/lingua-franca-${pkgver}"

    mkdir -p "${srcdir}"/gradle
    export GRADLE_USER_HOME=${srcdir}/gradle

    ./gradlew --no-daemon assemble

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lfc-cli/LICENSE"

    for f in "build/install/lf-cli/lib"/*.jar; do
        install -Dm644 "${f}" "${pkgdir}/usr/share/java/${pkgname}/lib/$(basename "$f")"
    done
    install -Dm755 "build/install/lf-cli/bin/lfc" "${pkgdir}/usr/share/java/${pkgname}/bin/lfc"
    install -Dm755 "build/install/lf-cli/bin/lfd" "${pkgdir}/usr/share/java/${pkgname}/bin/lfd"
    install -Dm755 "build/install/lf-cli/bin/lff" "${pkgdir}/usr/share/java/${pkgname}/bin/lff"

    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s "../share/java/lf-cli/bin/lfc" lfc
    ln -s "../share/java/lf-cli/bin/lfd" lfd
    ln -s "../share/java/lf-cli/bin/lff" lff
}
