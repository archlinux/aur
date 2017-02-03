# Maintainer: Kevin Alberts <kevin@kevinalberts.nl>

pkgname=fastonosql
pkgver=1.5.0
pkgrel=1
pkgdesc="Cross-platform open source Redis, Memcached, SSDB, LevelDB, RocksDB, UnQLite, LMDB, UpscaleDB GUI management tool."
arch=('x86_64')
license=('GPL3')
url="http://fastonosql.com"
options=('!strip' '!upx')

source=("http://fastonosql.com/downloads/linux/fastonosql-1.5.0-x86_64.deb")
sha256sums=('baaabd4cc5c076c887a2c46100e54a54a042805047917d651c51d56699d3dd9b')

depends=("glibc>=2.12" "gcc-libs>=4.4.7")

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"

	# Link executable
	mkdir -p "${pkgdir}"/usr/bin
	ln -s /opt/fastonosql/bin/fastonosql.sh "${pkgdir}"/usr/bin/fastonosql

	# Create .desktop file
	mkdir -p "${pkgdir}"/usr/share/applications
	cat <<EOT >> "${pkgdir}"/usr/share/applications/fastonosql.desktop
[Desktop Entry]
Name=FastNoSQL
GenericName=NoSQL database client
Comment=GUI manager for NoSQL Databases
Icon=fastonosql
Exec=fastonosql
TryExec=fastonosql
Terminal=false
Type=Application
Categories=Development;Utility;

EOT

	install -D "${pkgdir}"/opt/fastonosql/share/icons/fastonosql.png "${pkgdir}"/usr/share/pixmaps/fastonosql.png

	for size in 22 24 32 48 64 128 256 512; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		convert "${pkgdir}"/opt/fastonosql/share/icons/fastonosql.png -resize $sizex$size "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/fastonosql.png"
	done

	chmod -R go-w "${pkgdir}"/usr

	# License
	install -D -m644 "${pkgdir}"/opt/fastonosql/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}