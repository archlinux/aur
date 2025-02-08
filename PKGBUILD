# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gvmd
pkgver=25.0.0
pkgrel=2
pkgdesc='Vulnerability manager Daemon'
arch=('x86_64')
url="https://github.com/greenbone/gvmd"
license=('AGPL-3.0-only')
depends=('ospd-openvas' 'cjson' 'gvm-libs' 'libbsd' 'libical' 'pg-gvm' 'python' 'gnutls' 'postgresql' 'libxslt')
makedepends=('cmake' 'doxygen' 'xmltoman' 'libxslt')
optdepends=('logrotate: for rotating logs'
            'greenbone-feed-sync: scripts for downloading updated feed informations')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc
        "archlinux_postgres_headers.patch"
        "gvmd.tmpfiles")
sha512sums=('697c35eec47fcb938b7f900f662e8b0ba8479154f64526b6672b90c515354d151041cce818f3462845a48172846bb37b488843aaa36f3dc32a8943ce032c3705'
            'SKIP'
            'ec2cbedf87bfd8cc1abfc6be9c566b6d2e6f7b1f902f5596d496b01faf208c9921b502d77ec9281ef3c0d03462f2d49bb973f4f9216a106116cd824e938951c2'
            'f34f37df26faa8ea80574d9311c12fe37747ceda1b98cdf7dfc97451b840a01d5352af1412667f40e51f80bc314a799cad1d13dae7224580f2c4d97b8d5b78e3')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
	cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/archlinux_postgres_headers.patch"
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
    -DGVM_FEED_LOCK_PATH=/run/gvm/feed-update.lock \
    -DGVM_RUN_DIR=/run/gvm/
  make -C build
}

package() {
  make DESTDIR="${pkgdir}/" -C build install

  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
