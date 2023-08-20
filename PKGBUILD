# Maintainer: Frede Hundewadt <fh@uex.dk>

pkgname=piclone-git
pkgver=r129.f642256
pkgrel=1
pkgdesc="Raspberry Pi system clone utility"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/raspberrypi-ui/piclone"
license=(GPL2)
depends=(gtk3 glib2 parted dosfstools e2fsprogs coreutils util-linux zenity dbus gvfs)
makedepends=(git intltool)
source=("git+https://github.com/raspberrypi-ui/piclone.git"
        "arch.patch")
sha256sums=('SKIP'
            'eb60096d5f34f31eef08acb36af7590bcb5a0ddf5b2b22852f986d9b24d54357')

pkgver() {
    cd piclone
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd piclone
    patch -N -p1 < ${srcdir}/arch.patch
    ./autogen.sh
}

build() {
    cd piclone
    ./configure --prefix=/usr
    make
}

package() {
    cd piclone
    make DESTDIR="${pkgdir}/" install
    install -D -t "${pkgdir}/usr/lib/piclone/" data/pwdpic.sh
}

