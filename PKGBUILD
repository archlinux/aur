# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=magicq
pkgver=1.7.3.8
pkgrel=1
pkgdesc='Lighting control software from Chamsys'
arch=(x86_64)
url='https://secure.chamsys.co.uk/magicq'
groups=()
depends=(ffmpeg-compat-55 libcups glu qt5-multimedia libusb-compat qt5-webkit
         libarchive)
options=('!strip') # Binaries are already stripped.

# You can obtain this file from https://secure.chamsys.co.uk/download
source=("local://magicq_${pkgver}_amd64.deb")
sha1sums=('66d027f2faa2c19f839b6b0a223131716e01c5bc')

# I've been unable to find any formal license for Magicq. The website only
# states that it's available free of charge. There don't seem to be any
# restrictions on use, except that some features are disabled unless Chamsys
# hardware is detected.
license=(unknown)

package() {
    cd "$pkgdir"

    bsdtar xf "$srcdir/data.tar.gz"

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
