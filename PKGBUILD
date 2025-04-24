#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaelff at gnome dot org>

pkgname="mongodb70-bin"
pkgver=7.0.19
_basever=7.0
_basedist="focal"
pkgrel="1"
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64" "aarch64")
url="https://www.mongodb.com/"
license=("SSPL-1.0")
depends=(mongosh-bin curl openssl-1.1)
makedepends=(chrpath)
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-shell-bin")
backup=("etc/mongodb.conf")

_repo_url=https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse
source=(
    "mongodb.sysusers"
    "mongodb.tmpfiles"
    "LICENSE"
)
source_x86_64=(
    mongodb-org-server_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
    mongodb-org-mongos_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
)
source_aarch64=(
    mongodb-org-server_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-server_${pkgver}_arm64.deb"
    mongodb-org-mongos_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-mongos_${pkgver}_arm64.deb"
)
noextract=(
    mongodb-org-server_${pkgver}_${CARCH}.deb
    mongodb-org-mongos_${pkgver}_${CARCH}.deb
)
sha256sums=('47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b'
            'e5273bfee70fb114d7d17d03ef43cc6aae209c4224253abf4c9954cbcc087fc8'
            '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')
sha256sums_x86_64=('53cf9ef797a93873b854bed289de46f0d4a3039ae50e2a65112eb5d8e42cf991'
                   'cffce5e1656f8ab4b5a7facf8b31732712fd3db2f90d6f264245652e1c7aec3c')
sha256sums_aarch64=('eba5b69029ff9f02bff3c590ad26fa2bff393f8d1338a7990264faab18929dbe'
                    '0d1847f1d0ef81567ed7425fca5193df095b4a3c5b43f3f10e05794bef86f7a5')

prepare() {
  mkdir -p output
  bsdtar -O -xf mongodb-org-server_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #server extracted
  bsdtar -O -xf mongodb-org-mongos_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #mongos extracted

  # Remove insecure RUNPATH '$ORIGIN/../lib' as reported by namcap
  chrpath -d output/usr/bin/mongos

  # Keep historical Arch dbPath
  sed -i 's|dbPath: /var/lib/mongo$|dbPath: /var/lib/mongodb|' output/etc/mongod.conf

  # Keep historical Arch conf file name
  sed -i 's|/etc/mongod.conf|/etc/mongodb.conf|' output/lib/systemd/system/mongod.service

  # Keep historical Arch user name (no need for separate daemon group name)
  sed -i 's/User=mongod$/User=mongodb/' output/lib/systemd/system/mongod.service
  sed -i 's/Group=mongod$/Group=mongodb/' output/lib/systemd/system/mongod.service

  # Avoid legacy PID filepath
  sed -i 's|/var/run/|/var/|' output/lib/systemd/system/mongod.service

  # Remove sysconfig file, used by upstream's init.d script not used on Arch
  sed -i '/^EnvironmentFile=/d' output/lib/systemd/system/mongod.service

  # Make systemd wait as long as it takes for MongoDB to start
  # If MongoDB needs a long time to start, prevent systemd from restarting it every 90 seconds
  # See: https://jira.mongodb.org/browse/SERVER-38086
  sed -i 's/\[Service]/[Service]\nTimeoutStartSec=infinity/' output/lib/systemd/system/mongod.service
}

package() {
  install -Dm644 output/etc/mongod.conf "$pkgdir/etc/mongodb.conf"
  install -Dm644 output/lib/systemd/system/mongod.service "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 output/usr/share/man/man1/* -t "$pkgdir/usr/share/man/man1"
  install -Dm644 mongodb.sysusers "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 mongodb.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
