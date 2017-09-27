# Maintainer: Jake <ja.ke@posteo.de>
# Based on mattercontrol[AUR], many thanks to: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol-git
_pkgname=MatterControl
pkgver=1.7.4.r28.fa9f5f9e
pkgrel=1
pkgdesc="Software solution for 3D printers"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mono' 'lib32-glibc' 'gtk-sharp-2')
optdepends=('mattercontrol-plugins: Closed source plugins for cloud functionality')
makedepends=('git' 'nuget')
provides=('mattercontrol')
conflicts=('mattercontrol')
install="mattercontrol.install"
_buildver=1.7.0.8527
_projecttoken=ag9zfm1hdHRlcmNvbnRyb2xyFAsSB1Byb2plY3QYgICAiOCSzAsM
_buildtoken=ag9zfm1hdHRlcmNvbnRyb2xyQQsSB1Byb2plY3QYgICAiOCSzAsMCxINUHVibGljUmVsZWFzZRiAgICgsdyLCgwLEgZVcGxvYWQYgICAoK3hngoM
source=(git://github.com/MatterHackers/MatterControl.git#branch=1.7
	'mattercontrol'
	'mattercontrol.desktop'
	'mattercontrol.png'
	'mattercontrol.install')
sha256sums=('SKIP'
            '4954c0de00d6701d37c15c73d3509d0d91e67339c08afa3b273e9343dfd5cc61'
            '89854894868127bdb8d7ebdef8cccf1c528b0a07e526380dcc0e1024a15c033c'
            '6470dfabd982109638c2e9fc01acca51dc1109ce07aec261dbc4c86ead9f9927'
            '41e907de000d6b57c7788229a36ff4b247de928597401631e2b1036fdf97aa77')

pkgver() {
	cd "$srcdir/${_pkgname}"
	
        # Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/Releases\///g')"
}
            
build() {
	cd "${srcdir}"/${_pkgname}
		
	git submodule update --init --recursive
	#mozroots --import --sync
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
	echo "{\"BuildVersion\": \"${_buildver}\", \"ProjectToken\": \"${_projecttoken}\", \"ReleaseVersion\": \"${pkgver}\", \"BuildToken\": \"${_buildtoken}\"}" > BuildInfo.txt
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
