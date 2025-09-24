# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=godot
pkgname=godot3-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="Advanced cross-platform 2D and 3D game engine (3.X Branch)"
arch=("x86_64")
url='https://godotengine.org'
license=('MIT')
depends=(libglvnd libxcursor libxi libxinerama libxrandr hicolor-icon-theme glibc libxrender libx11 bash libxext)
optdepends=(pipewire-alsa pipewire-pulse)
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_x11.64.zip"
	"https://github.com/godotengine/godot/archive/refs/tags/${pkgver}-stable.tar.gz")
sha256sums=('b6c0760382f90f15fcff5f5a08834c3dd61fbc0e8ba7927869593c5bedd48342'
            'cfed6125b59bfdf66e2abcd6d53a4ea79440f972bb6c32b2a12112f66af4d7e1')

package() {
	cd "${srcdir}"
	install -Dm755 Godot_v$pkgver-stable_x11.64 ${pkgdir}/usr/lib/godot3-bin/Godot_v$pkgver-stable_x11.64
	for folder in {/usr/share,/usr/bin/,/usr/share/applications,/usr/share/licenses,/usr/share/man,/usr/share/mime,/usr/share/metainfo};
	do
		mkdir -p "${pkgdir}${folder}"
	done

	cd "${srcdir}/godot-${pkgver}-stable/misc/dist/linux"
	sed -i 's/Godot Engine/Godot Engine LTS/g' org.godotengine.Godot.desktop
	sed -i 's/Exec=godot/Exec=godot3-bin/g' org.godotengine.Godot.desktop
	sed -i 's/Icon=godot/Icon=godot3-bin/g' org.godotengine.Godot.desktop
	install -Dm644 org.godotengine.Godot.desktop "${pkgdir}/usr/share/applications/org.godotengine.Godot3-bin.desktop"
	install -Dm644 org.godotengine.Godot.xml "${pkgdir}/usr/share/mime/packages/org.godotengine.Godot3-bin.xml"
	install -Dm644 org.godotengine.Godot.appdata.xml "${pkgdir}/usr/share/metainfo/org.godotengine.Godot3-bin.appdata.xml"
	install -Dm644 godot.6 "${pkgdir}/usr/share/man/man6/godot3-bin.6"
	cd "${srcdir}/godot-${pkgver}-stable/misc/dist"

	install -Dm644 project_icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/godot3-bin.svg"

	cd "$srcdir/godot-${pkgver}-stable"
	
	mkdir "${pkgdir}/usr/share/licenses/godot3-bin"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/godot3-bin/LICENSE.txt"


	cat >> "${pkgdir}/usr/bin/godot3-bin" <<-EOF
#!/bin/sh
/usr/lib/godot3-bin/Godot_v${pkgver}-stable_x11.64 "\$@"
EOF
	chmod +x "${pkgdir}/usr/bin/godot3-bin"
}
