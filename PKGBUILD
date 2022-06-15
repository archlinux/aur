# Maintainer: Giovanni Bottaro <giovanni26.bottaro@gmail.com>

_electron_version=16

pkgname=trilium
pkgver=0.52.3
pkgrel=1
pkgdesc="A hierarchical note taking application with focus on building large personal knowledge bases."
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
depends=("electron$_electron_version" 'nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zadam/trilium/archive/refs/tags/v$pkgver.tar.gz"
	"copy-trilium.sh.patch"
	"config-sample.ini.patch"
        "trilium.sh"
	"trilium.desktop")
sha512sums=('b19559bc8ae8c3b97c0fac18be66495996537d15bb8e058ab6d8688fe05b996efb40246fed1653a49c5eb296b5f7ee6f46e86ca306226088fb2e5718de18cb7f'
	    '97dc8034f01cecceb4a85e61a0d561ddf01af7cf24e0dad24faefaee8c1f265c5e8441fd38ff473bd869606b821476d4efc8fc5ae1b99149875d826db4366fa7'
	    'b073a15731cced053d34534a7c34ce39b6b54bc9c818e1792d6d5fe0ef86ba83f255b75fd7a630dedad2ec0f51403dc68969d1fa3dab7472a2fc628d83c16bdd'
	    'f02253c2d7b21eb1e1f72c9d6b347180e03fe9f44a4843e16d532e9b9ff6cab3e754a559838dbcd0055d551bc2847414d655ef135467bb7b9fc67d05a0386da1'
	    '2f26a7decafc57626835a8ec3842c1fc57572a66753e8cdbedafe59f59dd492edaa6971edd193512e20d7bbbec6618e602cf7e05c01e4911f8a2e038267c5703')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i "s|@electronversion@|$_electron_version|" ../trilium.sh

	patch bin/copy-trilium.sh ../copy-trilium.sh.patch
	patch config-sample.ini ../config-sample.ini.patch
}

build() {
	cd "$pkgname-$pkgver"

	export npm_config_cache="$srcdir/npm_cache"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	npm install --build-from-source
	
	_trilium_src_dir=./dist/trilium-linux-x64-src
	./bin/copy-trilium.sh $_trilium_src_dir

	rm -r $_trilium_src_dir/src/public/app-dist/*.mobile.*
	
	npx electron-builder --linux --x64 --dir \
	    --project=$_trilium_src_dir \
	    -c.electronDist=/usr/lib/electron$_electron_version \
	    -c.electronVersion=$(electron$_electron_version --version | tail -c +2)
}

package() {
	cd "$pkgname-$pkgver"

	_trilium_final_build_dir=dist/trilium-linux-x64-src/dist/linux-unpacked
	install -vDm644 $_trilium_final_build_dir/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
	install -vDm644 package.json -t "${pkgdir}/usr/lib/${pkgname}"
	install -vDm755 bin/tpl/trilium-safe-mode.sh -t  "${pkgdir}/usr/lib/${pkgname}"
	install -vDm755 bin/tpl/trilium-no-cert-check.sh -t  "${pkgdir}/usr/lib/${pkgname}"
	install -vDm644 bin/tpl/anonymize-database.sql -t "${pkgdir}/usr/lib/${pkgname}"
	install -vd "${pkgdir}/usr/lib/${pkgname}/dump-db"
	cp -vr dump-db/* -t "${pkgdir}/usr/lib/${pkgname}/dump-db"
	

	for i in 16 32 64 128 256 512; do
		install -vDm644 images/app-icons/png/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done

	install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/trilium"
	install -vDm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications
}
