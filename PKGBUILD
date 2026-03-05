# Maintainer: Chris Na <buxel.dev@gmail.com>
# Contributor: 0x00002a <markus@optiikka.io>

pkgname=libfprint-goodixtls511-git
pkgver=r1813.8c36740
pkgrel=1
pkgdesc="libfprint with Goodix GF511 (27c6:5110) TLS fingerprint sensor driver"
arch=('x86_64')
url="https://github.com/buxel/libfprint.git"
license=('LGPL-2.1-or-later')

# Replaces the official libfprint so fprintd and pam_fprintd keep working
provides=('libfprint' 'libfprint-2.so=2-64')
conflicts=('libfprint' 'libfprint-goodixtls-git')
# replaces=('libfprint-goodixtls-git')  # intentionally omitted: goodixtls-git covers
                                         # multiple Goodix TLS sensors; only replace it
                                         # if the user explicitly chooses this package

depends=('glib2' 'glibc' 'gnutls' 'libgudev' 'libgusb' 'openssl' 'pixman')
makedepends=('git' 'meson' 'pkgconf' 'glib2-devel')
optdepends=('fprintd: D-Bus daemon for fingerprint authentication')

_branch="goodixtls-upstream-mr"
source=("${pkgname}::git+${url}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    meson setup build \
        --buildtype=release \
        --prefix=/usr \
        -Ddoc=false \
        -Dgtk-examples=false \
        -Dintrospection=false \
        -Dinstalled-tests=false \
        -Dgoodixtls=enabled
    ninja -C build
}

check() {
    cd "${srcdir}/${pkgname}"
    ninja -C build test
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C build install

    # Install udev rules so the sensor is accessible without root
    # (ninja install already handles this via meson's udev_rules_dir detection)
}
