# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
pkgname=vtex2
pkgver=0.2.0
pkgrel=2
pkgdesc="A VTF converter and editor"
arch=('x86_64')
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'gendesk')
source=("git+$url.git#commit=09d03a07a8034e7574b4235aff8e7f1d2450e0e4"
	"vtflib::git+https://github.com/StrataSource/VTFLib.git"
	"fmtlib::git+https://github.com/fmtlib/fmt.git")
sha256sums=('6252cf751c7a0c81e7d2a38047d1f24b98ed8e4ba7b8e4f7b6534538fef9ec6d'
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
