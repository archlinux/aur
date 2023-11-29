# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vpkedit-git
pkgver=3.5.0.r0.g8e153e2
pkgrel=3
pkgdesc="A library and tool to create, read, and write Valve VPK archives"
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'gcc')
optdepends=('qt6-wayland: Wayland support')
conflicts=('vpkedit' 'vpkedit-bin')
replaces=('vpkedit')
source=("$pkgname::git+$url.git"
		"vtflib::git+https://github.com/StrataSource/VTFLib.git"
		"saap::git+https://github.com/Trico-Everfire/SteamAppPathProvider.git"
		"speedykeyv::git+https://github.com/ozxybox/SpeedyKeyV.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver(){
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {vtflib,saap,speedykeyv};
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
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/vpkedit-git/LICENSE"

	# Create mime for VPKEDIT to open up vpks
	mkdir -p "$pkgdir/usr/share/mime/packages"
	cat > "$pkgdir/usr/share/mime/packages/vpkedit.xml" <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-vpkedit">
        <comment>Valve Pack File</comment>
		<icon name="x-vpkedit"/>
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
	MimeType=application/x-vpkedit
	EOF

	# Give VPKs an icon
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/"
	cp "$pkgdir/usr/share/pixmaps/vpkedit.png" "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/x-vpkedit.png"
}