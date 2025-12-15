# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines – several of the dependencies have their own packages
pkgname=apache-jena
pkgver=5.6.0
pkgrel=1
pkgdesc='Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime>=17')
source=("https://downloads.apache.org/${pkgname/apache-/}/binaries/${pkgname}-${pkgver}.tar.gz")
sha512sums=('220ff50c3b6803c2cdade5479f8812700b281f4153fd73cdb83277b30f3d2c9e8a4a49d09717cfa7dde4fe5c7132a2aaaeeef3fbc474a6773b3d9deb5d63cbaa')

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
