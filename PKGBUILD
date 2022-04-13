#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaelff at gnome dot org>

pkgname="mongodb-bin"
pkgver="5.0.7"
_basever="5.0"
_basedist="focal"
pkgrel="1"
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64" "aarch64")
url="https://www.mongodb.com/"
license=("custom:SSPLv1" "Apache")
depends=("curl")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities."
	    "mongosh-bin: An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-shell-bin")
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
)
source_aarch64=(
    mongodb-org-shell_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-shell_${pkgver}_arm64.deb"
    mongodb-org-server_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-server_${pkgver}_arm64.deb"
    mongodb-org-mongos_${pkgver}_aarch64.deb::"${_repo_url}/binary-arm64/mongodb-org-mongos_${pkgver}_arm64.deb"
)
noextract=(
    mongodb-org-shell_${pkgver}_${CARCH}.deb
    mongodb-org-server_${pkgver}_${CARCH}.deb
    mongodb-org-mongos_${pkgver}_${CARCH}.deb
)
sha256sums=('f2a79c7fcd75253ab1cb888541a0c0678bf3bb78700c79996e24a678f1e42850'
            'de4f6770c45bc5418883659c479783c0184a6057df1c405a7933637984f82f0a'
            '47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b'
            '51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac'
            '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')
sha256sums_x86_64=('31bafc979c87ada9ac6300c9df4db44a8fc07e714905e7eba18ccdafc35b3e12'
                   'f3821e8efa4adfefc8b4125f46c3843a02ae798d5320eea2097e16d877e9e8c2'
                   '58fefd9ade1b1c1bab14732e6e9c693bd71c84807a757c78a4dbfab57926db87')
sha256sums_aarch64=('2492bb9543478657e39a3e34c7363f0d8dea17ac96052512e53d45416b899fe2'
                    '81f446627616bc8bc7084b9e597686bf1b780036f19348d2e212b6031c445e56'
                    '33705dddca16ccc3a438385691df8f9b49ad4b50eb38dbab672baa7bf2c0951b')
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
