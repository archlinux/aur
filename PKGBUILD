# Maintainer: Jonatã Bolzan Loss <jbopen@gmail.com>
#
# CI sets pkgver, _tag and the checksum for each stable release
# (.github/scripts/aur-build.sh); what is here is only a starting point.
pkgname=subtitld
pkgver=26.11.18.0034
_tag=v26.11
pkgrel=1
pkgdesc="Professional subtitle editor and dubbing application"
arch=('any')
url="https://subtitld.org"
license=('GPL-3.0-or-later')
depends=(
    'ffmpeg'
    # Live co-editing: media sent directly between collaborators.
    'libdatachannel'
    # Live co-editing's voice call.
    'opus'
    'portaudio'
    'pyside6'
    'python'
    'python-beautifulsoup4'
    'python-certifi'
    'python-chardet'
    'python-docx'
    'python-edge-tts'
    'python-gtts'
    'python-i18n'
    'python-lxml'
    'python-numpy'
    'python-opencv'
    'python-platformdirs'
    'python-pysidesix-frameless-window'
    'python-pysubs2'
    'python-scipy'
    'python-sounddevice'
    'python-soundfile'
    # Optional for pyside6 on Arch, but the app needs them: QtWebEngine
    # renders the preview's subtitles, QtWebSockets carries live co-editing.
    'qt6-multimedia'
    'qt6-svg'
    'qt6-webengine'
    'qt6-websockets'
    'hicolor-icon-theme'
)
optdepends=(
    'python-mediapipe: speaker face and mouth detection'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Subtitld/subtitld/archive/refs/tags/$_tag.tar.gz")
sha256sums=('333a7c299ad840a57dd9d66fad832e42b36d9c5685cdfcbe7cf3b56233664b3f')

# GitHub drops the tag's leading "v" from the archive's top directory.
_dir="$pkgname-${_tag#v}"

prepare() {
    cd "$_dir"
    # The tag's sources carry a placeholder version; the build's is pkgver.
    sed -i "s/^__version__ = .*/__version__ = '$pkgver'/" src/subtitld/__init__.py
}

build() {
    cd "$_dir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_dir"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 flatpak/org.subtitld.Subtitld.desktop \
        "$pkgdir/usr/share/applications/org.subtitld.Subtitld.desktop"
    install -Dm644 flatpak/org.subtitld.Subtitld.appdata.xml \
        "$pkgdir/usr/share/metainfo/org.subtitld.Subtitld.metainfo.xml"
    install -Dm644 flatpak/org.subtitld.Subtitld.mime.xml \
        "$pkgdir/usr/share/mime/packages/org.subtitld.Subtitld.xml"
    # Projects' thumbnails in file managers (subtitld-thumbnailer)
    install -Dm644 flatpak/org.subtitld.Subtitld.thumbnailer \
        "$pkgdir/usr/share/thumbnailers/org.subtitld.Subtitld.thumbnailer"
    for icon in flatpak/icons/hicolor/*/mimetypes/*; do
        install -Dm644 "$icon" "$pkgdir/usr/share/${icon#flatpak/}"
    done
    install -Dm644 src/subtitld/graphics/subtitld.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.subtitld.Subtitld.svg"
    install -Dm644 src/subtitld/graphics/subtitld.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/org.subtitld.Subtitld.png"
}
