# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=openvas-scanner
pkgver=23.20.1
pkgrel=2
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
        0001-fix-build.patch
        openvas-scanner.tmpfiles
        openvasd.service)
sha512sums=('90c29cc53a4b97e4575ebb12ad34cb6a21f2d000d151c568ce345f3bc934d32603cfab633e9f34a93094fa51d4f4c840bf6224bb86222c0a8256d7d4b7a0535b'
            'SKIP'
            'ca6b7cfb39c042c6c0076747164dff271482af4a1c172051412c09746b678824123d74e71b5984515ab3b8ea4316d6872f6565cfb18fc8b92533e6afefd276c7'
            'c87d7890698368a6b8d569d9af73712676d0e0061de8e058cc6c7f609da1def99ebbf9b11d35d1dd0234538dbb07987ff18bbf186928ea39c33441f231eb8751'
            '476e0aaeb916959b93082bf2529774ff46db46e6e699c34ea0ac246c461d554c87d15c25a2bc6565c06f0cd39df5dd14609d99777608c1c8afb824b0a6de99ae')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/-Werror/d' CMakeLists.txt

  cd rust
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Add patch for build issue with GCC15
  patch -Np2 -i "${srcdir}"/0001-fix-build.patch
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

  # Install unit file
  install -Dm 644 openvasd.service -t "${pkgdir}"/usr/lib/systemd/system/

  # Install doc (should be possible via cmake)
  install -Dm644 build/doc/generated/html/* -t "${pkgdir}/usr/share/doc/${pkgname}/html/"

  # Install redis config
  install -Dm644 "${pkgname}-${pkgver}"/config/redis-openvas.conf -t "${pkgdir}/etc/redis/"
}
