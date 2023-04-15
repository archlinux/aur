# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Amina Khakimova <hakami1024@gmail.com>
# Contributor: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
# Contributor: Mark Dixon <mark@markdixon.name>

pkgname=neo4j-community
_name=neo4j
pkgver=5.10.0
pkgrel=1
_java=17
pkgdesc="A fully transactional graph database implemented in Java"
arch=(any)
url="https://github.com/neo4j/neo4j"
license=(GPL3)
depends=(
  "java-runtime=$_java"
  "scala"
)
makedepends=(
  "java-environment=$_java"
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
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "neo4j.executable-template"
  "neo4j.service"
  "neo4j.sysusers"
  "neo4j.tmpfiles"
  "use-system-scala.patch"
)
sha256sums=(
  '35c4d828a1a6007947fddde73f06f46e5d1dc6d1fe832bdca969374754d72d2a'
  '152e35d949fe9090c890e7a213da917c09bc087a060119a1c32541821f91781f'
  '090e9ced1708e22592f775490360762d973e81061a0170b4150b087b1751e142'
  'a1d3dd94aecf80289e8d9b6381d4393ed60b7a5dec3cae436e721be676c15f3a'
  '45033d5009c84340b79f914bfc13b00c67a8c0bf30a5ccf9d016b5e238762f92'
  'f0ec370a01d479459c44c096730396524a86c7c04b706ff6094120accc17d6de'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/use-system-scala.patch"

  mvn versions:set -DnewVersion="$pkgver"

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

  export PATH="/usr/lib/jvm/java-$_java-openjdk/bin:$PATH"
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
  install -Dm644 "$bin_archive/conf/neo4j-admin.conf" "$pkgdir/etc/neo4j/neo4j-admin.conf"
  install -Dm644 "$bin_archive/conf/neo4j.conf" "$pkgdir/etc/neo4j/neo4j.conf"
  install -Dm644 "$bin_archive/conf/server-logs.xml" "$pkgdir/etc/neo4j/server-logs.xml"
  install -Dm644 "$bin_archive/conf/user-logs.xml" "$pkgdir/etc/neo4j/user-logs.xml"

  sed -i 's:=/usr/share/neo4j/lib:=/usr/share/java/neo4j:' "$pkgdir/etc/neo4j/neo4j.conf"

  # Bash completion
  install -Dm644 "$bin_archive/bin/completion/neo4j-admin_completion" "$pkgdir/usr/share/bash-completion/completions/neo4j-admin"
  install -Dm644 "$bin_archive/bin/completion/neo4j_completion" "$pkgdir/usr/share/bash-completion/completions/neo4j"

  # JARs

  ## Remove Scala JARs
  rm "$bin_archive/lib/"scala-library-*.jar
  rm "$bin_archive/lib/"scala-reflect-*.jar

  ## Install JARs
  install -dm755 "$pkgdir/usr/share/java/neo4j"
  install -Dm644 "$bin_archive/lib/"*.jar "$pkgdir/usr/share/java/neo4j/"

  # Man pages
  install -Dm644 community/cypher-shell/packaging/src/common/manpages/cypher-shell.1 "$pkgdir/usr/share/man/man1/cypher-shell.1"

  # Documentation
  install -Dm644 "$bin_archive/README.txt" "$pkgdir/usr/share/doc/neo4j/README.txt"
  install -Dm644 "$bin_archive/UPGRADE.txt" "$pkgdir/usr/share/doc/neo4j/UPGRADE.txt"

  # License files
  install -Dm644 "$bin_archive/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "$bin_archive/LICENSES.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.txt"
  install -Dm644 "$bin_archive/NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"

  # Executable files
  install -Dm755 "bin/cypher-shell" "$pkgdir/usr/bin/cypher-shell"
  install -Dm755 "bin/neo4j" "$pkgdir/usr/bin/neo4j"
  install -Dm755 "bin/neo4j-admin" "$pkgdir/usr/bin/neo4j-admin"

  # Systemd files
  install -Dm644 "$srcdir/$_name.service" "$pkgdir/usr/lib/systemd/system/$_name.service"
  install -Dm644 "$srcdir/$_name.sysusers" "$pkgdir/usr/lib/sysusers.d/$_name.conf"
  install -Dm644 "$srcdir/$_name.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_name.conf"
}
