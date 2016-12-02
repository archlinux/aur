# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol
_pkgname=MatterControl
pkgver=1.6.0
pkgrel=1
pkgdesc="Software solution for 3D printers"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mono' 'lib32-glibc')
makedepends=('git' 'nuget')
provides=('mattercontrol')
install="mattercontrol.install"
source=(git://github.com/MatterHackers/MatterControl.git
	'mattercontrol'
	'mattercontrol.desktop'
	'mattercontrol.png'
	'mattercontrol.install')
sha256sums=('SKIP'
            '4954c0de00d6701d37c15c73d3509d0d91e67339c08afa3b273e9343dfd5cc61'
            'f82724678f8d3912f3632dc150945a5a88fc1fde79267c4c270b97343cabfd3a'
            '6470dfabd982109638c2e9fc01acca51dc1109ce07aec261dbc4c86ead9f9927'
            '9d7b9c5a3751e6fbbc1a2f5c092ba6fad610251db0009afde98290998ae9b949')

build() {
	cd "${srcdir}"/${_pkgname}

	git checkout ${pkgver}
	git submodule update --init --recursive
	mozroots --import --sync
	nuget restore MatterControl.sln

	xbuild /p:Configuration=Release MatterControl.sln
	#mdtool build -c:Release MatterControl.sln

	# GTK File Dialogs
	xbuild /p:Configuration=Release Submodules/agg-sharp/GtkFileDialogs/GtkFileDialogs.csproj
	cp Submodules/agg-sharp/GtkFileDialogs/obj/Release/GtkFileDialogs.dll* bin/Release/
	rm bin/Release/WindowsFileDialogs.dll*

	# Serial Helper
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
