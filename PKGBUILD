#Maintainer: Arafat Zahan <kuasha420@gmail.com>
#Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="percona-server-mongodb-bin"
pkgver="4.4.3_5"
basever="4.4.3"
origpkgver="4.4.3-5"
basedist="focal"
pkgrel="1"
pkgdesc="A free, open source drop-in replacement for MongoDB Community Edition but with enterprise-grade functionality."
arch=("x86_64")
url="https://www.percona.com/software/mongodb/percona-server-for-mongodb/"
license=("SSPLv1")
depends_aarch64=("libcurl-openssl-1.0")
provides=("mongodb=$pkgver" "mongodb-tools=$pkgver")
conflicts=("mongodb" "mongodb-bin" "mongodb-tools" "mongodb-tools-bin")
source_x86_64=(
    percona-server-mongodb-shell_${origpkgver}.${basedist}_amd64.deb::"https://downloads.percona.com/downloads/percona-server-mongodb-LATEST/percona-server-mongodb-${origpkgver}/binary/debian/${basedist}/x86_64/percona-server-mongodb-shell_${origpkgver}.${basedist}_amd64.deb"
    percona-server-mongodb-tools_${origpkgver}.${basedist}_amd64.deb::"https://downloads.percona.com/downloads/percona-server-mongodb-LATEST/percona-server-mongodb-${origpkgver}/binary/debian/${basedist}/x86_64/percona-server-mongodb-tools_${origpkgver}.${basedist}_amd64.deb"
    percona-server-mongodb-server_${origpkgver}.${basedist}_amd64.deb::"https://downloads.percona.com/downloads/percona-server-mongodb-LATEST/percona-server-mongodb-${origpkgver}/binary/debian/${basedist}/x86_64/percona-server-mongodb-server_${origpkgver}.${basedist}_amd64.deb"
    percona-server-mongodb-mongos_${origpkgver}.${basedist}_amd64.deb::"https://downloads.percona.com/downloads/percona-server-mongodb-LATEST/percona-server-mongodb-${origpkgver}/binary/debian/${basedist}/x86_64/percona-server-mongodb-mongos_${origpkgver}.${basedist}_amd64.deb"
    "mongodb_x86_64.service"
    "mongodb.conf"
    "mongodb.sysusers"
    "mongodb.tmpfiles"
    "LICENSE")

sha256sums_x86_64=('c84bc699eec8c7ed326523f8dc81d699f7f4137bbdfcf5de8b22e23cc598d257'
                   'b3234289bc79e003d4b3cd13b033875b874704adf8de79b95cfaaf1153500173'
                   '8d8934c283f143b35c7d29f930d63f576737c704630a21496837cacbf330366d'
                   '21b0ae9cb4107ae7476fc7e91322ccee1b7442f638d94e64767215c18caccfe0'
                   '19f55ab28652b3817e98fc3f15cc2f6f3255a5e1dfd7b0d5a27c9ba22fd2703e'
                   'f2a79c7fcd75253ab1cb888541a0c0678bf3bb78700c79996e24a678f1e42850'
                   '47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b'
                   '51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac'
                   '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')

backup=("etc/mongodb.conf")

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #mongos extracted
  ar x percona-server-mongodb-server_${origpkgver}.${basedist}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #server extracted
  ar x percona-server-mongodb-shell_${origpkgver}.${basedist}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #shell extracted
  ar x percona-server-mongodb-tools_${origpkgver}.${basedist}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #tools extracted
}

package() {
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "$srcdir/output/usr/bin" "$pkgdir/usr/"
  cp -r "$srcdir/output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "$srcdir/mongodb_${CARCH}.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "$srcdir/mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/lib/libsasl2.so ${pkgdir}/usr/lib/libsasl2.so.2
}

