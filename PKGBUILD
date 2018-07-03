# Maintainer: Hal Gentz <zegentzy@protonmail.com>
# Contributer: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>

pkgname=neo4j-git
pkgver=3.5.0.alpha02.r224.25bd3fa979e
pkgrel=1
pkgdesc='A fully transactional graph database implemented in Java'
arch=('any')
url="http://neo4j.org/"
license=("custom")
makedepends=('git' 'patch' 'maven' 'tar')
depends=('java-runtime-headless>=8')
conflicts=('neo4j-enterprise' 'neo4j-community')
backup=('etc/neo4j/neo4j.conf')
options=(!strip)
install=neo4j.install
source=("$pkgname::git+https://github.com/neo4j/neo4j.git"
        "bin.patch"
        "neo4j.conf"
        "neo4j.install"
        "neo4j.service"
        "neo4j"
        "neo4j-admin"
        "neo4j-import"
        "neo4j-shell")
sha256sums=('SKIP'
            '163a1fad08a26c1367ea24a09e3231dab9aa0ed6b86b6421663cad622e2b680b'
            '9eea28f61efcdcee6b927d8a941adf2409fd0375619727ff5070d12b09153096'
            'f95936abc4a519b01d2cd987cd38a253003cf4cd39bfab29948708e82d98de66'
            '4604cd10e0c274ed8d2306f1ab3d6e62c31cfc7f0aee4de9feb97759740c38d7'
            '4b5573eac61334163ad1fd45b9edaf2aa281e80596c0c61d0e18525a63baa640'
            '4b5573eac61334163ad1fd45b9edaf2aa281e80596c0c61d0e18525a63baa640'
            '4b5573eac61334163ad1fd45b9edaf2aa281e80596c0c61d0e18525a63baa640'
            '4b5573eac61334163ad1fd45b9edaf2aa281e80596c0c61d0e18525a63baa640')
            
pkgver() 
{
	cd "$srcdir/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
    export MAVEN_OPTS="-Xmx512m"
    mvn clean install -DskipTests
    VERSION=$(cat pom.xml | grep "<version>" | head -n 1 | sed "s/^[[:space:]]*<version>//" | sed "s/<\/version>//")
    cd packaging/standalone/target
    tar -xvzf "neo4j-community-$VERSION-unix.tar.gz"
    cd "neo4j-community-$VERSION"
    patch -Np1 -i "$srcdir/bin.patch"
}

package() {
	cd "$srcdir/$pkgname"
    VERSION=$(cat pom.xml | grep "<version>" | head -n 1 | sed "s/^[[:space:]]*<version>//" | sed "s/<\/version>//")
    cd "packaging/standalone/target/neo4j-community-$VERSION"

    # NOTE: We copy the structure of their debian package, which is why we don't 
    # copy everything

    # Config files
    CONFIG_DIR=etc/neo4j
    install -dm755 "$pkgdir/$CONFIG_DIR"
    install -dm700 "$pkgdir/$CONFIG_DIR/certificates"
    install -Dm644 "$srcdir/neo4j.conf" "$pkgdir/etc/neo4j/neo4j.conf"

    # Service definition files
    install -Dm644 "$srcdir/neo4j.service" "$pkgdir/usr/lib/systemd/system/neo4j.service"

    # JAR files
    BIN_DIR=usr/share/neo4j
    install -dm755 "$pkgdir/$BIN_DIR"

    install -dm755 "$pkgdir/$BIN_DIR/tools"
    for f in ./bin/tools/*; do
        b_file=$(basename $f)
        install -Dm755 "./bin/tools/$b_file" "$pkgdir/$BIN_DIR/tools/$b_file"
    done

    install -dm755 "$pkgdir/$BIN_DIR/lib"
    for f in ./lib/*; do
        b_file=$(basename $f)
        install -Dm755 "./lib/$b_file" "$pkgdir/$BIN_DIR/lib/$b_file"
    done

    install -dm755 "$pkgdir/$BIN_DIR/bin"
    install -dm755 "$pkgdir/$BIN_DIR/bin/tools"
    for f in ./bin/tools/*; do
        b_file=$(basename $f)
        install -Dm755 "./bin/tools/$b_file" "$pkgdir/$BIN_DIR/bin/tools/$b_file"
    done

    for f in $(find bin -maxdepth 1 -type f); do
        b_file=$(basename $f)
        install -Dm755 "./bin/$b_file" "$pkgdir/$BIN_DIR/bin/$b_file"
    done

    install -Dm755 "$srcdir/neo4j" "$pkgdir/usr/bin/neo4j"
    install -Dm755 "$srcdir/neo4j-admin" "$pkgdir/usr/bin/neo4j-admin"
    install -Dm755 "$srcdir/neo4j-import" "$pkgdir/usr/bin/neo4j-import"
    install -Dm755 "$srcdir/neo4j-shell" "$pkgdir/usr/bin/neo4j-shell"

    # License files
    LICENSES_DIR=usr/share/licenses/neo4j
    install -dm755 $pkgdir/$LICENSES_DIR
    cp LICENSE.txt LICENSES.txt NOTICE.txt $pkgdir/$LICENSES_DIR

    # Documentation
    DOC_DIR=usr/share/doc/neo4j
    install -dm755 $pkgdir/$DOC_DIR
    cp README.txt UPGRADE.txt $pkgdir/$DOC_DIR

    # Some directories
    install -dm755 $pkgdir/var/log/neo4j
    install -dm755 $pkgdir/var/lib/neo4j/data/databases
    install -dm755 $pkgdir/var/lib/neo4j/import
    install -dm755 $pkgdir/var/lib/neo4j/plugins
}
