# Maintainer: Jat <chat@jat.email>

_pkgname='xrdp'
pkgname="$_pkgname-git"
pkgver=0.9.18.r444.g184287d8
pkgrel=1
pkgdesc='An open source remote desktop protocol (RDP) server. Git version, devel branch.'
url='https://github.com/neutrinolabs/xrdp'
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('nasm')
depends=('libxrandr' 'fuse' 'libfdk-aac' 'ffmpeg' 'imlib2')
checkdepends=('check')
optdepends=('tigervnc' 'tightvnc' 'realvnc-vnc-server')
backup=('etc/xrdp/sesman.ini'
        'etc/xrdp/xrdp.ini'
        'etc/xrdp/cert.pem'
        'etc/xrdp/key.pem'
        'etc/xrdp/startwm.sh')
source=("git+$url#branch=devel"
        "arch-config.diff")
sha256sums=('SKIP'
            'dea15a32e498332a83a3835bda013863ff3be5713f3de63553a0e881513d9fcb')
install="$pkgname.install"

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'
}

prepare() {
    cd "$srcdir/$_pkgname"

    # https://github.com/neutrinolabs/xrdp/pull/2649
    sed -i '/^#include <check\.h>$/d' tests/libxrdp/test_libxrdp_main.c
    patch -p2 -i"$srcdir/arch-config.diff"
}

build() {
    cd "$srcdir/$_pkgname"

    ./bootstrap
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --sbindir=/usr/bin \
                --with-systemdsystemunitdir=/usr/lib/systemd/system \
                --enable-jpeg \
                --enable-tjpeg \
                --enable-fuse \
                --enable-fdkaac \
                --enable-opus \
                --enable-rfxcodec \
                --enable-mp3lame \
                --enable-pixman \
                --enable-painter \
                --enable-vsock \
                --enable-ipv6 \
                --enable-pam-config=arch \
                --enable-rdpsndaudin \
                --with-imlib2

  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool

  make
}

check () {
    cd "$srcdir/$_pkgname"

    make check
}

package() {
    cd "$srcdir/$_pkgname"

    make DESTDIR="$pkgdir" install
    install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$_pkgname"

    rm "$pkgdir/etc/xrdp/rsakeys.ini"
}
