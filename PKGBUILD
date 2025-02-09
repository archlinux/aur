# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=openvas-scanner
pkgver=23.15.3
pkgrel=6
pkgdesc='Vulnerability scanning Daemon'
arch=('x86_64')
url="https://github.com/greenbone/openvas-scanner"
license=('GPL-2.0-only')
depends=('gvm-libs' 'json-glib' 'libbsd' 'libgcrypt' 'net-snmp' 'redis' 'rsync')
makedepends=('cmake' 'doxygen' 'cargo' 'inetutils' 'graphviz' 'pandoc-cli')
optdepends=('greenbone-feed-sync: scripts for downloading updated feed informations')
groups=('greenbone-vulnerability-manager')
install=openvas.install
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz.asc
        openvas-scanner.tmpfiles)
sha512sums=('e60e854f6dce9fc399abba190937ba23388a6e1f0b4fb31b2da5ce676a087868ef5159641a8d506cdcda140450d0c07430cddbc7e8486dc834caf84a6e95695b'
            'SKIP'
            'c87d7890698368a6b8d569d9af73712676d0e0061de8e058cc6c7f609da1def99ebbf9b11d35d1dd0234538dbb07987ff18bbf186928ea39c33441f231eb8751')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/-Werror/d' CMakeLists.txt

  cd rust
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSBINDIR=/usr/bin \
    -DLIBDIR=/usr/lib \
    -DSYSCONFDIR=/etc \
    -DLOCALSTATEDIR=/var \
    -DOPENVAS_DATA_DIR=/var/lib/openvas \
    -DOPENVAS_FEED_LOCK_PATH=/var/lib/openvas/feed-update.lock \
    -DOPENVAS_RUN_DIR=/run/ospd \
    -DOPENVAS_NVT_DIR=/var/lib/openvas/plugins \
    -DBUILD_WITH_NETSNMP=True
  make -C build
  make -C build doxygen
  make -C build manual

  # Build openvasd and scannerctl
  cd ${pkgname}-${pkgver}/rust
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  make DESTDIR="${pkgdir}/" -C build install

  find ${pkgname}-${pkgver}/rust/target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf

  # Install doc (should be possible via cmake)
  install -Dm644 build/doc/generated/html/* -t "${pkgdir}/usr/share/doc/${pkgname}/html/"

  # Install redis config
  install -Dm644 "${pkgname}-${pkgver}"/config/redis-openvas.conf -t "${pkgdir}/etc/redis/"
}
