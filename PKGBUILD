# Maintainer: Giovanni Bottaro <bgiovanni@mybotti.eu>

_electron_version=25
_nodejs_lts_version=-lts-hydrogen

pkgname=('trilium' 'trilium-server' 'trilium-dumpdb')
pkgver=0.62.3
pkgrel=1
pkgdesc="A hierarchical note taking application with focus on building large personal knowledge bases"
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
depends=("electron$_electron_version")
makedepends=('npm' "nodejs$_nodejs_lts_version")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zadam/trilium/archive/refs/tags/v$pkgver.tar.gz"
	"package.json.patch"
	"copy-trilium.sh.patch"
	"config-sample.ini.patch"
	"trilium.sh"
	"trilium-server.sh"
	"trilium-dumpdb.sh"
	"trilium.desktop"
	"trilium-server.logrotate"
	"trilium-server.service"
	"trilium-server.sysusers"
	"trilium-server.tmpfiles"
)

sha512sums=('4a4e6a4df72772ca668e4ea6c70cafa65f791e74759d9b2194446c4ec8c16153ca7f7e3f9247d402158fa1df539b1fd60d43d84949ed48b6aaa68c27225091c8'
            '6ce272c4df5178fe0252cd15c7f6e08ce42ed74f4771d76e22a88fceedbe1d99645885d1c6a4ce2968b49585a9dd48ccb6b73131955295ff5b4fea7248ef2a69'
            '1aa7732568e21fccab22c8b2e26df9a50cc72552b8f8c2b85fe28b91dfe82ccdb11bb0e705cc68ddf26c56bcb106874549da40559bf54cce6351107a047606b9'
            'b073a15731cced053d34534a7c34ce39b6b54bc9c818e1792d6d5fe0ef86ba83f255b75fd7a630dedad2ec0f51403dc68969d1fa3dab7472a2fc628d83c16bdd'
            '6b03a7cce3836966d00e282d012cce944b8b56e29200fa06e64563a95e4edde591c0018715639a5e2acdbfd11a73ccb8283fbad19efc7dff218e8398c7e12d30'
            '1c1b53fc3af4cf452042c756ebd9d84d3642ade69d7ab2b72f0975cf4b9f2aee5acc7599ac77b9b32e5b0449dd9cd22f58d3c8bfd8b5688a2b68191875182248'
            '55d1f1227650494d6405d949b85265880fc317ed6698609b6963caac772de7d96d4e5a66bc374fa8f7d00c05189e04c34558526656f04d2bf34b77867acc2c76'
            'b0e42a91b5990e5d919277eb3039df52f8177f199946eeb631464b6c2a0941000df8d698907482992a11a890a495b8e0447180ab653445f4130e945f562d1054'
            '26686715395a4de148210310170a3eaf7c5be489d855558065dc0d3e8651701879895917999087b6a773d59ca8ed17934a84014425907143e1b2a715e5675623'
            '952cec6f8156bab96a763b9304c61844a42cfe95ff1377be67b307c8f08307a9174c47e0e3839f2e729a0a04bc6138574edb8040dbc2b6e0cf21068db2105398'
            '91199f2bbbadc76c1520e84cc1e4d9c44e3ab483202a31fba521935f6258ea286ed798155783cd61bd7afe3560d76ae44841a16946a35de060749d432879b828'
            '6157c1e7146bceabc63a338a65d1d9b32af6acf0a2c16321a51a3929d1a09f2a4e8855588e81fc646e49d2814770e791984443a7d9190b4ea143ac85d61e679b')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i "s|@electronversion@|$_electron_version|" ../trilium.sh

	patch package.json ../package.json.patch
	patch bin/copy-trilium.sh ../copy-trilium.sh.patch
	patch config-sample.ini ../config-sample.ini.patch
}

_trilium_desktop_src_dir=./dist/trilium-linux-x64-src
_trilium_server_src_dir=./dist/trilium-linux-server-x64-src

build() {
	cd "$pkgname-$pkgver"

	export npm_config_cache="$srcdir/npm_cache"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	npm install --build-from-source

	# Building trilium (desktop)
	./bin/copy-trilium.sh $_trilium_desktop_src_dir
	rm -rf $_trilium_desktop_src_dir/dump-db

	rm -r $_trilium_desktop_src_dir/src/public/app-dist/mobile.*

	npx electron-builder --linux --x64 --dir \
	    --project=$_trilium_desktop_src_dir \
	    -c.electronDist=/usr/lib/electron$_electron_version \
	    -c.electronVersion=$(electron$_electron_version --version | tail -c +2)

	# Building trilium-server
	grep -v electron package.json > package-server.json
	mv package-server.json package.json

	./bin/copy-trilium.sh $_trilium_server_src_dir
	rm -rf $_trilium_server_src_dir/dump-db

	mkdir $_trilium_server_src_dir/node_modules/better-sqlite3/build/Release
	cp ./node_modules/better-sqlite3/build/Release/better_sqlite3.node $_trilium_server_src_dir/node_modules/better-sqlite3/build/Release/better_sqlite3.node

	rm -r $_trilium_server_src_dir/electron.js

	# Building trilium-dumpdb
	cd dump-db

	npm install
	cp -f ../node_modules/better-sqlite3/build/Release/better_sqlite3.node node_modules/better-sqlite3/build/Release/better_sqlite3.node
}

package_trilium() {
	depends=("electron$_electron_version")
	optdepends=('trilium-dumpdb: Standalone tool that allows emergency dump of notes to single files in the filesystem')

	cd "$pkgname-$pkgver"

	install -vDm644 $_trilium_desktop_src_dir/dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
	install -vDm644 $_trilium_desktop_src_dir/package.json -t "${pkgdir}/usr/lib/${pkgname}"
	install -vDm644 bin/tpl/anonymize-database.sql -t "${pkgdir}/usr/lib/${pkgname}"

	for i in 16 32 64 128 256 512; do
		install -vDm644 images/app-icons/png/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done

	install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/trilium"
	install -vDm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications
}

package_trilium-server() {
	pkgdesc="A hierarchical note taking application with focus on building large personal knowledge bases - Server version"
	depends=("nodejs$_nodejs_lts_version")
	optdepends=('trilium-dumpdb: Standalone tool that allows emergency dump of notes to single files in the filesystem')
	backup=("etc/${pkgname}.conf"
	        "etc/logrotate.d/${pkgname}")

	cd "$pkgbase-$pkgver"

	install -vd "${pkgdir}/usr/lib/node_modules/${pkgname}"
	cp -vr $_trilium_server_src_dir/. -t "${pkgdir}/usr/lib/node_modules/${pkgname}"
	install -vDm644 $_trilium_server_src_dir/package.json -t "${pkgdir}/usr/lib/node_modules/${pkgname}"
	install -vDm644 bin/tpl/anonymize-database.sql -t "${pkgdir}/usr/lib/node_modules/${pkgname}"

	install -vDm644 config-sample.ini "${pkgdir}/etc/${pkgname}.conf"

	install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -vDm644 "${srcdir}"/${pkgname}.logrotate "${pkgdir}/etc/logrotate.d/${pkgname}"
	install -vDm644 "${srcdir}"/${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
	install -vDm644 "${srcdir}"/${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm644 "${srcdir}"/${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

package_trilium-dumpdb() {
    pkgdesc="An emergency tool to extract notes from the database where they're stored to plain files on the filesystem"
    depends=("nodejs$_nodejs_lts_version")

    cd "$pkgbase-$pkgver"

    install -vd "${pkgdir}/usr/lib/node_modules/${pkgname}"
    cp -vr dump-db/. -t "${pkgdir}/usr/lib/node_modules/${pkgname}"

    install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/trilium-dumpdb"
}
