# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
pkgname=vtex2
pkgver=0.2.0
pkgrel=3
pkgdesc="A VTF converter and editor"
arch=('x86_64')
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'gendesk' 'qt6-svg')
source=("git+$url.git#tag=v${pkgver}"
	"vtflib::git+https://github.com/StrataSource/VTFLib.git"
	"fmtlib::git+https://github.com/fmtlib/fmt.git")
sha256sums=('81a6de30f5a17eb69c61c3504eb40ca724793030a8ed4510c6956bc9356e4237'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {vtflib,fmtlib};
	do
		git config submodule.external/$submodule.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S $pkgname \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DBUILD_GUI=1

	cmake --build build

	gendesk -f --pkgname=vtfview \
	--pkgdesc="$pkgdesc" \
	--name=VTFView \
	--exec='vtfview %f' \
	--icon=vtfview \
	--terminal=false \
	--categories='Development;Utilities;Graphics' \
	--mimetypes="application/x-vtf"
}

package() {
	cd "$srcdir"
	DESTDIR=$pkgdir cmake --install build
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/vtfview.desktop" "$pkgdir/usr/share/applications/vtfview.desktop"
	install -Dm644 "$srcdir/$pkgname/res/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/vtfview.svg"
	mkdir -p "$pkgdir/usr/share/mime/packages/"
	cat >> "$pkgdir/usr/share/mime/packages/vtfview.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-vtf">
        <comment>Valve Texture Format</comment>
        <acronym>VTF</acronym>
        <expanded-acronym>Valve Texture Format</expanded-acronym>
        <glob-deleteall/>
        <glob pattern="*.vtf"/>
        <glob pattern="*.VTF"/>
    </mime-type>
</mime-info>
EOF
}
