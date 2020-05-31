#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-bin"
pkgver="4.2.7"
basever="4.2"
pkgrel="1"
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64" "aarch64")
url="https://www.mongodb.com/"
license=("SSPLv1")
depends_aarch64=("libcurl-openssl-1.0")
provides=("mongodb=$pkgver")
conflicts=("mongodb")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
source_x86_64=(
    mongodb-org-shell_${pkgver}_x86_64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb"
    mongodb-org-server_${pkgver}_x86_64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
    mongodb-org-mongos_${pkgver}_x86_64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
    "mongodb_x86_64.service"
    "mongodb.conf"
    "mongodb.sysusers"
    "mongodb.tmpfiles"
    "LICENSE")

source_aarch64=(
    mongodb-org-shell_${pkgver}_aarch64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-arm64/mongodb-org-shell_${pkgver}_arm64.deb"
    mongodb-org-server_${pkgver}_aarch64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-arm64/mongodb-org-server_${pkgver}_arm64.deb"
    mongodb-org-mongos_${pkgver}_aarch64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-arm64/mongodb-org-mongos_${pkgver}_arm64.deb"
    "mongodb_aarch64.service"
    "mongodb.conf"
    "mongodb.sysusers"
    "mongodb.tmpfiles"
    "LICENSE")

sha256sums_x86_64=("1751c3c412cfcec501dce519827a1be1b1d85210f1f9340eedd135b031a89cd1"
                   "511a7f9edc4725c6941e5bd49438541284db844b44e2aacb3a4949945e71b30d"
                   "24e903c07f82e5781240352f42902c33b7fd333c807787470708a4cfb8cdfa72"
                   "19f55ab28652b3817e98fc3f15cc2f6f3255a5e1dfd7b0d5a27c9ba22fd2703e"
                   "f2a79c7fcd75253ab1cb888541a0c0678bf3bb78700c79996e24a678f1e42850"
                   "47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b"
                   "51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac"
                   "09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27")

sha256sums_aarch64=("2963c0ac26523c37d8aa744221c91bb994a16969550f0960655723fb99a07bdb"
                    "c725f7fc317d0715655fda2b75c457cf348bd305be166b2e2a7ec45e79a83bca"
                    "5d2b81b0ae7c6fe59fb880503332a4ff4f1d5174a7061d089b75317e17d4a4ac"
                    "965a166f1aabd5f6b06c0a6c0939920ec6aad87407b695c61ce0f2a8c450b680"
                    "f2a79c7fcd75253ab1cb888541a0c0678bf3bb78700c79996e24a678f1e42850"
                    "47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b"
                    "51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac"
                    "09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27")

backup=("etc/mongodb.conf")

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #mongos extracted
  ar x mongodb-org-server_${pkgver}_${CARCH}.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #server extracted
  ar x mongodb-org-shell_${pkgver}_${CARCH}.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #shell extracted
}

package() {
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "$srcdir/output/usr/bin" "$pkgdir/usr/"
  cp -r "$srcdir/output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "$srcdir/mongodb_${CARCH}.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "$srcdir/mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

