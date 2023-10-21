# Maintainer: Andreas Kling <arch@akling.org>
# Contributor: Ben Cooper <contactme@bengcooper.co.uk>
# Contributor: Johan Förberg <johan@forberg.se>
pkgname=magicq-beta
pkgver=1.9.5.2
pkgrel=2
pkgdesc='Lighting control software from ChamSys'
arch=(x86_64)
url='https://chamsyslighting.com/products/magicq'
license=(custom)
groups=()
conflicts=(magicq)
options=('!strip') # Binaries are already stripped.

_pkgver="${pkgver//[^[:alnum:]]/_}"
source=("http://files.magicq.co.uk/v${_pkgver}/magicq_ubuntu_v${_pkgver}.deb")
sha256sums=('cfe5ada2f81d0e96b86f2f5985f32c344819ce124856ccdf054c16216dab763e')

package() {
    depends=(alsa-lib ffmpeg glu gst-plugins-base gst-plugins-good
    libarchive libcups libusb libx11 libxcb qt5-multimedia qt5-webkit zlib)

    cd "$pkgdir"

    bsdtar xf "$srcdir/data.tar.xz"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/magicq/License_Conditions.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # We use the system libraries instead of the bundled binaries.
    rm -rf opt/magicq/lib*.so*

    # Magicq expects to be able to write these directories.
    # The directory list comes from the debian package postinst.
    chmod 777 opt/magicq

    for dir in log show web thumbs backuparchive convert audio; do
        mkdir -p "opt/magicq/$dir"
        chmod -R 777 "opt/magicq/$dir"
    done

    # Fix permissions from .deb file.
    find usr etc -type f -exec chmod 644 {} + , -type d -exec chmod 755 {} +

    mkdir -p usr/bin
    ln -s /opt/magicq/runmagicq.sh usr/bin/magicq
    ln -s /opt/magicq/runmagichd.sh usr/bin/magichd
    ln -s /opt/magicq/runmagicvis.sh usr/bin/magicvis
}
