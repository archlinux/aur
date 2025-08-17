# Maintainer: Hasan Çatalgöl <hasancatalgol@gmail.com>
pkgname=apache-iceberg
pkgver=1.9.2
pkgrel=1
pkgdesc="Apache Iceberg — Spark runtime bundle (Spark 3.5, Scala 2.13)"
arch=('any')  # JAR + shell script
url="https://iceberg.apache.org/"
license=('Apache-2.0')

# You don't need Spark installed to install these JARs.
depends=('java-runtime-headless')
optdepends=(
  'apache-spark: system Spark runtime'
  'python-pyspark: Python interface to Spark'
)

source=(
  "https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.13/${pkgver}/iceberg-spark-runtime-3.5_2.13-${pkgver}.jar"
)
b2sums=('4acaf01554c20d004a93c7ed01b57c895b4cfa096f12650e27c81b45c5fa4088539f70a2ecaeafd14e293109ff7b77d13eb9c9cf0d86ad18ab9e9af6b2106dae')

package() {
  _dest="$pkgdir/usr/share/java/apache-iceberg"
  install -d "$_dest"
  install -m644 "$srcdir/iceberg-spark-runtime-3.5_2.13-${pkgver}.jar" "$_dest/"

  # Canonical classpath file (colon-separated)
  install -d "$pkgdir/usr/share/apache-iceberg"
  printf "/usr/share/java/apache-iceberg/iceberg-spark-runtime-3.5_2.13-%s.jar\n" "$pkgver" \
    > "$pkgdir/usr/share/apache-iceberg/classpath"

  # Helper that prints classpath:
  #   default  -> colon-separated
  #   --spark  -> comma-separated (for Spark's --jars)
  #   --jars   -> alias for --spark
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/iceberg-classpath" << 'EOF'
#!/bin/sh
CP_FILE="/usr/share/apache-iceberg/classpath"
FALLBACK="/usr/share/java/apache-iceberg/iceberg-spark-runtime-3.5_2.13-1.9.2.jar"
[ -r "$CP_FILE" ] && CP=$(cat "$CP_FILE") || CP="$FALLBACK"
case "$1" in
  --spark|--jars) printf "%s" "$CP" | tr ':' ',' ;;
  *)              printf "%s" "$CP" ;;
esac
EOF
  chmod 755 "$pkgdir/usr/bin/iceberg-classpath"

  # Nice alias
  ln -s /usr/bin/iceberg-classpath "$pkgdir/usr/bin/iceberg-jars"
}
