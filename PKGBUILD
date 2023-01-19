# Maintainer: Giovanni Bottaro <bgiovanni@mybotti.eu>

_electron_version=16
_nodejs_lts_version=-lts-gallium

pkgname=('trilium' 'trilium-server' 'trilium-dumpdb')
pkgver=0.58.7
pkgrel=1
pkgdesc="A hierarchical note taking application with focus on building large personal knowledge bases."
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
depends=("electron$_electron_version")
makedepends=('npm' "nodejs$_nodejs_lts_version")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zadam/trilium/archive/refs/tags/v$pkgver.tar.gz"
	"copy-trilium.sh.patch"
	"config-sample.ini.patch"
	"trilium.sh"
	"trilium-server.sh"
	"trilium-dumpdb.sh"
	"trilium.desktop"
	"trilium-server.service"
	"trilium-server.sysusers"
	"trilium-server.tmpfiles")

sha512sums=('5bdf4407c9338c9bf6ca65efd2e3a8a1481899f1d13e6a7528543292c4299d907f4e359497fe7030b58a6c8ba06c7b6ca0bd56a4abb70ee7e997e0752011ae86'
	    '06e89cd98dda5a52d72f5d8114d4b4444dad3f934e18477d875e6dd3214f20359aff6fb24cdfcdca3cdffa74cccac845d98af485686d3f6fd5c34e8861149132'
	    'b073a15731cced053d34534a7c34ce39b6b54bc9c818e1792d6d5fe0ef86ba83f255b75fd7a630dedad2ec0f51403dc68969d1fa3dab7472a2fc628d83c16bdd'
	    '6b03a7cce3836966d00e282d012cce944b8b56e29200fa06e64563a95e4edde591c0018715639a5e2acdbfd11a73ccb8283fbad19efc7dff218e8398c7e12d30'
	    '14a97f1fab392dd9a55440712bf3f2976de20e9c09789392984313455af77d9900445bd06cf2c3a3879a94cab893e83bd4093060f9214b2c201af89d7f62f663'
	    'e1fa62cdc2ecde41f5c5336bca3dd2d2b9e65de1a3162ef4ed336aaa7660c2b1c23793df7cdbd09e8b020890de0ba2d58c8704d2d1f0916da1212167c4820c0f'
	    'b0e42a91b5990e5d919277eb3039df52f8177f199946eeb631464b6c2a0941000df8d698907482992a11a890a495b8e0447180ab653445f4130e945f562d1054'
	    '302809fbc030c8de8c0dced345aaf8630121461e3c2be23a163bb3a6fe6401b6109b415f7efbce2736706cb87e4962c2d40eeb26a12133452880beae6ff1ddd4'
	    '3c211189cd033040df7b042f8e95e229693eb3086d0dcfa377bbf49dd6958bcd8ae71e2129259166c62872e5c98f4b11886a02cd16ba760df40f1e657939ac27'
	    '70430e1887ae9dc979ffc2d6bfee7d83c1b276c70972f98ab07a77e39aaf3b4b35081e8ec2b43da3c95f055b4872b5b3a9752c378c8c88f63aa3dfee888b3e7d')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i "s|@electronversion@|$_electron_version|" ../trilium.sh

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

	rm -r $_trilium_desktop_src_dir/src/public/app-dist/*.mobile.*

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
	
	rm -r $_trilium_server_src_dir/webpack*
	rm -r $_trilium_server_src_dir/electron.js

	# Building trilium-dumpdb
	cd dump-db

	npm install
	cp -f ../node_modules/better-sqlite3/build/Release/better_sqlite3.node node_modules/better-sqlite3/build/Release/better_sqlite3.node
}

package_trilium() {
	depends=("electron$_electron_version")
	optdepends=('trilium-dumpdb: Independent tool that allows emergency dump of notes to single files in the filesystem')

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
	optdepends=('trilium-dumpdb: Independent tool that allows emergency dump of notes to single files in the filesystem')

	cd "$pkgbase-$pkgver"

	install -vd "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -vr $_trilium_server_src_dir/. -t "${pkgdir}/usr/share/webapps/${pkgname}"
	chmod -v 755 "${pkgdir}/usr/share/webapps/${pkgname}/src/www"
	install -vDm644 $_trilium_server_src_dir/package.json -t "${pkgdir}/usr/share/webapps/${pkgname}"
	install -vDm644 bin/tpl/anonymize-database.sql -t "${pkgdir}/usr/share/webapps/${pkgname}"

	install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/trilium-server"
	install -vDm644 "${srcdir}"/${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
	install -vDm644 "${srcdir}"/${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm644 "${srcdir}"/${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

package_trilium-dumpdb() {
    pkgdesc="An emergency tool to extract notes from the database where they're stored to plain files on the filesystem"
    depends=("nodejs$_nodejs_lts_version")

    cd "$pkgbase-$pkgver"

    install -vd "${pkgdir}/usr/lib/${pkgname}"
    cp -vr dump-db/. -t "${pkgdir}/usr/lib/${pkgname}"
    chmod -v 755 "${pkgdir}/usr/lib/${pkgname}/dump-db.js"

    install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/trilium-dumpdb"
}
