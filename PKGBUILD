# Maintainer: Pedro Montes Alcalde <pedro.montes.alcalde@gmail.com>
# Contributor: Pedro Montes Alcalde <pedro.montes.alcalde@gmail.com>
_pkgname="vita3k"
pkgname="${_pkgname}-bin"
pkgver=r4036.40ce476b2
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
	"vita3k.desktop"
)
b2sums=(
	'SKIP'
	'6331bd061fe93fea5fb9ae57667cdb7ff081efa27681e25b94c54da748809e52d933afa96465b7d14ca0d286b0c47e66328a5080acef6760a88a39c65bf2321c'
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

    install -Dm644 "bin/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 "bin/COPYING.txt" "$pkgdir/usr/share/licenses/$_pkgname/COPYING.txt"
    install -Dm755 "bin/Vita3K" "$pkgdir/usr/bin/vita3k"
    rm -f "bin/README.md"
    rm -f "bin/COPYING.txt"
    rm -f "bin/Vita3K"

    # Once everything is taken care of, we can copy everything to /usr/share/
    mkdir -p "$pkgdir/usr/share/$_pkgname/"
    cp -r "bin/"* "$pkgdir/usr/share/$_pkgname/"

	install -Dm644 "${srcdir}/vita3k.desktop" "${pkgdir}/usr/share/applications/vita3k.desktop"
	install -Dm644 "bin/data/image/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

	rm vita3k.zip
}
