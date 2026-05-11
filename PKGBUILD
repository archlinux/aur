# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

_pkgname=tuner
pkgname=$_pkgname-git
pkgver=2.1.1.beta.1.r79.g8a05367
pkgrel=1
pkgdesc="Minimalist radio station player geared towards RadioBrowser"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/tuner-labs/${_pkgname}"
license=('GPL-3.0-only')
depends=('gtk3' 'libgee' 'gst-plugins-bad-libs')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git#branch=development"
        'dont-update-gsettings-schemas-at-build-time.patch')
sha256sums=('SKIP'
            'cdf42ae339ae4c837811b302f127846f2a9aee3af19fc824b5743aa7c91d8008')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    for p in "${srcdir}"/*.patch
    do
        echo "Applying patch $(basename "${srcdir}"/${p})"
        patch -p1 -i "${p}"
    done
}

build() {
    arch-meson "${_pkgname}" 'build'
    meson compile -C 'build'
}

package() {
    DESTDIR="${pkgdir}" meson install -C 'build'
    cd "${pkgdir}"/usr/bin/
    ln -s io.github.tuner_labs.tuner tuner
}
