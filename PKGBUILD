# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli
pkgver=0.6.0
pkgrel=1
pkgdesc="The Lingua Franca compiler and command line tools"
arch=('x86_64' 'aarch64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'bash')
conflicts=('lfc-bin' 'lf-cli-bin' 'lf-cli-nightly' 'lf-cli-nightly-bin')
source=("https://github.com/lf-lang/lingua-franca/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('741d29d28f9046200f0ab5fae0c00a730ba9f687b197c222078f5ebc5671470a12bc61d88187102c513a967309a9894b8f6c535c2d14438a13538ec7192d87e0')

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
