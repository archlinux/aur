# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname="mongodb-bin-4.0"
pkgver="4.0.12"
basever="4.0"
pkgrel="1"
pkgdesc='A high-performance, open source, schema-free document-oriented database'
arch=("x86_64")
url='https://www.mongodb.com/'
license=("SSPLv1")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-bin")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
source=("https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/${basever}/main/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb"
        "https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/${basever}/main/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
        "https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/${basever}/main/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
        "mongodb.service"
        "mongodb.conf"
        "mongodb.sysusers"
        "mongodb.tmpfiles"
        "LICENSE")

sha512sums=('a0f7dd30cfd755b4b4a7557d696ddd06af5eba35f9e056eb65922f3dda1d1991c8822972abe419be98161c448f36745ec8915ef592c3a29863baa0730099af34'
            'c3e7363642b6a6b0957408204eca1339c6c67a5b7f368a2c7e47bc685b3adfcfdf86e5f1c556af98dcd8d6bece502340c5c9fa54a6d8a858146a416a2c4319ac'
            'eafdec8c3ac23fda52a584888cef0ca27e09661537682b4975618ff00abc8396e2363be60667d4ab9269d06ba1c42d3c3e939028ac12f4971c6a84931cd9496f'
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
