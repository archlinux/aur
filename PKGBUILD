# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
pkgbase=pyvideokit
pkgname=(
    'python-pyvideokit'
    'python-pyvideokit-libs'
    'python-pyvideokit-cli'
    'python-pyvideokit-gui'
)
pkgver=0.3.0
pkgrel=1
pkgdesc="FFmpeg-based video processing tools"
arch=('any')
url="https://github.com/Evilchuck666"
license=('GPL-3.0-only')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=(
    "PyVideoKit-Libs::git+https://github.com/Evilchuck666/PyVideoKit-Libs.git"
    "PyVideoKit-CLI::git+https://github.com/Evilchuck666/PyVideoKit-CLI.git"
    "PyVideoKit-GUI::git+https://github.com/Evilchuck666/PyVideoKit-GUI.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    python -c "import tomllib; f=open('$srcdir/PyVideoKit-Libs/pyproject.toml','rb'); print(tomllib.load(f)['project']['version'])"
}

build() {
    cd "$srcdir/PyVideoKit-Libs"
    python -m build --wheel --no-isolation

    cd "$srcdir/PyVideoKit-CLI"
    python -m build --wheel --no-isolation

    cd "$srcdir/PyVideoKit-GUI"
    python -m build --wheel --no-isolation
}

package_python-pyvideokit() {
    pkgdesc="FFmpeg-based video processing tools (meta-package)"
    depends=(
        'python-pyvideokit-libs'
        'python-pyvideokit-cli'
        'python-pyvideokit-gui'
    )
    install -Dm644 "$srcdir/PyVideoKit-Libs/LICENSE" \
        "$pkgdir/usr/share/licenses/python-pyvideokit/LICENSE"
}

package_python-pyvideokit-libs() {
    pkgdesc="Python library for FFmpeg-based video processing"
    depends=(
        'python'
        'ffmpeg'
        'sox'
    )

    cd "$srcdir/PyVideoKit-Libs"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-pyvideokit-libs/LICENSE"
}

package_python-pyvideokit-cli() {
    pkgdesc="CLI for PyVideoKit — FFmpeg-based video processing"
    depends=(
        'python'
        'python-click'
        'python-rich'
        'python-pyvideokit-libs'
    )

    cd "$srcdir/PyVideoKit-CLI"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Uncomment once LICENSE is added to PyVideoKit-CLI repo:
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-pyvideokit-cli/LICENSE"
}

package_python-pyvideokit-gui() {
    pkgdesc="GUI for PyVideoKit — FFmpeg-based video processing"
    depends=(
        'python'
        'pyside6'
        'python-pyvideokit-libs'
    )

    cd "$srcdir/PyVideoKit-GUI"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # .desktop file
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/pvk-gui.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=PyVideoKit
GenericName=Video Processing Tool
Comment=FFmpeg-based video processing GUI
Exec=pvk-gui
Icon=pvk-gui
Categories=AudioVideo;Video;AudioVideoEditing;
Terminal=false
Keywords=video;ffmpeg;trim;fade;vhs;youtube;convert;
EOF

    # Icon — clapperboard SVG
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/pvk-gui.svg" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
  <!-- Slate body -->
  <rect x="4" y="14" width="40" height="30" rx="3" fill="#2d3561"/>
  <!-- Screen area -->
  <rect x="10" y="19" width="28" height="20" rx="2" fill="#1a2038"/>
  <!-- Play triangle -->
  <polygon points="18,21 18,37 33,29" fill="#ff6b6b"/>
  <!-- Clapper bar -->
  <rect x="4" y="6" width="40" height="8" rx="2" fill="#ff6b6b"/>
  <!-- Clapper white stripes -->
  <rect x="11" y="6" width="6" height="8" fill="#ffffff"/>
  <rect x="23" y="6" width="6" height="8" fill="#ffffff"/>
  <rect x="35" y="6" width="5" height="8" fill="#ffffff"/>
</svg>
EOF
}
