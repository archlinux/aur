# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Amina Khakimova <hakami1024@gmail.com>
# Contributor: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
# Contributor: Mark Dixon <mark@markdixon.name>

pkgname=neo4j-community
pkgver=5.5.0
pkgrel=1
pkgdesc='A fully transactional graph database implemented in Java'
arch=(any)
url=https://neo4j.com
license=(custom)
depends=(jre17-openjdk-headless)
conflicts=(neo4j-enterprise)
backup=(
  etc/neo4j/neo4j-admin.conf
  etc/neo4j/neo4j.conf
  etc/neo4j/server-logs.xml
  etc/neo4j/user-logs.xml
)
options=(!strip)
install=neo4j.install

source=(
  https://dist.neo4j.org/deb/neo4j_${pkgver}_all.deb
  neo4j
  neo4j-admin
  neo4j-tmpfile.conf
  neo4j.install
)
sha256sums=(
  '4725f05273cf0c99da42daaa3b231b950159a65e9622a2567eb94298c5d350e5'
  '583635b1736267222d429e6b049af70f6ebd4f76388e8f621f369538bced5718'
  'd3daadb19de811c9d978dba81432c68d78eeff82bc39e11cc493736dadd5660f'
  'e1311352e05b1e698599b91883141b938ceb418abd7e6bc11cc964854f0a21e1'
  '86548a74a78e40b7d200d78ae6cf20c8bf05c590d31aa31fb14632df085aeab8'
)

_deb_archive="$pkgname-$pkgver-deb"

prepare() {
  mkdir -p "$_deb_archive"
  tar --extract --file data.tar.xz --directory "$_deb_archive"
}

package() {
  cd "$_deb_archive"

  # Config files
  install -Dm644 etc/neo4j/neo4j-admin.conf $pkgdir/etc/neo4j/neo4j-admin.conf
  install -Dm644 etc/neo4j/neo4j.conf  $pkgdir/etc/neo4j/neo4j.conf
  install -Dm644 etc/neo4j/server-logs.xml $pkgdir/etc/neo4j/server-logs.xml
  install -Dm644 etc/neo4j/user-logs.xml $pkgdir/etc/neo4j/user-logs.xml

  sed -i 's:=/usr/share/neo4j/lib:=/usr/share/java/neo4j:' $pkgdir/etc/neo4j/neo4j.conf

  # Bash completion
  install -Dm644 etc/bash_completion.d/neo4j-admin_completion $pkgdir/usr/share/bash-completion/completions/neo4j-admin
  install -Dm644 etc/bash_completion.d/neo4j_completion $pkgdir/usr/share/bash-completion/completions/neo4j

  # JARs
  install -dm755 $pkgdir/usr/share/java/neo4j
  install -Dm644 usr/share/neo4j/lib/*.jar $pkgdir/usr/share/java/neo4j

  # Man pages
  install -Dm644 usr/share/man/man1/neo4j-admin.1.gz $pkgdir/usr/share/man/man1/neo4j-admin.1.gz
  install -Dm644 usr/share/man/man1/neo4j.1.gz $pkgdir/usr/share/man/man1/neo4j.1.gz

  # Documentation
  gzip --decompress --force usr/share/doc/neo4j/changelog.gz
  install -Dm644 usr/share/doc/neo4j/README.txt $pkgdir/usr/share/doc/neo4j/README.txt
  install -Dm644 usr/share/doc/neo4j/UPGRADE.txt $pkgdir/usr/share/doc/neo4j/UPGRADE.txt
  install -Dm644 usr/share/doc/neo4j/changelog $pkgdir/usr/share/doc/neo4j/changelog

  # License files
  gzip --decompress --force usr/share/doc/neo4j/LICENSE.txt.gz
  gzip --decompress --force usr/share/doc/neo4j/LICENSES.txt.gz
  gzip --decompress --force usr/share/doc/neo4j/NOTICE.txt.gz
  install -Dm644 usr/share/doc/neo4j/LICENSE.txt $pkgdir/usr/share/licenses/neo4j/LICENSE.txt
  install -Dm644 usr/share/doc/neo4j/LICENSES.txt $pkgdir/usr/share/licenses/neo4j/LICENSES.txt
  install -Dm644 usr/share/doc/neo4j/NOTICE.txt $pkgdir/usr/share/licenses/neo4j/NOTICE.txt
  install -Dm644 usr/share/doc/neo4j/copyright $pkgdir/usr/share/licenses/neo4j/copyright

  # Plugin directory
  install -Dm644 var/lib/neo4j/plugins/README.txt $pkgdir/var/lib/neo4j/plugins/README.txt

  # Labs directory
  install -Dm644 var/lib/neo4j/labs/LICENSE $pkgdir/var/lib/neo4j/labs/LICENSE
  install -Dm644 var/lib/neo4j/labs/README.txt $pkgdir/var/lib/neo4j/labs/README.txt
  install -Dm644 var/lib/neo4j/labs/apoc-5.5.0-core.jar $pkgdir/var/lib/neo4j/labs/apoc-5.5.0-core.jar

  # Lintian
  install -Dm644 usr/share/lintian/overrides/neo4j $pkgdir/usr/share/lintian/overrides/neo4j

  # Executable files
  install -Dm755 $srcdir/neo4j $pkgdir/usr/bin/neo4j
  install -Dm755 $srcdir/neo4j-admin $pkgdir/usr/bin/neo4j-admin

  # Misc directories
  install -dm755 $pkgdir/var/log/neo4j
  install -dm755 $pkgdir/var/lib/neo4j/import
  install -dm755 $pkgdir/var/lib/neo4j/data
  install -dm755 $pkgdir/var/lib/neo4j/certificates
  install -dm755 $pkgdir/var/lib/neo4j/licenses
  install -dm755 $pkgdir/var/lib/neo4j/run

  # Service definition files
  install -Dm644 lib/systemd/system/neo4j.service $pkgdir/usr/lib/systemd/system/neo4j.service
  sed -i 's:ExecStart=/usr/share/neo4j/bin/neo4j:ExecStart=/usr/bin/neo4j:' $pkgdir/usr/lib/systemd/system/neo4j.service

  # Runtime files
  install -Dm644 $srcdir/neo4j-tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/neo4j.conf
}
