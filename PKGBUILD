# Maintainer: Hasan Catalgol <hasan@dekatechs.com>
# This PKGBUILD builds Kafbat's Kafka UI from source (backend + frontend),
# installs a bootable Spring Boot JAR, a wrapper script, and ships systemd/sysusers/tmpfiles + a default YAML config.

# ---- Basic package identity ----
pkgname=kafbat-kafka-ui           # The name shown in pacman/AUR
pkgver=1.3.0                      # Upstream release/version tag (keep in sync with source tarball)
pkgrel=1                          # Arch packaging release number (bump when changing the PKGBUILD without upstream version change)
pkgdesc="Open-source Web UI for managing Apache Kafka clusters (Kafbat UI)"  # One-line description
arch=('x86_64' 'aarch64')         # Supported architectures
url="https://github.com/kafbat/kafka-ui"  # Project homepage for reference
license=('Apache')                # Upstream license (Apache-2.0)

# ---- Runtime and build-time dependencies ----
# - java-runtime>=21: Spring Boot app requires Java 21+ to RUN
# - java-environment>=21: JDK 21+ to BUILD
# - gradle: Build tool to orchestrate backend + frontend build
# - nodejs + npm: The frontend is built with Node/Vite; Gradle triggers it
depends=('java-runtime>=21')
makedepends=('git' 'gradle' 'java-environment>=21' 'nodejs' 'npm')

# Pacman will treat this file as a config and prompt on updates instead of overwriting silently.
backup=('etc/kafbat/kafka-ui.yaml')

# ---- Sources ----
# We pull the versioned GitHub release tarball + four auxiliary files that live alongside this PKGBUILD.
# IMPORTANT: .SRCINFO must list these too (run: makepkg --printsrcinfo > .SRCINFO)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/kafbat/kafka-ui/archive/refs/tags/v$pkgver.tar.gz"  # upstream source archive (backend+frontend)
  'kafbat-kafka-ui.service'    # systemd service unit (installed into /usr/lib/systemd/system/)
  'kafbat-kafka-ui.sysusers'   # sysusers.d entry to create a dedicated service user/group
  'kafbat-kafka-ui.tmpfiles'   # tmpfiles.d entry to create /var/lib and /var/log dirs at boot
  'kafka-ui.yaml'              # default YAML configuration installed into /etc/kafbat/kafka-ui.yaml
)

# ---- Checksums for the above sources ----
# If you change any of the local files or bump pkgver, re-run: updpkgsums
sha256sums=('63854c0faf7fea6c8de756f4843973f7660f5d2d463a00c467b72a8a2722f477'
            '1eafe1e9e0b9f24ca9d5604adc877edfdb27104b9854956235393fee9015fb03'
            '0c3074be0331553ce957d36841decdc470fa5d207fbb9d98789d2547e67e75db'
            '42a9b290f23e6588619dfcdc688c4d404f51328bef0288803ce992a4f4a08ce8'
            '2e996c376f373f099c9dbbd61bd7d5057f2f574b4dddbd6003e3cbfb5a5c73cc')

# ---- Build phase ----
# Arch build system calls this in a clean chroot (or your working dir).
# We:
#   1) cd into the extracted source tree (kafka-ui-$pkgver)
#   2) Ask Gradle to build backend + frontend, skip tests, and avoid Docker images
#      -Pinclude-frontend=true: triggers frontend build + bundles the assets into the backend JAR
#      -Pbuild-docker-images=false: we are not shipping Docker
#      -x test: skip lengthy upstream tests to speed up package builds
#      -Pversion="$pkgver": help embed the version into the app
build() {
  cd "kafka-ui-$pkgver"

  ./gradlew clean build \
    -x test \
    -Pinclude-frontend=true \
    -Pbuild-docker-images=false \
    -Pversion="$pkgver"
  # On success, the backend Spring Boot JAR(s) land in api/build/libs/
  # There are typically two JARs:
  #   * app-<version>.jar        -> BOOTABLE/FAT JAR (what we want)
  #   * app-<version>-plain.jar  -> NON-bootable (no Main/Start-Class) — we must NOT install this one
}

# ---- Package phase ----
# Here we assemble the filesystem tree under $pkgdir that will become the final .pkg.tar.zst.
package() {
  # Create target directories inside the staged package root ($pkgdir):
  #  - /usr/lib/$pkgname: app payload (JAR, future assets)
  #  - /usr/bin: tiny launcher script for convenience
  #  - /etc/kafbat: configuration directory for YAML
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/etc/kafbat"

  # Install the default YAML configuration. Pacman will mark it as a config file (see backup=()).
  install -Dm644 kafka-ui.yaml "$pkgdir/etc/kafbat/kafka-ui.yaml"

  # ---- Pick the correct JAR ----
  # We intentionally EXCLUDE '*-plain.jar' because it lacks a Main/Start-Class and cannot be executed.
  # The non-plain JAR is a Spring Boot "fat" JAR that contains the embedded web server + bundled frontend.
  local _jar
  _jar="$(find "kafka-ui-$pkgver/api/build/libs" -maxdepth 1 -type f -name "*.jar" ! -name "*-plain.jar" | sort | tail -n1)"

  if [[ -z "$_jar" ]]; then
    echo "Failed to find bootable JAR under api/build/libs (ensure Gradle build succeeded)" >&2
    return 1
  fi

  # Place the JAR under /usr/lib/$pkgname with a friendly fixed name
  install -Dm644 "$_jar" "$pkgdir/usr/lib/$pkgname/kafbat-kafka-ui.jar"

  # ---- Wrapper script (/usr/bin/kafbat-kafka-ui) ----
  # Provides a stable CLI entrypoint. We pass:
  #   -Dspring.config.additional-location=/etc/kafbat/kafka-ui.yaml
  #       -> makes the app read our system-wide YAML (alongside internal defaults)
  #   --add-opens java.rmi/javax.rmi.ssl=ALL-UNNAMED
  #       -> required by some JDK 21 module-access patterns used by upstream (avoids IllegalAccess errors)
  #   "$@" -> forward any extra CLI args (e.g., --server.port=9090) to the app
  cat > "$pkgdir/usr/bin/kafbat-kafka-ui" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

# Allow users to inject extra JVM args via JAVA_OPTS (e.g., memory, GC tuning)
JAVA_OPTS="${JAVA_OPTS:-}"

exec /usr/bin/java \
  ${JAVA_OPTS} \
  -Dspring.config.additional-location=/etc/kafbat/kafka-ui.yaml \
  --add-opens java.rmi/javax.rmi.ssl=ALL-UNNAMED \
  -jar /usr/lib/kafbat-kafka-ui/kafbat-kafka-ui.jar "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kafbat-kafka-ui"

  # ---- System integration files ----
  # We simply install the files you version in the repo. They should:
  #  - service: define ExecStart= (can call either /usr/bin/kafbat-kafka-ui or java -jar ... directly)
  #  - sysusers: create 'kafbat' system user/group at install/boot
  #  - tmpfiles: create /var/lib/kafbat-kafka-ui and /var/log/kafbat-kafka-ui with correct ownership
  install -Dm644 "$srcdir/kafbat-kafka-ui.service"  "$pkgdir/usr/lib/systemd/system/kafbat-kafka-ui.service"
  install -Dm644 "$srcdir/kafbat-kafka-ui.sysusers" "$pkgdir/usr/lib/sysusers.d/kafbat-kafka-ui.conf"
  install -Dm644 "$srcdir/kafbat-kafka-ui.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/kafbat-kafka-ui.conf"

  # NOTE:
  # After installation, systemd will need a daemon-reload:
  #   sudo systemctl daemon-reload
  # Then enable & start the service:
  #   sudo systemctl enable --now kafbat-kafka-ui.service
  #
  # Logs:
  #   sudo journalctl -u kafbat-kafka-ui -b -n 200 --no-pager
  #
  # Health check (UI loads even if Kafka is absent; cluster list will just show errors):
  #   curl -I http://localhost:8080
}

# ---- Optional ideas (commented out) ----
# provides=('kafka-ui')     # Uncomment if you want pacman to treat this as providing a generic "kafka-ui"
# conflicts=('kafka-ui')    # Uncomment if you later split packaging and want to prevent duplicates
# options=('!lto')          # If you run into weird JDK/LTO interactions, you could disable LTO for this pkg
