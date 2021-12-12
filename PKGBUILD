# Maintainer: genofire <geno+dev@fireorbit.de>
# Contributor: la Fleur <lafleur at boum dot org>

_pkgname="purism-chatty"
pkgname="${_pkgname}-git" # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.5.0_beta3.r1.g73caf3d
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
source=("git+https://source.puri.sm/Librem5/chatty.git")
md5sums=(SKIP)
license=("LGPL2.1")
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
depends=("evolution-data-server"
         "feedbackd"
         "gtk4"
         "libhandy"
         "libpurple"
         "gspell"
         "libmm-glib")
optdepends=("feedbackd: haptic, visual and audio feedback"
            "libpurple-carbons: XMPP Carbon Copy - Live multiple device support"
            "libpurple-lurch: message encryption when using OMEMO"
            "mmsd-tng: support MMS send/receive"
            "purple-telegram: Telegram support"
            "purple-matrix: Matrix support")
makedepends=("git" "pkg-config" "meson" "libolm")
provides=("purism-chatty")
conflicts=("purism-chatty")
# Keep the source in a version-independent directory, so on update we simply
# git pull into it.

pkgver() {
    git -C ${_pkgname} describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # Only setup the build directory if it doesn't exist :
    test -d build || arch-meson ${_pkgname} build
    ninja -C build
}

check() {
	ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
