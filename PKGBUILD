#Contributor: Viktor Semykin thesame.ml@gmail.com
#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaelff at gnome dot org>

pkgname="mongodb34-bin"
pkgver="3.4.24"
_basever="3.4"
_basedist="xenial"
pkgrel="2"
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64" "aarch64")
url="https://www.mongodb.com/"
license=("custom:SSPLv1" "Apache")
depends=(curl openssl-1.0)
makedepends=(chrpath)
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-shell-bin")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-tools")
backup=("etc/mongodb.conf")

_repo_url=https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse
source=(
    mongodb.sysusers
    mongodb.tmpfiles
    LICENSE
)
source_x86_64=(
    mongodb-org-shell_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb"
    mongodb-org-server_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
    mongodb-org-mongos_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
)
source_aarch64=(
    mongodb-org-shell_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-shell_${pkgver}_arm64.deb"
    mongodb-org-server_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-server_${pkgver}_arm64.deb"
    mongodb-org-mongos_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-or	g-mongos_${pkgver}_arm64.deb"
)
noextract=(
    mongodb-org-shell_${pkgver}_${CARCH}.deb
    mongodb-org-server_${pkgver}_${CARCH}.deb
    mongodb-org-mongos_${pkgver}_${CARCH}.deb
)
sha256sums=('47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b'
            '51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac'
            '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')
sha256sums_x86_64=('baed0c83497feb2dc57590ad5a5da3cedd871699080fa683d593dbad5ad72bd9'
                   '7926b130a5d5f12c012b8c3af21a385860cf1d483c30df5a6f71fbcdeca6c253'
                   'ef905f6cbc3d5291edf77f07e2ea122a61b069c7fae093680ada6a3dd2e563f0')
sha256sums_aarch64=('18c983c1e8f5281ae7aa8336cc285529d102c0a2a7962105124327a36511d783'
                    'cc3cb60922788a148b5f6e74fd7b054335a5bf4dc46d0452c0252f78c54c5034'
                    '96699640cb19a17b77c182123d5c58424e45d50490555bb2c8cc5fbe3a2ec56d')

prepare() {
  mkdir -p output
  bsdtar -O -xf mongodb-org-shell_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf -  #mongo extracted
  bsdtar -O -xf mongodb-org-server_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #server extracted
  bsdtar -O -xf mongodb-org-mongos_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #mongos extracted

  # Remove insecure RUNPATH '$ORIGIN/../lib' as reported by namcap
  chrpath -d output/usr/bin/mongod
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
