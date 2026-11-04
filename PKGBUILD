# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=tuner
pkgver=2.2.1
pkgrel=1
pkgdesc="Minimalist radio station player geared towards RadioBrowser"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/tuner-labs/${pkgname}"
license=('GPL-3.0-only')
depends=('gtk3' 'libgee' 'gst-plugins-good')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'dont-update-gsettings-schemas-at-build-time.patch')
sha256sums=('ba36c0dc4164b598ba109ea90c71d7b43674072521c579ade96f2815efeda06c'
            'cdf42ae339ae4c837811b302f127846f2a9aee3af19fc824b5743aa7c91d8008')

prepare() {
    cd "${pkgname}-${pkgver}"
    for p in "${srcdir}"/*.patch
    do
        echo "Applying patch $(basename "${srcdir}"/${p})"
        patch -p1 -i "${p}"
    done
}

build() {
    arch-meson "${pkgname}-${pkgver}" 'build'
    meson compile -C 'build'
}

package() {
    DESTDIR="${pkgdir}" meson install -C 'build'
    cd "${pkgdir}"/usr/bin/
    ln -s io.github.tuner_labs.tuner tuner
}
