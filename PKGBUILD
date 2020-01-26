# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname="mongodb-bin-4.0"
pkgver=4.0.15
pkgrel=1
pkgdesc='A high-performance, open source, schema-free document-oriented database'
arch=("x86_64")
url='https://www.mongodb.com/'
license=('custom')
depends=('curl')
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-bin")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
source=("https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${pkgver%.*}/multiverse/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb"
        "https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${pkgver%.*}/multiverse/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
        "https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${pkgver%.*}/multiverse/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
        mongodb.service
        mongodb.conf
        mongodb.sysusers
        mongodb.tmpfiles
        LICENSE)

sha512sums=('48e13f37db241ebc72746020093d8c60d025b31eb43e5643d339834582e024349b9b11354f94a744b14ea1d2781db578a208a2a49ce16ab473f5fc543811090b'
            '431b25c64268c979a3984fc34dc7f50836bacf2fb90525df841c03b5bc7c1f1e019d32995e701ebdca596fcc0b9dbd53feadb56ea19a9f8a9e46c78168ac6013'
            '665588101717b312147bf038cdc9498f7761151644559837cc1b557dff0a30d138127fe495aa7fbe317568e6bf8056aa2b4d26f36fa684306cbbd96825681660'
            '177251404b2e818ae2b546fe8b13cb76e348c99e85c7bef22a04b0f07b600fd515a309ede50214f4198594388a6d2b31f46e945b9dae84aabb4dfa13b1123bb9'
            '05dead727d3ea5fe8af1a3c3888693f6b3e2b8cb7f197a5d793352e10d2c524e96c9a5c55ad2e88c1114643a9612ec0b26a2574b48a5260a9b51ec8941461f1c'
            '889425b864c58a767aa5865c0ce9817361ad99fec78050fa600f14eaef5a56ce0bc41a03878233e99f4862596a94dafcfebebecd4d57443b742117b873ab813d'
            'a931c401792f4e7928e4778d91626c1ecc3e97e5728549b170c050de487b2e5234747b0ee2d5acc3d63b798716758c17e30914dcaa9a92ac386db39f8a45a05c'
            '05cc1d1ae1af4fd0f51dcf1a5fca9ee8124306eb1a5a4f3c9b17ec7376e9b58cfb38de97c3d82b549f48113f9a50cf98e1e25898f430ce23e6e884efac7deda3')

backup=("etc/mongodb.conf")

prepare() {
  mkdir -p output
  tar -xvf data.tar.xz -C output #mongos extracted
  ar x mongodb-org-server_${pkgver}_amd64.deb
  tar -xvf data.tar.xz -C output #server extracted
  ar x mongodb-org-shell_${pkgver}_amd64.deb
  tar -xvf data.tar.xz -C output #shell extracted
}

package() {
  install -dm755 "${pkgdir}"/usr/share/man
  cp -r output/usr/bin "${pkgdir}"/usr/
  cp -r output/usr/share/man/man1 "${pkgdir}"/usr/share/man/
  install -Dm644 mongodb.conf "${pkgdir}"/etc/mongodb.conf
  install -Dm644 mongodb.service "${pkgdir}"/usr/lib/systemd/system/mongodb.service
  install -Dm644 mongodb.sysusers "${pkgdir}"/usr/lib/sysusers.d/mongodb.conf
  install -Dm644 mongodb.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/mongodb.conf
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
