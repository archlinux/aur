# Maintainer: Fabian Hartmann <worldwidefab+arch gmail com>
_pkgname='Ambermoon.net'
pkgname=ambermoon-net
pkgver=1.13.5
pkgrel=1
epoch=
pkgdesc="C# rewrite of the 1993 Amiga RPG Ambermoon"
arch=('x86_64')
url="https://github.com/Pyrdacor/Ambermoon.net"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'libglvnd' 'openal')
# Build targets net8.0 and net9.0. The 'dotnet-sdk' meta-package
# (currently 10.x as of 2026-05) successfully builds these via
# backward compatibility. If a future .NET release breaks the build,
# consider pinning to 'dotnet-sdk-9.0' from extra (while available).
makedepends=('dotnet-sdk')
provides=("ambermoon-net=${pkgver}")
conflicts=("ambermoon-net-bin")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7fccd4b6e4b47d8558e813c81647c1c830c51a5ca8e85b6fe4ac2f46139f5a50')

build() {
	cd "${_pkgname}-${pkgver}"
	mkdir -p publish-linux
	cp ./Ambermoon.net/versions.dat publish-linux
	cp ./Ambermoon.net/diffs.dat publish-linux
	dotnet publish -c Release ./Ambermoon.ConcatFiles/Ambermoon.ConcatFiles.csproj -p:PublishSingleFile=true -p:IncludeAllContentForSelfExtract=true  -r linux-x64 --nologo --self-contained -o ./publish-linux
	dotnet publish -c Release ./Ambermoon.net/Ambermoon.net.csproj -p:PublishSingleFile=true -p:IncludeAllContentForSelfExtract=true  -r linux-x64 --nologo --self-contained -o ./publish-linux
	cd publish-linux
	./Ambermoon.ConcatFiles versions versions.dat diffs diffs.dat Ambermoon.net
	rm ./versions.dat
	rm ./diffs.dat
	rm ./Ambermoon.ConcatFiles
	rm ./*.pdb
}

package() {
	# Bundle to /opt
	cd "$srcdir/${_pkgname}-${pkgver}/publish-linux"
	install -Dm755 Ambermoon.net "${pkgdir}/opt/Ambermoon.net/Ambermoon.net"

	# Launcher
    	install -d "${pkgdir}/usr/bin"
    	cat > "${pkgdir}/usr/bin/ambermoon-net" <<'EOF'
#!/bin/sh
cd /opt/Ambermoon.net
exec ./Ambermoon.net "$@"
EOF
    	chmod 755 "${pkgdir}/usr/bin/ambermoon-net"

	# Documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		"${srcdir}/${_pkgname}-${pkgver}/FAQ.md" \
		"${srcdir}/${_pkgname}-${pkgver}/FirstPlay.md" \
		"${srcdir}/${_pkgname}-${pkgver}/Configuration.md" \
		"${srcdir}/${_pkgname}-${pkgver}/Controls.md" \
		"${srcdir}/${_pkgname}-${pkgver}/CustomMusic.md"

	# License
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Desktop entry
	install -d "${pkgdir}/usr/share/applications/"
	cat > "${pkgdir}/usr/share/applications/ambermoon-net.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Ambermoon.net
Comment=$pkgdesc
Exec=ambermoon-net
Terminal=false
Categories=Game;RolePlaying;
EOF

}

