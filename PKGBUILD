# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=xtool-creative-space
_date=2025-01-14-11-20-09
_sharpver=0.32.6
pkgver=2.4.27
pkgrel=4
pkgdesc='The Strongest Yet Easiest Laser Software'
arch=(x86_64)
url='https://www.xtool.com/pages/software'
license=(proprietary)
_electron=electron27 # note: the original app uses electron26
depends=($_electron libvips)
makedepends=(7zip asar)
options=(!debug)
_fname="xTool-Creative-Space-$pkgver-$_date.exe"
source=(
	"https://storage-us.xtool.com/resource/efficacy/xcs/prod-us/packages/15/f83f5ca4-d0dc-4197-848f-ab534213b9d9/$_fname"
	"https://github.com/lovell/sharp/releases/download/v$_sharpver/sharp-v$_sharpver-napi-v7-linux-x64.tar.gz"
	$pkgname.{sh,desktop}
)
sha256sums=('d9a02ba3fd844ccd1575524d394deb70737ddb9b5fd311679f26623f342825d9'
            '994679b5089fee0608f94f1b5f6f75a0dcc79a64f3a929d147503e8d0e91dd2f'
            '62f61773aada65a75805aabbe3221e83e1c6522615e8bd7325cbef964e0edd04'
            '619023f7b9f981df633985134d50195bab3b93a7ae2a53921df6ceb9ff022299')

build() {
	7z e -y "$_fname" '$PLUGINSDIR/app-64.7z' >/dev/null
	7z x -y app-64.7z resources >/dev/null
	asar e resources/app.asar app
	rm -rf app/node_modules/sharp/{build,vendor}
	cp -Ta build app/node_modules/sharp/build
}

package() {
	install -d "$pkgdir"/usr/lib/$pkgname/resources
	cp -Ta /usr/lib/$_electron "$pkgdir"/usr/lib/$pkgname # hack, as the app refers to app.getPath('exe')
	7z x -y -o"$pkgdir"/usr/lib/$pkgname app-64.7z buildResources >/dev/null
	asar p app "$pkgdir"/usr/lib/$pkgname/resources/app.asar --unpack-dir 'node_modules/{@makeblock,sharp,@xtool}'
	install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
	install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	install -Dm644 "$pkgdir"/usr/lib/$pkgname/buildResources/linux/256x256.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
