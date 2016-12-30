# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol
_pkgname=MatterControl
pkgver=1.6.2
pkgrel=1
pkgdesc="Software solution for 3D printers"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mono' 'lib32-glibc' 'gtk-sharp-2')
optdepends=('mattercontrol-plugins: Closed source plugins for cloud functionality')
makedepends=('git' 'nuget')
provides=('mattercontrol')
install="mattercontrol.install"
_projecttoken=ag9zfm1hdHRlcmNvbnRyb2xyFAsSB1Byb2plY3QYgICAiOCSzAsM
source=(git://github.com/MatterHackers/MatterControl.git
	'mattercontrol'
	'mattercontrol.desktop'
	'mattercontrol.png'
	'mattercontrol.install')
sha256sums=('SKIP'
            '4954c0de00d6701d37c15c73d3509d0d91e67339c08afa3b273e9343dfd5cc61'
            'f82724678f8d3912f3632dc150945a5a88fc1fde79267c4c270b97343cabfd3a'
            '6470dfabd982109638c2e9fc01acca51dc1109ce07aec261dbc4c86ead9f9927'
            '41e907de000d6b57c7788229a36ff4b247de928597401631e2b1036fdf97aa77')

build() {
	cd "${srcdir}"/${_pkgname}

	git checkout tags/Releases/${pkgver}
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
	cd "${srcdir}"/${_pkgname}

	# Build Info
	cd StaticData
	echo "{\"BuildVersion\": \"${pkgver}\", \"ProjectToken\": \"${projecttoken}\", \"ReleaseVersion\": \"${pkgver}\", \"BuildToken\": \"no-key\"}" > BuildInfo.txt
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
