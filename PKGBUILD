# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol
_pkgname=MatterControl
pkgver=1.3.0
pkgrel=1
pkgdesc="Software solution for 3D printers"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mono' 'lib32-glibc')
makedepends=('git')
provides=('mattercontrol')
install="mattercontrol.install"
source=(git://github.com/MatterHackers/MatterControl.git
	'mattercontrol'
	'mattercontrol.desktop'
	'mattercontrol.png'
	'mattercontrol.install')
sha256sums=('SKIP'
            'c96a2287d3f3a5a5958c7b0ffc8bd7a0bfa6b82c93cf8934168c0c9bef40d3cc'
            '0dcc1674e524acbd475034c0b7b8e6e3daa29a9a4d1ddb642d2b8a0b9af63025'
            '0a357a20131995772707872ee41f0cf5c235336d60f7bb136e994f592ae6745e'
            '9d7b9c5a3751e6fbbc1a2f5c092ba6fad610251db0009afde98290998ae9b949')

build() {
	cd "${srcdir}"/${_pkgname}

	git checkout ${pkgver}
	git submodule update --init --recursive
	mozroots --import --sync
	mono .nuget/NuGet.exe restore MatterControl.sln

	xbuild /p:Configuration=Release MatterControl.sln
	#mdtool build -c:Release MatterControl.sln

	cd Submodules/agg-sharp/SerialPortCommunication/SerialHelper
	./build.sh
}

package() {
	cd "${srcdir}"/${_pkgname}

	install -d "$pkgdir/usr/lib/mattercontrol/"
	cp -r bin/Release/* "$pkgdir/usr/lib/mattercontrol/"
	install -d "$pkgdir/usr/lib/mattercontrol/StaticData/"
	cp -r StaticData/* "$pkgdir/usr/lib/mattercontrol/StaticData"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mattercontrol/LICENSE"

	cd "${srcdir}"
	install -Dm755 mattercontrol "$pkgdir/usr/bin/mattercontrol"
	install -Dm644 mattercontrol.desktop "$pkgdir/usr/share/applications/mattercontrol.desktop"
	install -Dm644 mattercontrol.png "$pkgdir/usr/share/icons/mattercontrol.png"
}
