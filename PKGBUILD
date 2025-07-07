# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=xtool-creative-space
_date=2025-06-19-11-01-27
_sharpver=0.32.6
pkgver=2.7.22
pkgrel=1
pkgdesc='The Strongest Yet Easiest Laser Software'
arch=(x86_64)
url='https://www.xtool.com/pages/software'
license=(proprietary)
_electron=electron31
depends=($_electron libvips bubblewrap)
makedepends=(asar)
options=(!debug)
_fname="xTool-Creative-Space-$pkgver-$_date.exe"
# curl -s https://www.xtool.com/pages/software | grep -o 'data-href="[^"]*.exe"'
source=(
	"https://storage-us.xtool.com/resource/efficacy/xcs/prod-us/packages/15/acc9990c-d436-483c-89bf-d9749831be1f/$_fname"
	"https://github.com/lovell/sharp/releases/download/v$_sharpver/sharp-v$_sharpver-napi-v7-linux-x64.tar.gz"
	$pkgname.{sh,desktop}
)
sha256sums=('6cd17873b10b62d1d00001c724251e5f58123964b2ec5060ad389ca72389ac9a'
            '994679b5089fee0608f94f1b5f6f75a0dcc79a64f3a929d147503e8d0e91dd2f'
            '8a7e431c37b526eafcf825eaeabac17d7232c03e8077bb5e345bd147a49d6f9d'
            '619023f7b9f981df633985134d50195bab3b93a7ae2a53921df6ceb9ff022299')

build() {
	asar e resources/app.asar app
	rm -rf app/node_modules/sharp/{build,vendor}
	cp -Ta build app/node_modules/sharp/build
	rm -rf buildResources/esptool
	# Absolute hack. New version tries to load this on startup so it fails to start at all.
	# This way, it won't crash immediately but it's still unable to actually plot stuff.
	cp build/Release/sharp-linux-x64.node app/node_modules/@xtool/xcs_cpp_module/prebuild/electron/31.7/xcs_cpp_module.node
}

package() {
	install -d "$pkgdir"/usr/lib/$pkgname/resources
	cp -Ta buildResources "$pkgdir"/usr/lib/$pkgname/buildResources
	asar p app "$pkgdir"/usr/lib/$pkgname/resources/app.asar --unpack-dir 'node_modules/{@makeblock,sharp,@xtool}'
	install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
	install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	install -Dm644 "$pkgdir"/usr/lib/$pkgname/buildResources/linux/256x256.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
