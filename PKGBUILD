# Maintainer: Hasan Çatalgöl <hasancatalgol@gmail.com>
pkgname=apache-hudi
pkgver=1.0.2
pkgrel=1
pkgdesc="Apache Hudi (Spark integration) — Spark 3.5 (Scala 2.13) bundle and utilities JARs"
arch=('any')                    # JARs + shell script only
url="https://hudi.apache.org/"
license=('Apache-2.0')

# Only a JRE is required to *use* the JARs. Spark itself is optional.
depends=('java-runtime-headless')
optdepends=(
  'apache-spark: system Spark runtime'
  'python-pyspark: Python interface to Spark (works with the JARs)'
)

source=(
  # Spark 3.5 + Scala 2.12 bundle
  "https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark3.5-bundle_2.13/${pkgver}/hudi-spark3.5-bundle_2.13-${pkgver}.jar"
  # Utilities bundle (needed for Hudi Streamer and some tools)
  "https://repo1.maven.org/maven2/org/apache/hudi/hudi-utilities-bundle_2.13/${pkgver}/hudi-utilities-bundle_2.13-${pkgver}.jar"
)
b2sums=('28535f6ca322a3e56eeda7b30a0b8dbdfd4956c0017f29c388dd0d21e314a0c1ca36fc1e0fa7597216310a0f94a6f9cd7f8ce727ddb527c8cb4086920d17dbf8'
        '3d00c6020295b50117c5eb53e53519b9e5a20f969bc3915944306aab19cd043f96654874b92f78556b7d8f568d12324ad4f8ba94217106ce923d0129c41e059b')

package() {
  _dest="$pkgdir/usr/share/java/apache-hudi"
  install -d "$_dest"

  install -m644 "$srcdir/hudi-spark3.5-bundle_2.13-${pkgver}.jar" "$_dest/"
  install -m644 "$srcdir/hudi-utilities-bundle_2.13-${pkgver}.jar" "$_dest/"

  # Convenience: expose classpath for spark-shell/spark-submit
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/hudi-classpath" << 'EOF'
#!/bin/sh
# Prints Hudi paths.
# Default: Java CLASSPATH (colon-separated).
# Use '--spark' or '--jars' to print comma-separated for Spark's --jars.
CP_FILE="/usr/share/apache-hudi/classpath"
# Fallback for safety if the file ever goes missing (Spark 3.5 / Scala 2.13)
CLASSPATH_DEFAULT="/usr/share/java/apache-hudi/hudi-spark3.5-bundle_2.13-1.0.2.jar:/usr/share/java/apache-hudi/hudi-utilities-bundle_2.13-1.0.2.jar"
[ -r "$CP_FILE" ] && CP=$(cat "$CP_FILE") || CP="$CLASSPATH_DEFAULT"
case "$1" in
  --spark|--jars) printf "%s" "$CP" | tr ':' ',' ;;
  *)              printf "%s" "$CP" ;;
esac
EOF
chmod 755 "$pkgdir/usr/bin/hudi-classpath"

  # Also drop a file others can read to compose CLASSPATHs
  install -d "$pkgdir/usr/share/apache-hudi"
  printf "/usr/share/java/apache-hudi/hudi-spark3.5-bundle_2.13-%s.jar:/usr/share/java/apache-hudi/hudi-utilities-bundle_2.13-%s.jar\n" "$pkgver" "$pkgver" \
    > "$pkgdir/usr/share/apache-hudi/classpath"
}
