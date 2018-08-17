# Maintainer: Xiang Gao ("zasdfgbnm") <qasdfgtyuiop@gmail.com>
# Contributor: François Garillot ("huitseeker") <francois [at] garillot.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@gmail.com>

pkgname=apache-spark-git
pkgver=2.4.0.SNAPSHOT.20180817.22533
pkgrel=1
pkgdesc="fast and general engine for large-scale data processing"
arch=('any')
url="http://spark.apache.org"
license=('APACHE')
depends=('java-environment>=6')
makedepends=('git')
conflicts=('apache-spark')
optdepends=('python2: python2 support for pyspark'
            'ipython2: ipython2 support for pyspark'
            'python: python3 support for pyspark'
            'ipython: ipython3 support for pyspark'
            'r: support for sparkR'
            'rsync: support rsync spark binaries from master'
	        'hadoop: run spark on hadoop')
install=apache-spark.install
source=('git://git.apache.org/spark.git'
        'apache-spark-master.service'
        'apache-spark-slave@.service'
        'spark-env.sh'
        'spark-daemon-run.sh'
        'run-master.sh'
        'run-slave.sh'
        'apache-spark.sh')
md5sums=( SKIP
         '9ffe1f9c4bb2ea4e5a75ab6469fe76d4'
         '8d34bd4cc946f46625597ca606da8ab6'
         '348c1550272ada89c982865c20dad9d6'
         '8ff953f0436209b6190add59703a34f0'
         '028472b82e9def7d5d409f008d064fe2'
         '99115eedc453c9b8ca04cca2e32e4537'
         '9b81f0be89236ffcfaeb9dc2c3bddf4a')
backup=('etc/apache-spark/spark-env.sh')

pkgver() {
    cd "$srcdir/spark"
    _author_ver=$(grep -oP '(?<=\<version\>).*(?=\</version\>)' pom.xml|head -n 2|tail -n 1|sed 's/-/./')
    _last_commit_date=$(git log -1 --pretty='%cd' --date=short | tr -d '-')
    _commit_count="$(git rev-list --count HEAD)"
    echo $_author_ver.$_last_commit_date.$_commit_count
}

build() {
    cd "$srcdir/spark"
    build/mvn -DskipTests clean package
}

package() {
        cd "$srcdir/spark"

        # install files to spark home (/opt/apache-spark)
        sparkhome="$pkgdir/opt/apache-spark"
        jarpath="assembly/target/scala-2.11/jars"
        install -d "$sparkhome"
        cp -r "$srcdir/spark"/{bin,conf,data,docs,examples,licenses,python,R,sbin,CONTRIBUTING.md,LICENSE,NOTICE,README.md} "$sparkhome"
        install -D "$srcdir/spark/$jarpath"/* -t "$sparkhome/$jarpath"
        rm -rf "$sparkhome/bin"/*.cmd

        # install files to system
        install -d "$pkgdir/usr/bin" "$pkgdir/var/log/apache-spark"
        for i in $(ls "$sparkhome/bin");do ln -sf /opt/apache-spark/bin/$i "$pkgdir/usr/bin"; done
        install -D "$srcdir"/*.service -t "$pkgdir/usr/lib/systemd/system/"
        install -D "$srcdir"/{run-master.sh,run-slave.sh,spark-daemon-run.sh} "$sparkhome/sbin/"
        install -D "$srcdir/spark/conf"/* "$srcdir/spark-env.sh" -t "$pkgdir/etc/apache-spark"
        install -D "$srcdir/apache-spark.sh" "$pkgdir/etc/profile.d/apache-spark.sh"

        # lines files in system to spark home
        cd "$sparkhome"
        mv conf conf-templates
        ln -sf "/etc/apache-spark" conf
        ln -sf "/var/lib/apache-spark/work" .
}
