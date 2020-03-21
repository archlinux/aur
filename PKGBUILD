#Maintainer: Indhi Rousseau <contact at thekinrar dot fr>
#Maintainer of mongodb-bin-3.6: Mohammad Taha Jahangir (taha_jahangir)
#Maintainer of mongodb-bin: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-bin-3.2"
pkgver="3.2.22"
basever="3.2"
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

sha256sums=("630d0bbf8d2cda03022a330260bc5d79714b6d65abbf154d5a1d5ff262cf584e"
            "589d57d5fc68e22b6a92abba2d0dfec27b69894e2832dcf47db73d48851c48ef"
            "f9051b388164b35aa4d1873cb7af30eb50f7be2d461ccf0e32b84acc7d2819f6"
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
