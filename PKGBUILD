# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# OpenTSDB authors: https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/AUTHORS

# Supports automatic update checking

pkgname="opentsdb"
_MAJOR=2
_MINOR=4
_PATCH=1
pkgver=$_MAJOR.$_MINOR.$_PATCH

function _dl_url {
  echo "https://github.com/OpenTSDB/opentsdb/archive/v$1.$2.$3.zip"
}

pkgrel=2
pkgdesc="Distributed, scalable Time Series Database (TSDB) written on top of HBase"
arch=("any")
url="http://opentsdb.net/"
license=("LGPL2.1")
depends=("java-runtime=8" "hbase" "gnuplot")
makedepends=("java-environment=8")
backup=(
  "etc/${pkgname}/logback.xml"
  "etc/${pkgname}/opentsdb.conf"
)
install="${pkgname}.install"
source=("opentsdb_$_MAJOR.$_MINOR.$_PATCH.zip::$(_dl_url $_MAJOR $_MINOR $_PATCH)"
        "opentsdb.service")
sha512sums=('a535e2aea14658fd1eb26d1239091dbcb52aff8d03379999e03b5b7c089ca0866ec7fbe552a617c07e13074c9c3e27c12049c0144b23f0d18482615517502c05'
            'SKIP')
_watch="https://github.com/OpenTSDB/opentsdb/releases"

prepare() {
  cd "$pkgname-$pkgver"

  javac_flags="-Xlint -source 7 -encoding utf-8"

  sed -i -e "s,AM_JAVACFLAGS = -Xlint -source 6 -encoding utf-8,AM_JAVACFLAGS = $javac_flags,g" "Makefile.am"

  replace_mvnurl_central='sed -i -e s,http://central.maven.org/maven2,https://repo.maven.apache.org/maven2,g'
  replace_mvnurl_repo1='sed -i -e s,http://repo1.maven.org/maven2,https://repo1.maven.org/maven2,g'

  find "$srcdir/$pkgname-$pkgver/third_party" \
    -type f \
    -name "include.mk" \
    -exec echo "Fixing mvn central repo url in file {}" \; -exec $replace_mvnurl_central {} \; -exec $replace_mvnurl_repo1 {} \;
}

build() {
  cd "$pkgname-$pkgver"

  jdk7="/usr/lib/jvm/java-7-openjdk"
  compile_path="$jdk7/bin:$PATH"

  PATH="$compile_path" ./bootstrap
  PATH="$compile_path" ./configure --prefix=/usr
  PATH="$compile_path" make dist
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 \
    "$pkgdir/usr/share/opentsdb/etc/opentsdb/logback.xml" \
    "$pkgdir/etc/opentsdb/logback.xml"
  install -Dm644 \
    "$pkgdir/usr/share/opentsdb/etc/opentsdb/opentsdb.conf" \
    "$pkgdir/etc/opentsdb/opentsdb.conf"

  systemd_units="$pkgdir/usr/lib/systemd/system"
  mkdir -p "$systemd_units"
  install -Dm644 \
    "$srcdir/opentsdb.service" \
    "$systemd_units/opentsdb.service"

  install -Dm644 \
    "$srcdir/$pkgname-$pkgver/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 \
    "$srcdir/$pkgname-$pkgver/COPYING.LESSER" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING.LESSER"
}
