# Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname="wacomareax11"
pkgname="${_pkgname}-git"
pkgver=v3.0.r0.47a0a49
pkgrel=2
pkgdesc="A TUI and GUI to set your tablet area etc and to generate config files"
arch=('x86_64')
url="https://github.com/yellowsink/WacomAreaX11"
license=('BSD')
groups=()
depends=('xf86-input-wacom' 'ttf-ms-win10-auto')
makedepends=('git' 'dotnet-sdk>=5.0.0' 'dotnet-targeting-pack>=5.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-source::git+${url}#branch=master")
md5sums=('SKIP')
options=('!strip')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${_pkgname}-source"

# Git, tags available
	git describe --long --tags | sed 's/^v-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}-source"

	# make a launch script
	tee 'launch.sh' << END
#!/bin/sh
cd /opt/${_pkgname}_gui
exec ./WacomAreaX11.Gui
END

	# make a desktop entry
	tee 'launch.desktop' << END
[Desktop Entry]
Name=WacomAreaX11 GUI
Version=${pkgver}
GenericName=Wacom tablet configuration
Exec=/usr/bin/${_pkgname}_gui
Icon=
Type=Application
Categories=;
Keywords=;
Terminal=false
StartupNotify=false
Comment=Wacom tablet configuration
END
}

build() {
	cd "${_pkgname}-source"

	# build with dotnet
	dotnet publish -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:PublishTrimmed=True -p:TrimMode=Link WacomAreaX11/WacomAreaX11.csproj
	dotnet publish -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:PublishTrimmed=True -p:TrimMode=Link WacomAreaX11.Gui/WacomAreaX11.Gui.csproj
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	cd "${_pkgname}-source"

	# install license
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

	# copy build folder
	mkdir -p "${pkgdir}/opt/${_pkgname}_gui/"
	cp -r --preserve=mode "WacomAreaX11.Gui/bin/Debug/net5.0/linux-x64/publish/"* "${pkgdir}/opt/${_pkgname}_gui/"
	# install desktop entry
	install -Dm 644 "launch.desktop" "${pkgdir}/usr/share/applications/${_pkgname}_gui.desktop"
	# install launch script
	install -Dm 755 "launch.sh" "${pkgdir}/usr/bin/${_pkgname}_gui"

	# TUI tool
	install -Dm 755 "WacomAreaX11/bin/Debug/net5.0/linux-x64/publish/WacomAreaX11" "${pkgdir}/usr/bin/${_pkgname}"
}
