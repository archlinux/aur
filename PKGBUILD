# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
pkgname=vtex2
pkgver=0.3.1
pkgrel=1
pkgdesc="A VTF converter and editor"
arch=('x86_64')
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'qt6-svg' 'ninja')
source=("git+$url.git#tag=v${pkgver}"
	"vtflib::git+https://github.com/StrataSource/VTFLib.git"
	"fmtlib::git+https://github.com/fmtlib/fmt.git")
sha256sums=('c5e131e3d710b7d7d1b7d28e69d88f9266f92ae182f2ef67836f3fee1e1b5dd8'
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
	-G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DBUILD_GUI=1

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR=$pkgdir cmake --install build && rm -rf "$pkgdir/usr/lib" "$pkgdir/usr/include"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname/res/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/vtfview.svg"
	sed -i 's/Name=vtfview/Name=VTFView/g' "$pkgdir/usr/share/applications/vtfview.desktop"
	cat >> "$pkgdir/usr/share/applications/vtfview.desktop" <<-EOF
MimeType=application/x-vtf
EOF
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
