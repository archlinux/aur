# Maintainer: tblFlip <root@tblflip.de>

pkgname=tagstudio
pkgver=alpha9.5.2
pkgrel=2
pkgdesc="A User-Focused Photo & File Management System "
_pkgver=${pkgver#alpha}

arch=("x86_64")
url="https://github.com/TagStudioDev/TagStudio"
license=("GPL-3.0-only")

depends=(
	"python>=3.13"
	"python-humanfriendly>=10.0"
	"python-opencv>=4.10.0.84"
	"python-pillow>=10.3"
    "python-pillow-avif-plugin"
	"python-pillow-jpegxl-plugin>=1.3.0"
	"pyside6>=6.8.0.1"
	"python-typing_extensions>=3.10"
	"python-ujson>=5.8"
	"python-numpy>=2.1.9"
	"python-chardet>=5.2"
	"python-rawpy>=0.22"
	"python-pillow-heif>=0.16"
	"python-send2trash>=1.8.0"
	"python-ffmpeg-python>=0.2.0"
	"python-mutagen>=1.47.0"
	"python-vtf2img>=0.1.0"
	"python-pydub>=0.25.1"
	"python-sqlalchemy>=2.0.34"
	"python-structlog>=24.4.0"
	"python-toml>=0.10.2"
	"python-pydantic>=2.9.2"
	"qt6-tools"
	"qt6-multimedia"
	"qt6-svg"
	"dbus"
	"ffmpeg"
)

optdepends=(
	"libva"
	"libvdpau"	
	"libxrandr"
	"pipewire"
	"qt-wayland"
)

makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools-scm"
	"python-hatchling"
)

source=(
	"$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz"
	"$pkgname.desktop"
	"$pkgname"
	"MANIFEST.in"
    "fix_avif.patch"
)

sha256sums=(
	"2a034db1310c9d16b209094ed4d4c23cad3ef46b5de5eb87855694d06954fe38"
	"75ef43dcb45445544daf48c002e5de8878c4e4a84408e607c817f582f7fa19d3"
	"7a611755db416558c892b083ce7c802c115f68bca86facfdb66cca29cf0ff36f"
	"ef8f9aa04aadb340d662197e74ba03c1bd0e1f14182c85653d537ee94babedeb"
	"cdc2b1c82b7335e4ff56a0f4d36be69fef541757cad19fe0e08466962dde8e66"
)

provides=("$pkgname")
conflicts=("$pkgname")

prepare() {
    cd "TagStudio-$_pkgver"
    patch -p1 < ../fix_avif.patch
}

build() {
	cd "TagStudio-$_pkgver"
	# setuptools allegedly does not support PEP-639 yet
	sed -i 's/license = "GPL-3.0-only"/license = {text = "GPL-3.0-only"}/' pyproject.toml
	# python-opencv currently does not ship cv2.typing
	sed -i 's/from cv2.typing import MatLike/class MatLike: pass/' src/tagstudio/qt/widgets/thumb_renderer.py
	python -m build --wheel --no-isolation
}

package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "TagStudio-$_pkgver"
	install -Dm644 "src/tagstudio/resources/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
