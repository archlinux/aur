# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines – several of the dependencies have their own packages
pkgname=apache-jena
pkgver=4.9.0
pkgrel=1
pkgdesc='Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime')
source=("https://downloads.apache.org/${pkgname/apache-/}/binaries/${pkgname}-${pkgver}.tar.gz")
sha512sums=('04f87c42a3b5fe65ad554beb8a1ef90ca7e0305d306fb18a15bb808891c259f420ab4f630e6b4abbb017e32284f97e23f7b848a21dc57f32ad53f604cb82e28b')

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
