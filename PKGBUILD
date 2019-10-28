# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname="mongodb-bin-4.0"
pkgver=4.0.13
basever=4.0
pkgrel=1
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

sha512sums=('bd5296656df376fb560ab34d7a1fe5ca5029d2d2c766167f8e44852d0dace9a318c6e294f980c837faf89b935242d73129c0cecf5bd2451cacdd82fd54db6a88'
            '93f4b3f6b23c176eb3b3963e0044da5cb0e24437b6b751c10aee7d437efb401cf0cda7a08c9d5a0719f09e8d86e96b9d7a16c8cd44bf77d60d5990c059a6022e'
            '1d31922babf0a734fff94b3337563d361b57f09ec689a4a822db0e9bc4d925011d8c4d513e30662a2280e36c8c4b95feb2ff5f2b6f756396a01f6fc6f6b1370c'
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
