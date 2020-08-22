# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname="mongodb-bin-4.0"
pkgver=4.0.20
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

b2sums=('964d65f107c5c8171b016fa6fbff00d813a9294173a78e3ef11c0eaef24c10fecc127c977c9c3194a98b149ae40e6a4f9b5f8d3d72b20208d3c8eb1bb4cce38f'
        '02dee79787dfe2c82d684da2f5c95f48857fbea2aa409a4d96070ee9d7af605404edf788ca20ca033fc08eaa754fb18f1594211c1e54e293b27dbd378a7ef005'
        'ba1b54ffd3374a24b141373603d55785ecc65bdeeea89a90b9f975d61cb3ae3ff6739beea72445bc042ccd6b21793397045fc3f29d11e6932d9b3779926a8cb3'
        'ea55bb2f08066d7399e9e66f981f86395f6a177faa198c66f93ea2965ea80d61c170336a4f49fc7f1f855d3abd5e7cf3862d58a2be4a7708c0582fb4ff80b255'
        '6187573d7ac6da911030b215ef98173f4317d3f056ae9a2dfe7ce22d4d329355f49d373c253949048ad7a20d54750f0df95ade83c50bba0af5242b41cb8d40a9'
        'c7f301e1ac6856ec54bdbc73c6d4b212816c3b058297f30dce1619889aee7a5d99f7c46868bb47dacb70a024be948d7350bb7d2be0e7be4257957b2ad75a93ab'
        '2f435b6a7bb2fc6efc8f42cfc9b36dc0eccb2230ae79cad3fcbe93f1ed12e7eb27066c73a1a0f1ebfdadc23f2a51d43468bfd17ba0d9b19cd3cbd75b68db55b1'
        'f9deb8582f496190bf815082fb65f1b875ffd1a2b782a8fa6a24f39df5eacb9e2206d4ffe5bd09d7c2d3e85f2519387c45f1b10b21b9c7d50666ee053752287f')

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
