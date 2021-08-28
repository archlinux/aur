# Maintainer: Pavers_Career <pavers_career_0d@icloud.com>

pkgname=gerbera-mysql
pkgver=1.9.1
_pkgbase=gerbera
pkgrel=1
pkgdesc="UPnP Media Server (Based on MediaTomb) with MySQL backend"
arch=(x86_64)
url="https://github.com/gerbera/gerbera"
license=('GPL2')
depends=('taglib' 'curl' 'libmariadbclient' 'file' 'gcc-libs' 'libupnp' 'duktape' 'libexif' 'fmt' 'pugixml' 'spdlog' 'ffmpeg' 'ffmpegthumbnailer' 'libmatroska')
optdepends=('sqlite')
makedepends=('cmake')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=("$_pkgbase")
install=gerbera.install
options=('emptydirs')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/gerbera/gerbera/archive/v$pkgver.tar.gz"
	gerbera.sysusers
	gerbera.tmpfiles)
sha256sums=('5d323c6cb4150e3454b8c6e0012f41648441799ba44cb59436b124b54d3fc82b'
            '0b55a4e1886f7aad0528446658433327815fd3f4d06e260518423f86dbe32dcc'
            '452f5d4b5661e0262cb4a48d62a54f5f26d53c6d3aebf502cde072214a8b30d8')

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_AVCODEC=1 -DWITH_FFMPEGTHUMBNAILER=1 -DWITH_MYSQL=1 .
	make
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make DESTDIR="${pkgdir}/" install

	install -dm0755 "${pkgdir}"/var/lib/gerbera
	install -dm0755 "${pkgdir}"/etc/gerbera
	install -Dm0644 "${srcdir}/${_pkgbase}".tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgbase}.conf
	install -Dm0644 "${srcdir}/${_pkgbase}".sysusers "${pkgdir}"/usr/lib/sysusers.d/gerbera.conf
}
