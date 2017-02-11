# Maintainer: John Ramsden <streblo [at] ramsdenj [dot] ca>
pkgname=znapzend
pkgver=0.17.0
pkgrel=1
pkgdesc="ZnapZend is a ZFS centric backup tool. It relies on snapshot, send and receive todo its work. It has the built-in ability to manage both local snapshots as well as remote copies by thining them out as time progresses."
arch=('any')
url="http://www.znapzend.org/"
license=('GPL')
depends=('perl' 'zfs')
source=("https://github.com/oetiker/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('bf0ed9bb2ffea6cbcf4730e899e065fc')

prepare() {
	cd "${pkgname}-${pkgver}"
	sed -i 's:ExecStart=/usr/local/bin/znapzend:ExecStart=/usr/bin/znapzend:' "init/znapzend.service"
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix="/opt/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/etc/systemd/system" "${pkgdir}/usr/share/man/man1"
  ln -s "/opt/${pkgname}-${pkgver}/bin/znapzend" "${pkgdir}/usr/bin/znapzend"
	ln -s "/opt/${pkgname}-${pkgver}/bin/znapzendzetup" "${pkgdir}/usr/bin/znapzendzetup"
	ln -s "/opt/${pkgname}-${pkgver}/bin/znapzendztatz" "${pkgdir}/usr/bin/znapzendztatz"
	install -m 644 "init/znapzend.service" "${pkgdir}/etc/systemd/system/znapzend.service"
	install -m 644 "man/znapzend.1" "man/znapzendzetup.1" "man/znapzendztatz.1" "${pkgdir}/usr/share/man/man1"
}
