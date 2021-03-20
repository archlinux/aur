# Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname="discordrichpresencepresets"
pkgname="${_pkgname}-git"
pkgver=avalonia.v0.1.beta.r17.3045abe
pkgrel=4
pkgdesc="A GUI tool to set and switch between Discord Rich Presences"
arch=('x86_64')
url="https://github.com/cainy-a/DiscordRichPresencePresets"
license=('BSD')
groups=()
depends=('dotnet-runtime>=5.0.0' 'dotnet-host>=5.0.0')
makedepends=('git' 'dotnet-sdk>=5.0.0' 'dotnet-targeting-pack>=5.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("${_pkgname}-source::git+${url}#commit=3045abeabdc7c2875037a594766759b2896afeeb")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${_pkgname}-source"

# Git, tags available
	git describe --long --tags | sed 's/^avalonia-v-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}-source"

	# make a launch script
	tee 'launch.sh' << END
#!/bin/sh
cd /usr/lib/${_pkgname}
exec ./DiscordRichPresencePresets.Avalonia
END

	# make a desktop entry
	tee 'launch.desktop' << END
[Desktop Entry]
Name=Discord RP Presets
Version=${pkgver}
GenericName=Rich Presence Preset Manager
Exec=/usr/bin/${_pkgname}
Icon=
Type=Application
Categories=;
Keywords=;
Terminal=false
StartupNotify=false
Comment=A GUI tool to set and switch between Discord Rich Presences
END

	# fix perms
	chmod +x launch.desktop
}

build() {
	cd "${_pkgname}-source"

	# build with dotnet
	cd DiscordRichPresencePresets.Avalonia
	dotnet build
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
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}/"
	cp -r --preserve=mode "DiscordRichPresencePresets.Avalonia/bin/Debug/net5.0/"* "${pkgdir}/usr/lib/${_pkgname}/"
	# install desktop entry
	install -Dm 644 "launch.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	# install launch script
	install -Dm 755 "launch.sh" "${pkgdir}/usr/bin/${_pkgname}"
	
	# Only root can write to the install directory.
	# For portable saves this is an issue. (though you shouldn't use portable with the AUR version :P)
	# However custom save location uses portable settings save, causing settings to reset each relaunch
	# This creates the data dir ahead of time and gives all users write access.
	mkdir "${pkgdir}/usr/lib/${_pkgname}/data/"
	chmod 777 "${pkgdir}/usr/lib/${_pkgname}/data/"
}
