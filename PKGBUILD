# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=godot
pkgname=godot3-mono-bin
pkgver=3.5.3
pkgrel=4
pkgdesc="Advanced cross-platform 2D and 3D game engine (3.X Branch Mono)"
arch=("x86_64")
url='https://godotengine.org'
license=('MIT')
depends=(libglvnd libxcursor libxi libxinerama libxrandr hicolor-icon-theme glibc libxrender libx11 bash libxext mono mono-msbuild)
optdepends=(pipewire-alsa pipewire-pulse)
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_x11_64.zip"
	"https://github.com/godotengine/godot/archive/refs/tags/${pkgver}-stable.tar.gz")
sha256sums=('7ef4cf25895efec516137b0f9f2d218d589e64f0208b611202b00c0aada7b04d'
            '643366a288fc529564d8bb42a42093d72071c8186f57ff03cae6d5929f81bd1d')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/lib/$pkgname" && cd "${srcdir}/Godot_v${pkgver}-stable_mono_x11_64"
	install -Dm755 Godot_v${pkgver}-stable_mono_x11.64 "${pkgdir}/usr/lib/${pkgname}/Godot_v${pkgver}-stable_mono_x11.64"
	rsync -a -r GodotSharp "${pkgdir}/usr/lib/$pkgname/"

	for folder in {/usr/share,/usr/bin/,/usr/share/applications,/usr/share/licenses,/usr/share/man,/usr/share/mime,/usr/share/metainfo};
	do
		mkdir -p "${pkgdir}${folder}"
	done

	cd "${srcdir}/godot-${pkgver}-stable/misc/dist/linux"
	sed -i 's/Godot Engine/Godot Engine Mono LTS/g' org.godotengine.Godot.desktop
	sed -i 's/Exec=godot/Exec=godot3-mono-bin/g' org.godotengine.Godot.desktop
	sed -i 's/Icon=godot/Icon=godot3-mono-bin/g' org.godotengine.Godot.desktop
	install -Dm644 org.godotengine.Godot.desktop "${pkgdir}/usr/share/applications/org.godotengine.Godot3-mono-bin.desktop"
	install -Dm644 org.godotengine.Godot.xml "${pkgdir}/usr/share/mime/packages/org.godotengine.Godot3-mono-bin.xml"
	install -Dm644 org.godotengine.Godot.appdata.xml "${pkgdir}/usr/share/metainfo/org.godotengine.Godot3-mono-bin.appdata.xml"
	install -Dm644 godot.6 "${pkgdir}/usr/share/man/man6/godot3-mono-bin.6"
	cd "${srcdir}/godot-${pkgver}-stable/misc/dist"

	install -Dm644 project_icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/godot3-mono-bin.svg"

	cd "$srcdir/godot-${pkgver}-stable"
	
	mkdir "${pkgdir}/usr/share/licenses/godot3-mono-bin"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/godot3-mono-bin/LICENSE.txt"


	cat >> "${pkgdir}/usr/bin/godot3-mono-bin" <<-EOF
#!/bin/sh
/usr/lib/${pkgname}/Godot_v${pkgver}-stable_mono_x11.64 "\$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/godot3-mono-bin"
}
