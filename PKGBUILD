# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=isight-firmware-tools
pkgver=1.6
pkgrel=1
pkgdesc="Tools to manipulate firmware for Built-in iSight found on Apple machines"
arch=("x86_64")
url="https://gitlab.com/bersace/isight-firmware-tools"
license=("GPL2")
source=("git+https://gitlab.com/bersace/isight-firmware-tools")
sha256sums=("SKIP")
depends=("libusb-compat")
makedepends=("intltool" "gcc")

build() {
    cd "${srcdir}"/"$pkgname"

    sed -i 's/ doc//' Makefile.am

    sed -i 's/fprintf(stderr, g_option_context_get_help(context,/fprintf(stderr, "%s", g_option_context_get_help(context,/' src/export.c

    sed -i 's/fprintf(stderr, g_option_context_get_help(context,/fprintf(stderr, "%s", g_option_context_get_help(context,/' src/extract.c

    sed -i 's/fprintf(stderr, g_option_context_get_help(context,/fprintf(stderr, "%s", g_option_context_get_help(context,/' src/udev.c

    autoreconf --install

    ./configure --prefix=/usr --sysconfdir=/etc

    make
}

package() {
    cd "${srcdir}"/"$pkgname"

    make DESTDIR="${pkgdir}" install

    sed -i 's|/lib/firmware/isight.fw|/usr/lib/firmware/isight.fw|' "${pkgdir}"/etc/udev/rules.d/isight.rules
}