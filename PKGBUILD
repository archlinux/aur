# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines – several of the dependencies have their own packages
pkgname=apache-jena
pkgver=5.4.0
pkgrel=1
pkgdesc='Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime>=17')
source=("https://downloads.apache.org/${pkgname/apache-/}/binaries/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0d1d13dd8bb098b28996ffd9871f3a42f54984ac276c10dab0c0d2ccd8c66d69737f20bc3fc05f1ee3a2ceeacba318ef5f1a1f4fd2cba19041210675fac245ed')

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/${pkgname}/" "$pkgdir/usr/bin/"

    # install most files in /opt (yes, I know, I know :/ see TODO at the top)
    cp -r -t "$pkgdir/opt/${pkgname}/" bin/ lib/ LICENSE NOTICE README log4j2.properties

    # symlink binaries into /usr/bin
    cd bin
    for bin in *; do
        # some binaries conflict with other packages, so install them all with a "jena." prefix
        ln -s "../../opt/${pkgname}/bin/${bin}" "$pkgdir/usr/bin/jena.${bin}"
        case "$bin" in
            schemagen)
                # conflicts with a different binary by java-environment-common
                ;;
            tdbbackup|tdbdump)
                # conflicts with different binaries by tdb
                ;;
            *)
                # no conflicts, also install without "jena." prefix
                ln -s "jena.${bin}" "$pkgdir/usr/bin/${bin}"
                ;;
        esac
    done
}
