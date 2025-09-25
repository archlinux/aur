# Maintainer: Andreas Kling <arch@akling.org>
# Contributor: Ben Cooper <contactme@bengcooper.co.uk>
# Contributor: Johan Förberg <johan@forberg.se>
pkgname=magicq-beta
pkgver=1.9.8.0
pkgrel=1
pkgdesc='Lighting control software from ChamSys'
arch=(x86_64)
url='https://chamsyslighting.com/products/magicq'
license=(custom)
groups=()
conflicts=(magicq)
options=('!strip') # Binaries are already stripped.

_pkgver="${pkgver//[^[:alnum:]]/_}"
source=("http://files.magicq.co.uk/v${_pkgver}/magicq_ubuntu_v${_pkgver}.deb")
sha256sums=('1b039b5d87f0125aa6fcd8b4d7f0e3bb10bfda9acf9e46185ccbc5f137977f28')

package() {
    depends=(
        alsa-lib
        jack
        gst-plugins-base
        gst-plugins-good
        libcups
        libgl
        libx11
        libxcb
        udev
        zlib
    )

    cd "$pkgdir"

    bsdtar xf "$srcdir/data.tar.xz"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/magicq/License_Conditions.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # We use the system libraries instead of the bundled binaries:
    # https://secure.chamsys.co.uk/help/documentation/magicq/troubleshooting.html#_linux_magicq_fails_to_start_libgl_error
    rm -rf opt/magicq/lib/libstdc++.so.6
    # There are different JACK implementations, their client libraries and daemons are not compatibible with each other 
    rm -rf opt/magicq/lib/libjack.so.0

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
