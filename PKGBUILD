#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaelff at gnome dot org>

pkgname="mongodb-bin"
pkgver="4.4.6"
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
sha256sums=('f2a79c7fcd75253ab1cb888541a0c0678bf3bb78700c79996e24a678f1e42850'
            '834f25ca1f53b459d02af3c0e89e4dda1b83bdd43ef5a9ea5ab2095819894a42'
            '47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b'
            '51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac'
            '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')
sha256sums_x86_64=('926058d8266cc9f2d8fce9a5b78cc6b2f6b315f337c4f9c232e5b8899d245680'
                   '9496d2a3ee90ae14fa2c9d7787ed24d6a4d810c16ebcc0a9629338362e8f07f7'
                   '50d549e0b506856e4a74451e57033055d6bcb950db9207318554f54cfb2bdad0')
sha256sums_aarch64=('039cc3808901d5856b0b05a0be94379b7bd683ef0c848a935c659796b650fc3f'
                    '7b8523e05f8dadcfbc6b2ff9401413162fc960206d218aebee35cfbd9acf9db7'
                    'a4131bbc3c6d350dcfcd53a016c3bc29aa0cd80d63d663ee0a8a374558af704f')

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
