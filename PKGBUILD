# Maintainer: William Tang <galaxyking0419@gmail.com>
# Contributor: Lukas Zimmermann ("lukaszimmermann") <luk [dot] zim91 [at] gmail.com>
# Contributor: François Garillot ("huitseeker") <francois [at] garillot.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@gmail.com>
# Contributor: Emanuel Fontelles ("emanuelfontelles") <emanuelfontelles@hotmail.com>

pkgname=apache-spark
pkgver=3.5.0
pkgrel=1
pkgdesc="A unified analytics engine for large-scale data processing"
arch=('any')
url="http://spark.apache.org"
license=('APACHE')
depends=('inetutils' 'java-runtime-headless<=17')

source=("https://dlcdn.apache.org/spark/spark-$pkgver/spark-$pkgver-bin-hadoop3.tgz"
        'apache-spark.sh'
        'apache-spark-master.service'
        'apache-spark-worker@.service')
sha256sums=('ac064ec620129b4b9630e180e25ac2b71a8ccd4c6912bf5b5631943b742f0379'
            '0cc82baad4d878d4e2bc5864a00b99d38f2906781ea47ee6282546788e797049'
            'de54c025ca8ce34a7b4fd95ec7b8d5dec44582787a0bd8da09232f26e2182c9a'
            '47e6c154daecf7631ac9a33fe53a76888070c823c4381fcbde8d98377e586505')

install=apache-spark.install

prepare() {
    cd spark-${pkgver}-bin-hadoop3

    # Remove Python and R files
    rm -rf python R

    # Remove windows batch files
    rm bin/*.cmd
}

package() {
    # Create directory structure
    mkdir -p $pkgdir/{etc/profile.d,opt,usr/lib/systemd/system}

    # Install path profile
    cp $pkgname.sh $pkgdir/etc/profile.d/

    # Install systemd services
    cp $pkgname-master.service $pkgname-worker@.service $pkgdir/usr/lib/systemd/system/

    # Install program files
    mv spark-${pkgver}-bin-hadoop3 $pkgdir/opt/$pkgname
}
