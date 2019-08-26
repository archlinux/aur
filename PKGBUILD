# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname="mongodb-bin-4.0"
pkgver=4.0.12
basever=4.0
pkgrel=2
pkgdesc='A high-performance, open source, schema-free document-oriented database'
arch=("x86_64")
url='https://www.mongodb.com/'
license=("SSPLv1")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-bin")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
source=("https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb"
        "https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
        "https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
        "mongodb.service"
        "mongodb.conf"
        "mongodb.sysusers"
        "mongodb.tmpfiles"
        "LICENSE")

sha512sums=('31c5e50ff4992b07c50ee958974566d3d231b257cff5f6e7bc3722024a328ec3c36d358d1c503037e5d26b1e282868dfdceaefed9b1e11c6aabe65695231feeb'
            '12e1cb94dede190ba83e90b119fdad8eec77d00043ed4f3c18daf7dd5b0d8309b382ab5f710f2ae797cb4c2da365871e79bc3d07cfed0d226d76be403ca2a2f3'
            '590a7dc0a12cbefb4618328be627fa7ba736b6a5b0813784a62c34ba8ea1e586317a1fbe7f9c3b9901e768ce3c6a09c8e3cfe0f639aeea936908c0130af92662'
            '177251404b2e818ae2b546fe8b13cb76e348c99e85c7bef22a04b0f07b600fd515a309ede50214f4198594388a6d2b31f46e945b9dae84aabb4dfa13b1123bb9'
            '05dead727d3ea5fe8af1a3c3888693f6b3e2b8cb7f197a5d793352e10d2c524e96c9a5c55ad2e88c1114643a9612ec0b26a2574b48a5260a9b51ec8941461f1c'
            '889425b864c58a767aa5865c0ce9817361ad99fec78050fa600f14eaef5a56ce0bc41a03878233e99f4862596a94dafcfebebecd4d57443b742117b873ab813d'
            'a931c401792f4e7928e4778d91626c1ecc3e97e5728549b170c050de487b2e5234747b0ee2d5acc3d63b798716758c17e30914dcaa9a92ac386db39f8a45a05c'
            '05cc1d1ae1af4fd0f51dcf1a5fca9ee8124306eb1a5a4f3c9b17ec7376e9b58cfb38de97c3d82b549f48113f9a50cf98e1e25898f430ce23e6e884efac7deda3')

backup=("etc/mongodb.conf")

prepare() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #mongos extracted
  ar x mongodb-org-server_${pkgver}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #server extracted
  ar x mongodb-org-shell_${pkgver}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #shell extracted
}

package() {
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r "${srcdir}/output/usr/bin" "${pkgdir}/usr/"
  cp -r "${srcdir}/output/usr/share/man/man1" "${pkgdir}/usr/share/man/"
  install -Dm644 "${srcdir}/mongodb.conf" "${pkgdir}/etc/mongodb.conf"
  install -Dm644 "${srcdir}/mongodb.service" "${pkgdir}/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "${srcdir}/mongodb.sysusers" "${pkgdir}/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "${srcdir}/mongodb.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
