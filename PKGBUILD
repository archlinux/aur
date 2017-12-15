# Maintainer: Kevin Alberts <kevin@kevinalberts.nl>

pkgname=fastonosql
pkgver=1.14.0
pkgrel=1
pkgdesc="Cross-platform open source Redis, Memcached, SSDB, LevelDB, RocksDB, UnQLite, LMDB, UpscaleDB GUI management tool."
arch=('x86_64')
license=('GPL3')
url="http://fastonosql.com"
options=('!strip' '!upx')

source=(
	"https://fastonosql.com/trial_users_downloads/linux/fastonosql-1.14.0-x86_64.deb"
	"fastonosql_22.png"
	"fastonosql_24.png"
	"fastonosql_32.png"
	"fastonosql_48.png"
	"fastonosql_64.png"
	"fastonosql_128.png"
	"fastonosql_256.png"
	"fastonosql_512.png"
	)
sha256sums=(
	'ed8be65da7e0b7cfac47100787c7218e2988744a214d8bc160d5818edb5afb4b'
	'b131877859b40e6b0844bdef09c24e485e242f6e6ad87584bddf5ad2d036ff86'
	'6b15df2d57033e73d121eb1e7b6d9803d07c933aa8b3f4ca73f4bc361fd28647'
	'4e92352b348651eee0b2e02c7c69b8661dc1c070c9955472e66323a34ffcc5da'
	'29d43485499c1c74b05c92e5b35c2dbd2fd89dbeddf1003383998d0734bb04eb'
	'79210c0c7097b9a4362cb4f3acf93aa2ba1c7e6e8b098595302ea63fad762ef8'
	'e68a521722e9b43ab3d53f12c9408e5a0b1fc3969f28fa3ebf59e61b3a9eb97f'
	'cf27c9ce9afbc4b0d5eaf8aafe1a63c95591cf3ebdeb0b182952b8a8af4cacc9'
	'65dfc70bd4d33fe4686374c08afb5b37e86d9632579d54ada2624b6708a7ed80'
	)

depends=("glibc>=2.12" "gcc-libs>=4.4.7")

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"

	# Link executable
	mkdir -p "${pkgdir}"/usr/bin
	ln -s /opt/fastonosql/bin/fastonosql "${pkgdir}"/usr/bin/fastonosql

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
		install -Dm644 "${srcdir}/fastonosql_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/fastonosql.png"
	done

	chmod -R go-w "${pkgdir}"/usr

	# License
	install -D -m644 "${pkgdir}"/opt/fastonosql/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
