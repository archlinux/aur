# Maintainer: kezuwoo <kezu15@proton.me>

pkgname=kitsune
pkgver=0.7.1
pkgrel=2
pkgdesc="AniLiberty player"
arch=('any')
url="https://altlinux.space/armatik/Kitsune"
license=('GPL-3.0-or-later')
install=kitsune.install

depends=(
'python'
'python-gobject'
'python-cairo'
'libadwaita'
'gtk4'
'gstreamer'
'gst-plugins-base'
'python-requests'
)

makedepends=('meson' 'ninja' 'git')

source=("git+https://altlinux.space/armatik/Kitsune.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Kitsune"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/Kitsune"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
    cd "$srcdir/Kitsune"
    DESTDIR="$pkgdir" meson install -C build

    # Копируем схемы и иконки в $pkgdir
    mkdir -p "$pkgdir/usr/share/glib-2.0/schemas"
    cp -f data/net.armatik.Kitsune.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/"

    mkdir -p "$pkgdir/usr/share/icons/hicolor"
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/net.armatik.Kitsune.desktop" <<EOF
[Desktop Entry]
Name=Kitsune
Exec=/usr/bin/kitsune
Type=Application
Categories=AudioVideo;Player;
EOF
}
