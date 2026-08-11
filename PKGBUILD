# Maintainer: Javier Tia <floss@jetm.me>

# Named for the binary rather than the upstream project because the AUR already
# carries mfgtools (SpieringsAE) and mfgtools-git (taotieren), both actively
# maintained. All of them install /usr/bin/uuu, hence the conflicts below.
pkgname=uuu
pkgver=1.5.243
pkgrel=1
_tag="uuu_${pkgver}"
pkgdesc='Universal Update Utility for deploying images to Freescale/NXP i.MX chips'
arch=('x86_64')
url='https://github.com/nxp-imx/mfgtools'
license=('BSD-3-Clause')
# Every entry is a REQUIRED pkg_check_modules in the tree; zstd became one after
# the version the AUR mfgtools package targets, so it is easy to miss by
# copying that recipe rather than reading the CMake files.
depends=('bzip2' 'libusb' 'openssl' 'tinyxml2' 'zlib' 'zstd')
makedepends=('cmake')
provides=('mfgtools')
conflicts=('mfgtools' 'mfgtools-git' 'mfgtools-git-noproxy')
# The release tarball, not the git archive: upstream also publishes a rolling
# "master" prerelease tag, so anything tracking tags by recency picks up a
# moving target instead of a release.
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_tag}/uuu_source-${_tag}.tar.gz")
sha256sums=('dee3be0f337c631bf93232f5ea42440f07782ce005c9219a14731d66bbe83658')

prepare() {
    # Vendored copies shadow the system libraries the depends array pins, so a
    # security update to any of them would not reach this package.
    rm -rf -- "uuu-${_tag}"/{bzip2,libusb,msvc,zlib}
}

build() {
    # libuuu/buffer.cpp and buffer.h reach __FILE__, so without remapping, the
    # builder's home ends up inside the shipped binary - makepkg reports it as a
    # reference to $srcdir, and it makes the build unreproducible across users.
    CXXFLAGS+=" -ffile-prefix-map=${srcdir}=/usr/src/${pkgname}"

    local cmake_options=(
        -B build
        -S "uuu-${_tag}"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "uuu-${_tag}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
