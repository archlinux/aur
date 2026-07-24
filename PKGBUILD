# Maintainer: Pedro Montes Alcalde <pedro.montes.alcalde@gmail.com>
# Contributor: Pedro Montes Alcalde <pedro.montes.alcalde@gmail.com>
_pkgname="vita3k"
pkgname="${_pkgname}-bin"
pkgver=r4066.5ded8c78f
pkgrel=1
pkgdesc="Experimental PlayStation Vita emulator"
arch=('x86_64')
url="https://vita3k.org/"
license=('GPL2')
depends=(
	'gtk3'
	'sdl3'
    'qt6-base'
    'qt6-multimedia'
    'qt6-tools'
    'qt6-svg'
	'unzip'
	'xdg-desktop-portal'
)
optdepends=(
	'vulkan-validation-layers: Descriptive vulkan errors'
)
makedepends=(
    'curl'
    'jq'
    'awk'
)
provides=('vita3k')
conflicts=('vita3k')
source=(
	"${_pkgname}.zip::https://github.com/Vita3K/Vita3K/releases/download/continuous/ubuntu-latest.zip"
	"org.vita3k.vita3k.desktop"
)
b2sums=(
	'SKIP'
	'466b1957f8eab6b2df51c6580fe3bbc7a9932b3f76b6948cfdacfe51e87caae4a45bf5b6635393350bd1cd4ef3b22e70897dffbe75f3d8a452bdf807f56a7230'
)

pkgver() {
    local release_body=$(curl -sL https://api.github.com/repos/Vita3K/Vita3K/releases/latest | jq '.body')

    commit=$(echo "$release_body" | awk '/Corresponding commit:/ {print $3}')
    local short_sha=${commit:0:9}

    build_number=$(echo "$release_body" | awk '/Vita3K Build:/ {print $5}' | tr -d '"')

	echo "r${build_number}.${short_sha}"
}

package() {
	unzip -o vita3k.zip -d bin

	install -Dm644 "bin/COPYING.txt" "$pkgdir/usr/share/licenses/$_pkgname/COPYING.txt"
    install -Dm644 "bin/org.vita3k.vita3k.metainfo.xml" "$pkgdir/usr/share/metadata/org.vita3k.vita3k.metainfo.xml"
    install -Dm644 "bin/org.vita3k.vita3k.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.vita3k.vita3k.svg"
	install -Dm644 "bin/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm755 "bin/Vita3K" "$pkgdir/usr/bin/vita3k"
    rm -f "bin/COPYING.txt"
    rm -f "bin/org.vita3k.vita3k.metainfo.xml"
    rm -f "bin/org.vita3k.vita3k.svg"
    rm -f "bin/README.md"
    rm -f "bin/Vita3K"

    # Once everything is taken care of, we can copy everything to /usr/share/
    mkdir -p "$pkgdir/usr/share/$_pkgname/"
    cp -r "bin/"* "$pkgdir/usr/share/$_pkgname/"

	install -Dm644 "${srcdir}/org.vita3k.vita3k.desktop" "${pkgdir}/usr/share/applications/org.vita3k.vita3k.desktop"

	rm vita3k.zip
}
