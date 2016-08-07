# Maintainer: Brottweiler <brott@oc.tc>
# Contributor: firstvirus92 <dev@firstvirus92.de>
# Contributor: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

# If you want support for your G15 Keyboard, please add 'g15daemon'
# to the depends and delete "no-g15" in the configure line below

pkgname=mumble-jack-git
pkgver=2016.08.07
_pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A voice chat application similar to TeamSpeak (GIT version with JACK Audio patch)'
url='https://github.com/mumble-voip/mumble'
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'speex' 'lsb-release' 'avahi' 'protobuf' 
        'jack' 'opus' 'xdg-utils' 'libxi' 'libsndfile')
makedepends=('boost' 'mesa' 'qt5-tools' 'git')
conflicts=('mumble')
provides=('mumble')
source=("${pkgname}"::'git://github.com/mumble-voip/mumble.git'
        'http://sourceforge.net/p/mumble/patches/_discuss/thread/1bfdbda2/a90e/attachment/mumble-jack-support.patch')
sha256sums=('SKIP'
            'ae56abc2d9b5725e7ff768b8ca29a569dc9051ef192d792372ef10f0e6c3f53d')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -n 1 --pretty=format:"%cd" --date=short | sed "s/-/./g"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    git submodule init
    git submodule update

    patch -Np1 < ${srcdir}/mumble-jack-support.patch
}

build() {
    cd "${srcdir}/${pkgname}"

    # Building mumble
    qmake-qt5 main.pro \
      CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-speechd no-g15 \
               no-xevie no-server no-embed-qt-translations no-update packaged \
               no-pulseaudio no-oss no-alsa" \
      DEFINES+="PLUGIN_PATH=/usr/lib/mumble"

    make release
}

package() {
    cd "${srcdir}/${pkgname}"

    # bin stuff
    install -m755 -D ./release/mumble ${pkgdir}/usr/bin/mumble
    install -m755 -D ./scripts/mumble-overlay ${pkgdir}/usr/bin/mumble-overlay

    # lib stuff
    install -m755 -D ./release/libmumble.so.${_pkgver} ${pkgdir}/usr/lib/mumble/libmumble.so.${_pkgver}
    ln -s libmumble.so.${_pkgver} ${pkgdir}/usr/lib/mumble/libmumble.so
    ln -s libmumble.so.${_pkgver} ${pkgdir}/usr/lib/mumble/libmumble.so.1
    ln -s libmumble.so.${_pkgver} ${pkgdir}/usr/lib/mumble/libmumble.so.${_pkgver:0:3}
    install -m755 -D ./release/plugins/liblink.so ${pkgdir}/usr/lib/mumble/liblink.so
    install -m755 -D ./release/libcelt* ${pkgdir}/usr/lib/mumble/

    # other stuff
    install -m644 -D ./scripts/mumble.desktop ${pkgdir}/usr/share/applications/mumble.desktop
    install -m755 -d ${pkgdir}/usr/share/man/man1
    install -m644 -D ./man/mum* ${pkgdir}/usr/share/man/man1/
    install -m644 -D ./icons/mumble.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/mumble.svg
    install -m644 -D ./LICENSE ${pkgdir}/usr/share/licenses/mumble/LICENSE
}
