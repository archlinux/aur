# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines – several of the dependencies have their own packages
pkgname=apache-jena
pkgver=3.10.0
pkgrel=1
pkgdesc='Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime')
source=("http://www-us.apache.org/dist/${pkgname/apache-/}/binaries/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7dafe7aa28cb85a6da9f6f2b109372ec0d097d4f07d8cb5882dde814b55cdb60512ab9bc09c2593118aaf3fbbc1f65f1d3b921faca7bddefd3f6bf9d7f332998')

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
