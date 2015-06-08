# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=wireshark-git
pkgver=51933.b2689ab
pkgrel=1
pkgdesc="A free network protocol analyzer for Unix/Linux. GIT version"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk3' 'libpcap' 'gnutls' 'c-ares' 'e2fsprogs' 'lua' 'portaudio' 'geoip' 'libsmi'
         'krb5' 'perl-parse-yapp' 'python2')
makedepends=('git')
url="http://www.wireshark.org/"
sha1sums=('dd9b14967b1ab16d6bd75af4ea790df50a8e397e'
          'd57aa736a9864a2ed518aec4f463f3bb30a5edd5'
          'SKIP')
replaces=('ethereal')
provides=('wireshark')
_gitmod='wireshark'
source=("wireshark.desktop"
		"wireshark.png"
		"$_gitmod::git+https://code.wireshark.org/git/wireshark")
conflicts=('wireshark-gtk')
options=('strip' '!libtool')
install=$pkgname.install


pkgver() {
    cd $srcdir/$_gitmod
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_gitmod
    ./autogen.sh

    mkdir $srcdir/build
    cd $srcdir/build

    /usr/lib/python2.7/Tools/scripts/reindent.py $srcdir/$_gitmod/tools/ncp2222.py

    $srcdir/$_gitmod/configure \
    --prefix=/usr \
    --with-ssl \
    --with-krb5 \
    --with-zlib=yes \
    --with-lua=/usr/include/ \
    --with-portaudio \
    --with-python=/usr/bin/python2 \
    --enable-aircap \
    LDFLAGS="-llua" \
    CFLAGS="-Wno-error=old-style-definition -Wno-error=clobbered -Wno-error=unused-but-set-variable -fno-unit-at-a-time"

    make ${MAKEFLAGS} PYTHON=/usr/bin/python2 
}

package() {
    cd $srcdir/build
    make ${MAKEFLAGS} DESTDIR=${pkgdir} install

    install -Dm644 ${srcdir}/wireshark.png ${pkgdir}/usr/share/icons/wireshark.png
    install -Dm644 ${srcdir}/wireshark.desktop ${pkgdir}/usr/share/applications/wireshark.desktop

    cd $pkgdir/usr/lib/
    ln -s libwsutil.so.0 libwsutil.so.3
    ln -s libwiretap.so.0 libwiretap.so.3
}

# vim:set ts=2 sw=2:
