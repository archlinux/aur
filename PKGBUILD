# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# OpenTSDB authors: https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/AUTHORS

pkgname="opentsdb"
pkgver=2.4.0
pkgrel=4
pkgdesc="Distributed, scalable Time Series Database (TSDB) written on top of HBase"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
url="http://opentsdb.net/"
license=("LGPL2.1")
depends=("java-runtime" "hbase" "gnuplot")
makedepends=("java-environment=7" "java-runtime=6")
backup=(
  "etc/${pkgname}/logback.xml"
  "etc/${pkgname}/opentsdb.conf"
)
install="${pkgname}.install"
source=("https://github.com/OpenTSDB/opentsdb/archive/v${pkgver}.zip"
        "${pkgname}.install"
        "opentsdb.service")
sha512sums=('bec865831790fac91b90861451a8f14dc92992c2e5840ef663d728b68bf866c9bdda87f6562f1778e31e643d0cfb6f26d97e439e1ca990372d2cb81e28070fe9'
            '99d5dd12ca066cd9b464e3ca40f8e66e0075039312717dba813b5e62f01da4a0d5a082df81fb0a10ca6def9c21ef26274bbe78e9594848f81cb6580960f560aa'
            '29aa52c408323f0586e51c2e682ccaed5e7ac3c9dfff6e35b0185c180ec61d969fcdba8407878ee6a0d9d5fa6a15aa29ddf54d8baa3458e4075a0f97ba718ebd')
_watch="https://github.com/OpenTSDB/opentsdb/releases"

prepare() {
  cd "$pkgname-$pkgver"

  jre6="/usr/lib/jvm/java-6-jre/jre"
  bootclasspath="$jre6/lib/rt.jar"
  javac_flags="-Xlint -source 6 -encoding utf-8 -bootclasspath $bootclasspath"

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
