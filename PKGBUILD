# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines – several of the dependencies have their own packages
pkgname=apache-jena
pkgver=3.8.0
pkgrel=1
pkgdesc='Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime')
source=("http://www-us.apache.org/dist/${pkgname/apache-/}/binaries/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0ebf2ecef04bd3534d471fc004425df905ee19d0d9def67d7b1531b49c9de20557dc5a53ae455b2ec7abc6592bfd8c70d6e68cba40cc4380e9313b669cae3383')

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/${pkgname}/" "$pkgdir/usr/bin/"

    # install most files in /opt (yes, I know, I know :/ see TODO at the top)
    cp -r -t "$pkgdir/opt/${pkgname}/" bin/ lib/ LICENSE NOTICE README jena-log4j.properties

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
