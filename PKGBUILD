# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gvmd
pkgver=26.7.0
pkgrel=1
pkgdesc='Vulnerability manager Daemon'
arch=('x86_64')
url="https://github.com/greenbone/gvmd"
license=('AGPL-3.0-only')
install=gvmd.install
depends=('ospd-openvas' 'cjson' 'gvm-libs' 'libbsd' 'libical' 'pg-gvm' 'python' 'gnutls' 'postgresql' 'libxslt')
makedepends=('cmake' 'doxygen' 'xmltoman' 'libxslt')
optdepends=('logrotate: for rotating logs'
            'greenbone-feed-sync: scripts for downloading updated feed informations')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc
        "archlinux_postgres_headers.patch"
        "gvmd.tmpfiles")
sha512sums=('5c1939ffe106832b4a47b18109133438aadf7e1f93ef0769c3e56c1c9d244e9aa834affb170b3e5fcf2c0f11887e32a955898efb80f2a9edbdec7931253deca1'
            'SKIP'
            'ec2cbedf87bfd8cc1abfc6be9c566b6d2e6f7b1f902f5596d496b01faf208c9921b502d77ec9281ef3c0d03462f2d49bb973f4f9216a106116cd824e938951c2'
            '6c95fadda6646288ea86c725fa9cbebb46a6b1c6249faeb56de563435fe01f7ef21e66a91b27cf820eab97a2aa2fa88dd4300e61279a896915d21d129039fa88')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # Greenbone Community Feed integrity key


prepare() {
	cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/archlinux_postgres_headers.patch"
}

build() {
  # Not compatible with C23
  CFLAGS+=' -std=gnu17'

  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSBINDIR=/usr/bin \
    -DLIBDIR=/usr/lib \
    -DSYSCONFDIR=/etc \
    -DLOCALSTATEDIR=/var \
    -DGVM_DATA_DIR=/var \
    -DOPENVAS_DEFAULT_SOCKET=/run/ospd/ospd-openvas.sock \
    -DGVM_FEED_LOCK_PATH=/var/lib/gvm/feed-update.lock \
    -DGVMD_RUN_DIR=/run/gvmd/
  make -C build
}

package() {
  make DESTDIR="${pkgdir}/" -C build install

  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
