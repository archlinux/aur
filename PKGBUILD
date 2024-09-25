# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gvmd
pkgver=23.10.0
pkgrel=4
pkgdesc='Vulnerability manager Daemon'
arch=('x86_64')
url="https://github.com/greenbone/gvmd"
license=('AGPL-3.0-only')
depends=('cjson' 'gvm-libs' 'libbsd' 'libical' 'python' 'gnutls' 'postgresql' 'libxslt')
makedepends=('cmake' 'doxygen' 'xmltoman' 'libxslt')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gvmd/archive/v${pkgver}.tar.gz"
        "archlinux_postgres_headers.patch"
        "0001-fix-unit-path.patch"
        "gvmd.install")
sha512sums=('9fc2999babbac331048cd37a92862c7aba861aeb2228ca5ff7abab2889cc89f9ce4ee08217df7af05c629e5454ddf8abfc786499747ce5c553ad0fcdebac7ff0'
            'ec2cbedf87bfd8cc1abfc6be9c566b6d2e6f7b1f902f5596d496b01faf208c9921b502d77ec9281ef3c0d03462f2d49bb973f4f9216a106116cd824e938951c2'
            '3d86dfd288dcf1ab91454c0fefcb33e2bf9cdc20638804fd524ebee5ff5783a21c67e9d6b5b575a2d009c2f97828d3866513b00d02d18665ecf3f1ca91c99c41'
            'b57434d05d3191e460a15ae0e54c3a56f229ffabc3d1b13f395805eb8259ea225379cedaf1554938dd3e442801cd39149707a49ea589c7ca249ff6ffd2340c43')
install=gvmd.install


prepare() {
	cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/archlinux_postgres_headers.patch"
	patch -Np2 -i "${srcdir}"/0001-fix-unit-path.patch
}

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
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

  install -d $pkgdir/var/lib/gvm/gvmd
}
