#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaelff at gnome dot org>

pkgname="mongodb44-bin"
pkgver="4.4.14"
_basever="4.4"
_basedist="focal"
pkgrel="1"
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64" "aarch64")
url="https://www.mongodb.com/"
license=("custom:SSPLv1")
depends=("curl")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
provides=("mongodb=$pkgver")
conflicts=("mongodb")
backup=("etc/mongodb.conf")

_repo_url=https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse
source=(
    "mongodb.conf"
    "mongodb.service"
    "mongodb.sysusers"
    "mongodb.tmpfiles"
    "LICENSE")
source_x86_64=(
    mongodb-org-shell_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb"
    mongodb-org-server_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
    mongodb-org-mongos_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb")
source_aarch64=(
    mongodb-org-shell_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-shell_${pkgver}_arm64.deb"
    mongodb-org-server_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-server_${pkgver}_arm64.deb"
    mongodb-org-mongos_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-mongos_${pkgver}_arm64.deb")
noextract=(
    mongodb-org-shell_${pkgver}_${CARCH}.deb
    mongodb-org-server_${pkgver}_${CARCH}.deb
    mongodb-org-mongos_${pkgver}_${CARCH}.deb)
sha256sums=('16db77050441afb964b1899f82466d53a0677c9c4802cd98b967d3cc2efe094f'
            'de4f6770c45bc5418883659c479783c0184a6057df1c405a7933637984f82f0a'
            '47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b'
            '51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac'
            '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')
sha256sums_x86_64=('0d0c26666cc90d120186386b7985feb8c11654b350afc0e4787f8ea2652edc0f'
                   'fdc80ece952c3a3eb19ba873b1ef78d9f5533ef83997cc534951dfae413d79f2'
                   '47d930166ae80033963490fbf42d7a2e5271f5df90d8daa6d3d2950ea5c4b4d6')
sha256sums_aarch64=('cc4cae8e0e5ec422b1eff883b1eeaa3da9e342cf435a20ae26dad99fef4c2bb3'
                    '06c3abbdae0d0441013157f2bf722794a534679dc5eb272406c33b631bed959d'
                    'abb1f57a14d1f569cc5117a465c217e76a0cc568edae39f576d462576bc8c38e')

prepare() {
  mkdir -p output
  bsdtar -O -xf mongodb-org-shell_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf -  #mongo extracted
  bsdtar -O -xf mongodb-org-server_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #server extracted
  bsdtar -O -xf mongodb-org-mongos_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #mongos extracted
}

package() {
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "output/usr/bin" "$pkgdir/usr/"
  cp -r "output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  install -Dm644 "mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "mongodb.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
