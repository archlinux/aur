# Maintainer: Hasan Catalgol <hasan@dekatechs.com>
pkgname=kafbat-kafka-ui
pkgver=1.3.0
pkgrel=1
pkgdesc="Open-source Web UI for managing Apache Kafka clusters (Kafbat UI)"
arch=('x86_64' 'aarch64')
url="https://github.com/kafbat/kafka-ui"
license=('Apache')
depends=('java-runtime>=21')
makedepends=('git' 'gradle' 'java-environment>=21' 'nodejs' 'npm')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/kafbat/kafka-ui/archive/refs/tags/v$pkgver.tar.gz"
  'kafbat-kafka-ui.service'
  'kafbat-kafka-ui.sysusers'
  'kafbat-kafka-ui.tmpfiles'
  'kafka-ui.yaml'
)
sha256sums=('63854c0faf7fea6c8de756f4843973f7660f5d2d463a00c467b72a8a2722f477'
            '1eafe1e9e0b9f24ca9d5604adc877edfdb27104b9854956235393fee9015fb03'
            '0c3074be0331553ce957d36841decdc470fa5d207fbb9d98789d2547e67e75db'
            '42a9b290f23e6588619dfcdc688c4d404f51328bef0288803ce992a4f4a08ce8'
            '2e996c376f373f099c9dbbd61bd7d5057f2f574b4dddbd6003e3cbfb5a5c73cc')

build() {
  cd "kafka-ui-$pkgver"
  ./gradlew clean build \
    -x test \
    -Pinclude-frontend=true \
    -Pbuild-docker-images=false \
    -Pversion="$pkgver"
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/etc/kafbat"
  install -Dm644 kafka-ui.yaml "$pkgdir/etc/kafbat/kafka-ui.yaml"

  local _jar
  _jar="$(find "kafka-ui-$pkgver/api/build/libs" -maxdepth 1 -type f -name "*.jar" | sort | tail -n1)"
  if [[ -z "$_jar" ]]; then
    echo "Failed to find built JAR under api/build/libs" >&2
    return 1
  fi
  install -Dm644 "$_jar" "$pkgdir/usr/lib/$pkgname/kafbat-kafka-ui.jar"

  # Launcher
  cat > "$pkgdir/usr/bin/kafbat-kafka-ui" <<'EOF'
#!/usr/bin/env bash
exec /usr/bin/java \
  -Dspring.config.additional-location=/etc/kafbat/kafka-ui.yaml \
  --add-opens java.rmi/javax.rmi.ssl=ALL-UNNAMED \
  -jar /usr/lib/kafbat-kafka-ui/kafbat-kafka-ui.jar "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kafbat-kafka-ui"

  # systemd + users + tmpfiles
  install -Dm644 "$srcdir/kafbat-kafka-ui.service" "$pkgdir/usr/lib/systemd/system/kafbat-kafka-ui.service"
  install -Dm644 "$srcdir/kafbat-kafka-ui.sysusers" "$pkgdir/usr/lib/sysusers.d/kafbat-kafka-ui.conf"
  install -Dm644 "$srcdir/kafbat-kafka-ui.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/kafbat-kafka-ui.conf"
}
