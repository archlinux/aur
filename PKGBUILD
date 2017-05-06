pkgname=rtmpdump-ksv-git
_gitname=rtmpdump
pkgver=r507.3a69b31
pkgrel=2
pkgdesc="A version of rtmpdump-git including numerous patches released by KSV."
arch=('i686' 'x86_64')
url="http://stream-recorder.com/forum/-t16103.html"
license=('GPL2' 'LGPL2.1')
depends=('gnutls')
conflicts=('rtmpdump' 'rtmpdump-svn' 'rtmpdump-git' 'rtmpdump-ksv')
provides=('rtmpdump' 'rtmpdump-git')
source=('git://git.ffmpeg.org/rtmpdump#commit=3a69b31' 'Patch.diff')
sha256sums=('SKIP'
            '64732ef333a85c08781cfd7b70dcc034380514a7dcd2938369c2e0f76851ae05')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/$_gitname"
    patch -p0 -i "$srcdir/Patch.diff"
    sed -e 's/^CRYPTO=OPENSSL/#CRYPTO=OPENSSL/' -e 's/#CRYPTO=GNUTLS/CRYPTO=GNUTLS/' -i Makefile -i librtmp/Makefile
    sed -e 's/VERSION=v2.4/VERSION=v2.4.KSV/' -i Makefile -i librtmp/Makefile
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -d -m755 "${pkgdir}/usr/lib"
  make prefix=/usr sbindir=/usr/bin \
    mandir=/usr/share/man DESTDIR="$pkgdir" \
    install
}
