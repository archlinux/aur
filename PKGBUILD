# Maintainer: tblFlip <root@tblflip.de>

pkgname=tagstudio
pkgver=alpha9.4.2
pkgrel=2
pkgdesc="A User-Focused Photo & File Management System "
_pkgver=${pkgver#alpha}

arch=("x86_64")
url="https://github.com/TagStudioDev/TagStudio"
license=("GPL-3.0-only")

depends=(
	"python>=3.13"
	"python-humanfriendly>=10.0"
	"python-opencv>=4.8"
	"python-pillow>=10.3"
	"pyside6>=6.7"
	"python-typing_extensions>=3.10"
	"python-ujson>=5.8"
	"python-numpy>=1.26"
	"python-chardet>=5.2"
	"python-rawpy>=0.21"
	"python-pillow-heif>=0.16"
	"python-send2trash>=1.8.0"
	"python-ffmpeg-python>=0.2.0"
	"python-mutagen>=1.47.0"
	"python-vtf2img>=0.1.0"
	"python-pydub>=0.25.1"
	"qt6-tools"
	"qt6-multimedia"
	"qt6-svg"
)

makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools-scm"
)

source=(
	"$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz"
	"$pkgname.desktop"
	"$pkgname"
	"pyproject.toml.patch"
	"MANIFEST.in"
)

sha256sums=(
	"000220955118e679eceb0abb3c59a7c5a57b5410a0d05a04de0f9e6c0a966ac2"
	"75ef43dcb45445544daf48c002e5de8878c4e4a84408e607c817f582f7fa19d3"
	"7a611755db416558c892b083ce7c802c115f68bca86facfdb66cca29cf0ff36f"
	"3d39b447f47ed9d7dcf7974b587e6a99541bb15dbd82dcfcf4831ee4a0d28330"
	"ef8f9aa04aadb340d662197e74ba03c1bd0e1f14182c85653d537ee94babedeb"
)

provides=("$pkgname")
conflicts=("$pkgname")

build() {
	cd "TagStudio-$_pkgver"
	cp ../MANIFEST.in .
	patch < ../pyproject.toml.patch
	python -m build --wheel --no-isolation
}

package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	cd "TagStudio-$_pkgver"
	install -Dm644 "tagstudio/resources/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
