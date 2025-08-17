# Maintainer: Hasan Çatalgöl <hasancatalgol@gmail.com>
pkgname=apache-paimon
pkgver=1.2.0
pkgrel=1
pkgdesc="Apache Paimon — Spark runtime JAR (Spark 3.5)"
arch=('any')  # JAR + shell script
url="https://paimon.apache.org/"
license=('Apache-2.0')

# You don't need Spark installed to install these JARs.
depends=('java-runtime-headless')
optdepends=(
  'apache-spark: system Spark runtime'
  'python-pyspark: Python interface to Spark'
)

source=(
  "https://repo1.maven.org/maven2/org/apache/paimon/paimon-spark-3.5/${pkgver}/paimon-spark-3.5-${pkgver}.jar"
)
b2sums=('baed3fb412b5d9da643401394390e555ea7887972c86703dabce0c97d48a96bee449ce9c82fafe22c8289830268154d47578e09659f5124aefe407faff202d28')

package() {
  _dest="$pkgdir/usr/share/java/apache-paimon"
  install -d "$_dest"
  install -m644 "$srcdir/paimon-spark-3.5-${pkgver}.jar" "$_dest/"

  # Canonical classpath file (colon-separated)
  install -d "$pkgdir/usr/share/apache-paimon"
  printf "/usr/share/java/apache-paimon/paimon-spark-3.5-%s.jar\n" "$pkgver" \
    > "$pkgdir/usr/share/apache-paimon/classpath"

  # Helper:
  #   default  -> colon-separated (Java CLASSPATH)
  #   --spark  -> comma-separated for Spark's --jars
  #   --jars   -> alias for --spark
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/paimon-classpath" << 'EOF'
#!/bin/sh
CP_FILE="/usr/share/apache-paimon/classpath"
FALLBACK="/usr/share/java/apache-paimon/paimon-spark-3.5-1.2.0.jar"
[ -r "$CP_FILE" ] && CP=$(cat "$CP_FILE") || CP="$FALLBACK"
case "$1" in
  --spark|--jars) printf "%s" "$CP" | tr ':' ',' ;;
  *)              printf "%s" "$CP" ;;
esac
EOF
  chmod 755 "$pkgdir/usr/bin/paimon-classpath"

  # Nice alias
  ln -s /usr/bin/paimon-classpath "$pkgdir/usr/bin/paimon-jars"
}
