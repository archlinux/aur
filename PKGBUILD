# Maintainer: Kimiblock Moe

pkgname=amulet-map-editor-git

pkgdesc="The new age Minecraft world editor and converter that supports every version since Java 1.12 and Bedrock 1.7"
url="https://www.amuletmc.com/"
license=(custom)

arch=(any)
pkgver=0.10.26.r4.g9a3d9c5a
pkgrel=1
makedepends=(python-build python-installer python-wheel)

depends=(python python-numpy python-wxpython python-opengl python-amulet-nbt python-pymctranslate python-minecraft-model-reader python-amulet-core python-lz4 python-amulet-leveldb)

provides=(amulet-map-editor amulet-map-editor-git)
conflicts=(amulet-map-editor amulet-map-editor-git)

source=(
	amulet.desktop
	icon.png
	"git+https://github.com/Amulet-Team/Amulet-Map-Editor.git"
)

sha256sums=(
	"SKIP"
	"SKIP"
	"SKIP"
)

function prepare() {
	cd "${srcdir}/Amulet-Map-Editor"
	sed -i 's/versioneer-518/versioneer/g' "${srcdir}/Amulet-Map-Editor/pyproject.toml"
}

function pkgver() {
	cd "${srcdir}/Amulet-Map-Editor"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function build() {
	cd "${srcdir}/Amulet-Map-Editor"
	python -m build --wheel --no-isolation
}

function package() {
	install -Dm755 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/amulet.png"
	install -Dm644 "${srcdir}/amulet.desktop" "${pkgdir}/usr/share/applications/amulet.desktop"
	cd "${srcdir}/Amulet-Map-Editor"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
