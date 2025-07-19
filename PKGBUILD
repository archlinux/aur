# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

_pkgname=tuner
pkgname=$_pkgname-git
pkgver=2.0.0.r0.gabb0272
pkgrel=1
pkgdesc="GNU/Linux app to discover and play internet radio stations. Geared towards RadioBrowser"
arch=('x86_64' 'i686')
url="https://github.com/louis77/${_pkgname}"
license=('GPL-3.0-only')
depends=('granite' 'gst-plugins-bad-libs' 'gst-plugins-good')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's|^v||;s|-|.r|;s|-|.|'
}

prepare() {
    # Remove the invocation of glib-compile-schemas from the upstream install schema. It prevents building in a clean chroot and
    # isn't needed as the task is covered by a pacman hook.
    # Details in upstream issue #215 (https://github.com/louis77/tuner/issues/215).
    sed -i '/^meson.add_install_script.*glib-compile-schemas/d' tuner/data/meson.build
}

build() {
    arch-meson "${_pkgname}" 'build'
    meson compile -C 'build'
}

package() {
    DESTDIR="${pkgdir}" meson install -C 'build'
    cd "${pkgdir}"/usr/bin/
    ln -s com.github.louis77.tuner tuner
}
