#Maintainer: Mohammad Taha Jahangir (taha_jahangir)
#Maintainer of mongodb-bin: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-bin-3.6"
pkgver="3.6.12"
basever="3.6"
pkgrel="1"
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64")
url="https://www.mongodb.com/"
license=("SSPLv1")
provides=("mongodb=$pkgver")
conflicts=("mongodb" "mongodb-bin")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities.")
source=(
    "https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/${basever}/main/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb"
    "https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/${basever}/main/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb"
    "https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/${basever}/main/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb"
    "mongodb.service"
    "mongodb.conf"
    "mongodb.sysusers"
    "mongodb.tmpfiles"
    "LICENSE")

sha256sums=("4e6e575d850d0f0f238c8fb159c552ce107f895f4049c4fca05efd366545c490"
            "85da8f5a2a30a336212e3574f1fedd4fe8757b17e710fd53561f8ab1204ad3e3"
            "ce66b8e216ced21e7e5d2387209c6b14805cc755c87a9733e2a760ee8cd4c52b"
            "19f55ab28652b3817e98fc3f15cc2f6f3255a5e1dfd7b0d5a27c9ba22fd2703e"
            "8010ce728d657524cd76b5afda7ffbc1cc389642336b12b89cec5df2b09fc0e4"
            "47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b"
            "51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac"
            "09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27")

backup=("etc/mongodb.conf")

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #mongos extracted
  ar x mongodb-org-server_${pkgver}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #server extracted
  ar x mongodb-org-shell_${pkgver}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #shell extracted
}

package() {
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "$srcdir/output/usr/bin" "$pkgdir/usr/"
  cp -r "$srcdir/output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "$srcdir/mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
