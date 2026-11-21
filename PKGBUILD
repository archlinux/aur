# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgbase=snappie-git
pkgname=(snappie-git snappie-purpose-git)
pkgver=0.1.0.r9.g99b2060
pkgrel=1
pkgdesc='Screenshots, annotation, recording and sharing for KDE Plasma on Wayland (Git)'
arch=(x86_64)
url='https://github.com/licentiapoetica/snappie'
license=(MIT)
makedepends=(git python-build python-installer python-setuptools python-wheel python-dbus
             cmake wayland purpose kcoreaddons qt6-base desktop-file-utils)
options=('!debug')
source=('snappie::git+https://github.com/licentiapoetica/snappie.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/snappie"
    local version
    if version=$(git describe --tags --long --abbrev=7 --match 'v[0-9]*' 2>/dev/null); then
        printf '%s\n' "${version#v}" | sed -E 's/-([0-9]+)-g([0-9a-f]+)$/.r\1.g\2/; s/-/./g'
    else
        printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$srcdir/snappie"
    python -m build --wheel --no-isolation
    cmake -S snappie/purpose -B build-purpose \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build-purpose
}

package_snappie-git() {
    depends=(python python-pyqt6 qt6-svg python-dbus
             python-gobject python-numpy python-requests gstreamer gst-plugin-pipewire
             gst-plugins-base gst-plugins-good gst-plugins-bad-libs ffmpeg wayland
             'kwin>=6' kglobalacceld kservice)
    optdepends=('gst-plugin-va: hardware video encoding'
                'python-evdev: clicks and keys in recordings'
                'tesseract: text recognition (also install your language data)'
                'pipewire: selecting which apps to record audio from'
                'openssh: SFTP uploads'
                'snappie-purpose-git: KDE Share menu integration')
    provides=("snappie=$pkgver")
    conflicts=(snappie)

    cd "$srcdir/snappie"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 snappie/icons/snappie.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/snappie.svg"
    install -dm755 "$pkgdir/usr/share/applications"
    python -c 'from snappie.hotkeys import desktop_entry; print(desktop_entry("/usr/bin/snappie"))' \
        > "$pkgdir/usr/share/applications/snappie.desktop"
}

package_snappie-purpose-git() {
    pkgdesc='Snappie integration in KDE Share menus (Git)'
    depends=("snappie-git=$pkgver-$pkgrel" purpose kcoreaddons qt6-base)
    provides=("snappie-purpose=$pkgver")
    conflicts=(snappie-purpose)
    cd "$srcdir/snappie"
    DESTDIR="$pkgdir" cmake --install build-purpose
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/dbus-1/services"
    cat > "$pkgdir/usr/share/dbus-1/services/io.github.snappie.service" <<'EOD'
[D-BUS Service]
Name=io.github.snappie
Exec=/usr/bin/snappie service
EOD
}
