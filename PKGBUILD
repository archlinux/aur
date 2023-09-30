# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=godot
pkgname=godot3-mono-bin
pkgver=3.5.3
pkgrel=2
pkgdesc="Advanced cross-platform 2D and 3D game engine (3.X Branch Mono)"
arch=("x86_64")
url='https://godotengine.org'
license=('MIT')
depends=(libglvnd libxcursor libxi libxinerama libxrandr) # Depends() is small due to godot binary static linking libraries
optdepends=(pipewire-alsa pipewire-pulse)
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_x11_64.zip"
	"https://github.com/godotengine/godot/archive/refs/tags/${pkgver}-stable.tar.gz")
sha256sums=('7ef4cf25895efec516137b0f9f2d218d589e64f0208b611202b00c0aada7b04d'
            '643366a288fc529564d8bb42a42093d72071c8186f57ff03cae6d5929f81bd1d')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/opt/godot3-mono-bin" && cd "${srcdir}/Godot_v${pkgver}-stable_mono_x11_64"
	install -Dm755 Godot_v${pkgver}-stable_mono_x11.64 "${pkgdir}/opt/godot3-mono-bin/Godot_v${pkgver}-stable_mono_x11.64"
	cp -r GodotSharp "${pkgdir}/opt/godot3-mono-bin/GodotSharp"

	for folder in {/usr/share,/usr/bin/,/usr/share/applications,/usr/share/licenses,/usr/share/man,/usr/share/mime,/usr/share/metainfo};
	do
		mkdir -p "${pkgdir}${folder}"
	done

	cd "${srcdir}/godot-${pkgver}-stable/misc/dist/linux"
	gzip -9 -c godot.6 > godot.6.gz
	sed -i 's/Godot Engine/Godot Engine Mono LTS/g' org.godotengine.Godot.desktop
	sed -i 's/Exec=godot/Exec=godot3-mono-bin/g' org.godotengine.Godot.desktop
	sed -i 's/Icon=godot/Icon=godot3-mono-bin/g' org.godotengine.Godot.desktop
	install -Dm644 org.godotengine.Godot.desktop "${pkgdir}/usr/share/applications/org.godotengine.Godot3-mono-bin.desktop"
	install -Dm644 org.godotengine.Godot.xml "${pkgdir}/usr/share/mime/packages/org.godotengine.Godot3-mono-bin.xml"
	install -Dm644 org.godotengine.Godot.appdata.xml "${pkgdir}/usr/share/metainfo/org.godotengine.Godot3-mono-bin.appdata.xml"
	install -Dm644 godot.6.gz "${pkgdir}/usr/share/man/man6/godot3-mono-bin.6.gz"
	cd "${srcdir}/godot-${pkgver}-stable/misc/dist"

	install -Dm644 project_icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/godot3-mono-bin.svg"

	cd "$srcdir/godot-${pkgver}-stable"
	
	mkdir "${pkgdir}/usr/share/licenses/godot3-mono-bin"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/godot3-mono-bin/LICENSE.txt"


	cat >> "${pkgdir}/usr/bin/godot3-mono-bin" <<-EOF
#!/bin/sh
/opt/godot3-mono-bin/Godot_v${pkgver}-stable_mono_x11.64
EOF
	echo '"$@"' >> "${pkgdir}/usr/bin/godot3-mono-bin"
	chmod +x "${pkgdir}/usr/bin/godot3-mono-bin"
}
