# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit
pkgver=3.6.0
pkgrel=1
pkgdesc="A library and tool to create, read, and write Valve VPK archives"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'gcc')
optdepends=('qt6-wayland: Wayland support')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
		"vtflib::git+https://github.com/StrataSource/VTFLib.git"
		"saap::git+https://github.com/Trico-Everfire/SteamAppPathProvider.git"
		"speedykeyv::git+https://github.com/ozxybox/SpeedyKeyV.git"
		"studiomodelpp::git+https://github.com/craftablescience/studiomodelpp.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {vtflib,saap,speedykeyv,studiomodelpp};
	do
		git config submodule.src/gui/thirdparty/$submodule.url "$srcdir/${submodule}"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S "$pkgname" \
	-DCMAKE_INSTALL_PREFIX=/opt/vpkedit \
	-DCMAKE_BUILD_TYPE=Release

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	# Remove Qt libs copied from system
	cd "$pkgdir/opt/vpkedit"
	rm -rf libQt*

	# Install License
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Create mime for VPKEDIT to open up vpks
	mkdir -p "$pkgdir/usr/share/mime/packages"
	cat > "$pkgdir/usr/share/mime/packages/vpkedit.xml" <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-vpkedit-vpk">
    <comment>VPK Archive</comment>
	<icon name="x-vpkedit-vpk"/>
	<acronym>VPK</acronym>
	<expanded-acronym>Valve Pack File</expanded-acronym>
    <glob-deleteall/>
    <glob pattern="*.VPK"/>
    <glob pattern="*.vpk"/>
    </mime-type>
</mime-info>
EOF
	# Make the vpkedit desktop file be associated with the x-vpkedit mimetype and allow opening files
	cd "$pkgdir/usr/share/applications"
	sed -i 's"Exec=/opt/vpkedit/vpkedit"Exec=/opt/vpkedit/vpkedit %f"g' vpkedit.desktop

	cat >> "vpkedit.desktop" <<-EOF
	MimeType=application/x-vpkedit-vpk
	EOF

	# Give VPKs an icon
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/"
	cp "$pkgdir/usr/share/pixmaps/vpkedit.png" "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/x-vpkedit-vpk.png"
}
