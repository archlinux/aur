# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>
# Contributor: Andreas Kling <arch@akling.org>
# Contributor: Johan Förberg <johan@forberg.se>
pkgname=magicq
pkgver=1.9.7.3
pkgrel=1
pkgdesc='Lighting control software from ChamSys'
arch=(x86_64)
url='https://chamsyslighting.com/products/magicq'
license=(custom)
groups=()
conflicts=(magicq-beta)
options=('!strip') # Binaries are already stripped.

_pkgver="${pkgver//[^[:alnum:]]/_}"
source=("http://files.magicq.co.uk/v${_pkgver}/magicq_ubuntu_v${_pkgver}.deb")
sha256sums=('16c552b7d8888702ffc08d97626289ac0efcd34c05436a89fee1776db30bc344')

package() {
    depends=(alsa-lib jack gst-plugins-base gst-plugins-good libarchive libcups
             libgl libx11 libxcb udev zlib)

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
