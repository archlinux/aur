# Maintainer: Frede Hundewadt <fh@uex.dk>

pkgname=piclone-git
pkgver=r160.8b9c6c6
pkgrel=1
pkgdesc="Raspberry Pi system clone utility"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/raspberrypi-ui/piclone"
license=(GPL2)
depends=(gtk3 glib2 parted dosfstools e2fsprogs coreutils util-linux zenity dbus gvfs)
makedepends=(git intltool meson cmake wayland-protocols)
source=(
    "git+https://github.com/raspberrypi-ui/piclone.git"
    "https://archive.raspberrypi.com/debian/pool/main/s/sudopwd/sudopwd_0.3.tar.xz"
    )

sha256sums=('SKIP'
            'd4989ff0ea15ce4b0bc53f9b5b04fba96e003865eb7a9d6b75228f98c56c3d31')

pkgver() {
    cd piclone
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # piclone
    cd "${srcdir}/piclone"
    if [[ -d builddir ]]; then
        rm -r ./builddir
    fi
    meson setup builddir --prefix=/usr

    # sudopwd
    cd "${srcdir}/sudopwd"
    if [[ -d builddir ]]; then
        rm -r ./builddir
    fi
    meson setup builddir --prefix=/usr
}

build() {
    # piclone
    cd ${srcdir}/piclone/builddir
    meson compile

    # sudopwd
    cd ${srcdir}/sudopwd/builddir
    meson compile
}

package() {
    local piclone_src="${srcdir}/piclone"
    local sudopwd_src="${srcdir}/sudopwd"
    # install piclone files
    install -D -t "${pkgdir}/usr/share/applications" ${piclone_src}/builddir/data/piclone.desktop
    install -D -t "${pkgdir}/usr/share/piclone" ${piclone_src}/data/piclone.ui
    install -D -t "${pkgdir}/usr/bin" ${piclone_src}/builddir/src/piclone
    install -d "${pkgdir}/usr/share/locale"
    cp -r ${piclone_src}/po/* ${pkgdir}/usr/share/locale

    # install sudopwd files
    install -D -t "${pkgdir}/usr/bin" ${sudopwd_src}/builddir/src/sudopwd
    install -D -t "${pkgdir}/usr/share/sudopwd" ${sudopwd_src}/src/sudopwd.ui
    install -D -t "${pkgdir}/usr/share/applications" ${sudopwd_src}/data/sudopwd.desktop
}
