# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

options=('!debug')

pkgname=xl-converter
pkgver=1.3.0
pkgrel=2
pkgdesc="Easy-to-use image converter for modern formats (JPEG XL, AVIF, JPEGLI, WebP)"
arch=('any')
url="https://github.com/JacobDev1/xl-converter"
license=('GPL-3.0-only')
depends=(
    'python'
    'pyside6'
    'python-send2trash'
    'python-requests'
    'python-psutil'
    'libjxl'
    'libavif'
    'imagemagick'
    'oxipng'
    'perl-image-exiftool'
)
# JPEGLI (the app's default JPEG encoder) needs cjpegli, which libjxl 0.12
# no longer ships (jpegli moved to its own repo). The cjpegli symlink below
# becomes functional once this is installed.
optdepends=('jpegli-tools-git: cjpegli for JPEGLI JPEG encoding (app default)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JacobDev1/xl-converter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b04e14dcd4d53ba6c433a12c4095233b34370436341280acd5b4be8df3af8ca7')

package() {
    cd "xl-converter-$pkgver"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r . "$pkgdir/opt/$pkgname/"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec python /opt/$pkgname/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # The app resolves encoders only under its own bin/linux/
    # (data/constants.py), which the GitHub tarball does not ship.
    # Link the system binaries there.
    local b="$pkgdir/opt/$pkgname/bin/linux"
    install -dm755 "$b/imagemagick"
    for t in cjxl djxl jxlinfo cjpegli avifenc avifdec oxipng jpegtran; do
        ln -s /usr/bin/$t "$b/$t"
    done
    ln -s /usr/bin/magick "$b/imagemagick/magick"

    install -Dm644 assets/icons/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=XL Converter
Comment=Image converter for modern formats
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Graphics;
EOF
}