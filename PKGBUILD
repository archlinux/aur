# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
pkgname=vtex2
pkgver=0.3.1
pkgrel=4
pkgdesc="A VTF converter and editor"
arch=('x86_64')
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'qt6-svg' 'ninja' 'vulkan-headers')
_commit=d68ca2808d5bd5694b47eb9a2a3939f5d49dd58a
source=("git+$url.git#commit=$_commit"
	"vtflib::git+https://github.com/StrataSource/VTFLib.git#commit=418b1fc341f0912c86fb31867c91dbfd19beff66"
	"fmtlib::git+https://github.com/fmtlib/fmt.git#commit=8a484ad577150766b586ce7d3bedf2b79ae02998")
sha256sums=('c5e131e3d710b7d7d1b7d28e69d88f9266f92ae182f2ef67836f3fee1e1b5dd8'
            '6e478ea19936b91ae743b5b2c4a78d2291d6342b0608a812e37eb65845c72116'
            '61c8bf4ef8359b6c2117501aa3dfd6be41e2d5a3c371c82eb3f7ca3134934814')

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
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
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
