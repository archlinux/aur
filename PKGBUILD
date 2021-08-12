#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaelff at gnome dot org>

pkgname="mongodb-bin"
pkgver="5.0.2"
_basever="5.0"
_basedist="focal"
_mshver="1.0.4"
pkgrel="1"
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64" "aarch64")
url="https://www.mongodb.com/"
license=("custom:SSPLv1" "Apache")
depends=("curl")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongosh-bin" "mongodb-shell-bin")
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
    mongodb-org-mongos_${pkgver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
    mongodb-mongosh_${_mshver}_x86_64.deb::"${_repo_url}/binary-amd64/mongodb-mongosh_${_mshver}_amd64.deb")
source_aarch64=(
    mongodb-org-shell_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-shell_${pkgver}_arm64.deb"
    mongodb-org-server_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-server_${pkgver}_arm64.deb"
    mongodb-org-mongos_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-mongos_${pkgver}_arm64.deb"
    mongodb-mongosh_${_mshver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-mongosh_${_mshver}_arm64.deb")
noextract=(
    mongodb-org-shell_${pkgver}_${CARCH}.deb
    mongodb-org-server_${pkgver}_${CARCH}.deb
    mongodb-org-mongos_${pkgver}_${CARCH}.deb
    mongodb-mongosh_${_mshver}_${CARCH}.deb)
sha256sums=('f2a79c7fcd75253ab1cb888541a0c0678bf3bb78700c79996e24a678f1e42850'
            'de4f6770c45bc5418883659c479783c0184a6057df1c405a7933637984f82f0a'
            '47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b'
            '51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac'
            '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')
sha256sums_x86_64=('30301479982eabf28aa56f444cf32ca9a54e8319fc03df69e6296cc6df682588'
                   'd29d26b73adefc90f6e9bf45c5876518fbcf559c207634947cd08586daaf678e'
                   'f7ea216f06c005b82911dc2314bb33e6d1e50362e1263c9ae09c0381a8a1cdc0'
                   '57d77e07c80c12f7a0c2c2e5d7041a682c162c25cab46496af0da624927a8913')
sha256sums_aarch64=('6489eb006edbdef9a7c63cc9531f71d1eb493337ca34d5fb06c3a31fa16ee11f'
                    'f7ad3c972a4d456074898fee41859a4791f0737437c83f28f6b682ec31bd89cd'
                    '153c6dd802bb517c83fca0c7192a3ea7ed58d65aaba386b29c1dc63c017da58e'
                    'b20ec0e5d573a183da2fbc3c7b27a2149b9a104cd715832a71c2b6b31491b68d')

prepare() {
  mkdir -p output
  bsdtar -O -xf mongodb-org-shell_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf -  #mongo extracted
  bsdtar -O -xf mongodb-org-server_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #server extracted
  bsdtar -O -xf mongodb-org-mongos_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf - #mongos extracted
  bsdtar -O -xf mongodb-mongosh_${_mshver}_${CARCH}.deb data.tar.xz | bsdtar -C output -xJf -   #mongosh extracted
}

package() {
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "output/usr/bin" "$pkgdir/usr/"
  # TODO:mongocrypt-mongosh is missing libsasl2.so.2 soname, not available in Arch
  #cp -r "output/usr/libexec"/* "$pkgdir/usr/bin/"
  cp -r "output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  install -Dm644 "mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "mongodb.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
