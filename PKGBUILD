# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Amina Khakimova <hakami1024@gmail.com>
# Contributor: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
# Contributor: Mark Dixon <mark@markdixon.name>

pkgname=neo4j-community
_pkgname=neo4j
pkgver=5.18.0
pkgrel=1
pkgdesc="A fully transactional graph database implemented in Java"
arch=(any)
url="https://github.com/neo4j/neo4j"
license=(GPL-3.0-only)
_java_version=17
depends=(
  "java-runtime=$_java_version"
  "scala"
)
makedepends=(
  "java-environment=$_java_version"
  "maven"
)
conflicts=(neo4j-enterprise)
backup=(
  etc/neo4j/neo4j-admin.conf
  etc/neo4j/neo4j.conf
  etc/neo4j/server-logs.xml
  etc/neo4j/user-logs.xml
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "neo4j.executable-template"
  "neo4j.service"
  "neo4j.sysusers"
  "neo4j.tmpfiles"
  "use-system-scala.patch"
)
sha256sums=(
  '0a9d4b833798d4eeaaa14669466b65d283e18567a00f4e8195c978225bd06499'
  '152e35d949fe9090c890e7a213da917c09bc087a060119a1c32541821f91781f'
  '090e9ced1708e22592f775490360762d973e81061a0170b4150b087b1751e142'
  'a1d3dd94aecf80289e8d9b6381d4393ed60b7a5dec3cae436e721be676c15f3a'
  '45033d5009c84340b79f914bfc13b00c67a8c0bf30a5ccf9d016b5e238762f92'
  'f0ec370a01d479459c44c096730396524a86c7c04b706ff6094120accc17d6de'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/use-system-scala.patch"

  mvn versions:set -DnewVersion="$pkgver"

  # Download dependencies
  mvn \
    -Dmaven.repo.local="$srcdir/repo" \
    -Dscala.home=/usr/share/scala \
    dependency:go-offline

  mkdir -p bin
  # shellcheck disable=SC2002
  {
    cat "$srcdir/neo4j.executable-template" \
      | sed "s/%APP_NAME%/neo4j/" \
      | sed "s/%CLASS_NAME%/org.neo4j.server.startup.Neo4jBoot/" \
        > bin/neo4j
    cat "$srcdir/neo4j.executable-template" \
      | sed "s/%APP_NAME%/neo4j-admin/" \
      | sed "s/%CLASS_NAME%/org.neo4j.server.startup.Neo4jAdminBoot/" \
        > bin/neo4j-admin
    cat "$srcdir/neo4j.executable-template" \
      | sed "s/%APP_NAME%/cypher-shell/" \
      | sed "s/%CLASS_NAME%/org.neo4j.shell.startup.CypherShellBoot/" \
        > bin/cypher-shell
  }
}

build() {
  cd "$_archive"

  export PATH="/usr/lib/jvm/java-$_java_version-openjdk/bin:$PATH"
  mvn \
    -Dmaven.repo.local="$srcdir/repo" \
    -Dscala.home=/usr/share/scala \
    package -DskipTests
}

check() {
  cd "$_archive"

  # Running all integration tests takes ~1 hour
  mvn \
    -Dmaven.repo.local="$srcdir/repo" \
    -Dscala.home=/usr/share/scala \
    integration-test --projects community/community-it/community-it/
}

package() {
  cd "$_archive"

  tar -xf "packaging/standalone/target/neo4j-community-$pkgver-unix.tar.gz"
  local bin_archive="neo4j-community-$pkgver"

  # Config files
  install -Dm644 -t "$pkgdir/etc/neo4j" \
    "$bin_archive/conf/neo4j-admin.conf" \
    "$bin_archive/conf/neo4j.conf" \
    "$bin_archive/conf/server-logs.xml" \
    "$bin_archive/conf/user-logs.xml"

  sed -i 's|=/usr/share/neo4j/lib|=/usr/share/java/neo4j|' "$pkgdir/etc/neo4j/neo4j.conf"

  # Bash completion
  install -Dm644 "$bin_archive/bin/completion/neo4j-admin_completion" "$pkgdir/usr/share/bash-completion/completions/neo4j-admin"
  install -Dm644 "$bin_archive/bin/completion/neo4j_completion" "$pkgdir/usr/share/bash-completion/completions/neo4j"

  # Remove Scala JARs
  rm "$bin_archive/lib/"scala-library-*.jar
  rm "$bin_archive/lib/"scala-reflect-*.jar

  # Install JARs
  install -Dm644 -t "$pkgdir/usr/share/java/neo4j" "$bin_archive/lib/"*.jar

  # Man pages
  install -Dm644 -t "$pkgdir/usr/share/man/man1" \
    community/cypher-shell/packaging/src/common/manpages/cypher-shell.1

  # Documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/neo4j" \
    "$bin_archive/README.txt" \
    "$bin_archive/UPGRADE.txt"

  # License files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$bin_archive/LICENSE.txt" \
    "$bin_archive/LICENSES.txt" \
    "$bin_archive/NOTICE.txt"

  # Executable files
  install -Dm755 -t "$pkgdir/usr/bin" \
    bin/cypher-shell \
    bin/neo4j \
    bin/neo4j-admin

  # Systemd files
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/neo4j.service"
  install -Dm644 "$srcdir/neo4j.sysusers" "$pkgdir/usr/lib/sysusers.d/neo4j.conf"
  install -Dm644 "$srcdir/neo4j.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/neo4j.conf"
}
