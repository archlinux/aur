# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: David Danier <david.danier@team23.de>

pkgname=solr
pkgver=4.10.4
pkgrel=1
pkgdesc="Popular, blazing fast open source enterprise search platform from the Apache Lucene project"
arch=('any')
license=('Apache')
url="http://lucene.apache.org/solr/"
depends=('java-environment-common')
makedepends=('unzip')
source=("http://archive.apache.org/dist/lucene/solr/$pkgver/solr-$pkgver.tgz"
        "jetty-solr.xml"
        "solr.service")
install=solr.install
backup=(etc/solr/{web,solr,jetty}.xml
        etc/solr/zoo.cfg
        etc/solr/core{0,1}/conf/{schema,solrconfig}.xml)

sha256sums=('ac3543880f1b591bcaa962d7508b528d7b42e2b5548386197940b704629ae851'
            '672b64e05b26ca3434d9ef4cf6f02b06358609b72a483340682f70a080c7770f'
            '4d2d0f9c9c44b17146d69389e1545dc85d3a9b1c9b7d9ea9f138b292fc47433b')

package() {
    cd "$srcdir/solr-$pkgver/example"

    install -dm755 "$pkgdir/etc/solr"
    install -dm755 "$pkgdir/usr/share/solr/webapps/solr"
    install -dm755 "$pkgdir/usr/lib/solr/ext"
    install -dm755 "$pkgdir/var/lib/solr"
    install -Dm644 start.jar lib/*.jar "$pkgdir/usr/lib/solr/"
    install -Dm644 lib/ext/*.jar "$pkgdir/usr/lib/solr/ext/"
    install -Dm644 "$srcdir/solr.service" "$pkgdir/usr/lib/systemd/system/solr.service"
    install -Dm644 "$srcdir/jetty-solr.xml" "$pkgdir/usr/share/solr/contexts/jetty-solr.xml"

    unzip webapps/solr.war -d "$pkgdir/usr/share/solr/webapps/solr/"
    rm -rf "$pkgdir/usr/share/solr/webapps/solr/META-INF"

    sed -e 's|<dataDir>.*|<dataDir>/var/lib/solr/core0</dataDir>|' \
        -i multicore/core0/conf/solrconfig.xml
    sed -e 's|<dataDir>.*|<dataDir>/var/lib/solr/core1</dataDir>|' \
        -i multicore/core1/conf/solrconfig.xml

    cp -R multicore/* "$pkgdir/etc/solr"

    install -Dm0644 etc/jetty.xml "$pkgdir/etc/solr/jetty.xml"
    rm -rf "$pkgdir"/etc/solr/{exampledocs,README.txt}
    ln -s /etc/solr "$pkgdir/usr/lib/solr/etc"

    mv "$pkgdir/usr/share/solr/webapps/solr/WEB-INF/web.xml" "$pkgdir/etc/solr"
    ln -s /etc/solr/web.xml "$pkgdir/usr/share/solr/webapps/solr/WEB-INF/web.xml"

    ln -s /etc/solr "$pkgdir/usr/share/solr/conf"
    ln -s /usr/lib/solr "$pkgdir/usr/share/solr/lib"

    cd "$srcdir/solr-$pkgver"
    cp -R contrib/ "$pkgdir/usr/share/solr/"
    cp -R dist/ "$pkgdir/usr/share/solr/"
}
