# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname="mongodb-bin-4.0"
pkgver=4.0.24
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

b2sums=('3aa945d5c50b89e1724c2d1c4b705d444fd7d987af103d32c8d41511a9e7f0236c757c48750ada34414d0c966ad1b77b751293c74d84fa16e2c463cdf09c4652'
        '65f5d9032a2280102bba204c4ea68ac4f91d49ab5246eafcbfad18d0adb43a1777589832d936b65bd1ad8751f3cb64390858a147fd2598b9041334640f6a9016'
        '336ba7e980088bc7def7b1da5cdbccf93606a12f983bfcbc8143769a637dd3f3fe71a89368d6d6b40308a1293cf524909cc8644d0e59a52ac0f983b1d3620fa5'
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
