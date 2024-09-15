# Maintainer: supdrewin <supdrewin at outlook dot com>
# Co-Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Liao Junxuan <mikeljx@126.com>
# Contributor: Nathaniel van Diepen <eeems@eeems.email>

pkgname=linux-enable-ir-emitter-git
pkgver=6.0.3.r0.gb8ee83d
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter chicony-ir-toggle)

makedepends=(git meson cmake argparse qt6-base zlib gtk3)
depends=(bash cairo glib2 gdk-pixbuf2 gtk3 glibc gcc-libs)

install=linux-enable-ir-emitter.install
options=(emptydirs !buildflags)

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    pushd .github/workflows/deps
    cmake . -B build -GNinja
    ninja -C build
    popd
    meson setup --reconfigure build --libdir=lib --prefer-static --pkg-config-path=$(find .github -name "pkgconfig")
    meson configure build --optimization=s --prefix=/usr --strip
    meson compile -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    meson install -C build --destdir=${pkgdir}
    install -d "${pkgdir}/usr/lib/systemd/system"
    mv "${pkgdir}/etc/systemd/system/linux-enable-ir-emitter.service" "${pkgdir}/usr/lib/systemd/system/linux-enable-ir-emitter.service"
    rm -r "${pkgdir}/etc/systemd"
    rm "${pkgdir}/usr/share/doc/linux-enable-ir-emitter/README.md"
    install -d "${pkgdir}/usr/share/licenses"
    mv "${pkgdir}/usr/share/doc/linux-enable-ir-emitter" "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -r "${pkgdir}/usr/share/doc"
}
