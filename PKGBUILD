# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-poppler-data
pkgver=0.4.12
_POPPLER_DATA_EXTRA_VERSION="0.4.11-2"
pkgrel=1
arch=('any')
pkgdesc="Encoding data for the poppler PDF rendering library (Android ${_android_arch})"
license=('custom'
         'GPL2')
url="https://poppler.freedesktop.org/"
conflicts=("android-${_android_arch}-poppler<0.10.5")
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://poppler.freedesktop.org/poppler-data-${pkgver}.tar.gz"
        "https://dev.gentoo.org/~sam/distfiles/app-text/poppler-data/poppler-data-$_POPPLER_DATA_EXTRA_VERSION-extra.tar.xz")
sha256sums=('c835b640a40ce357e1b83666aabd95edffa24ddddd49b8daff63adb851cdab74'
            '2f62dc1d20e1646e9c92e6fc35ba26f7d12b7cacee3577e5fd4a85511bfc6603')

build() {
    cd "${srcdir}/poppler-data-${pkgver}"
    source android-env ${_android_arch}
}

package() {
    cd "${srcdir}/poppler-data-${pkgver}"
    source android-env ${_android_arch}

    make prefix="${ANDROID_PREFIX}" DESTDIR="${pkgdir}" install

    # additional cMaps for ghostscript - FS#76416
    cp ../poppler-data-${_POPPLER_DATA_EXTRA_VERSION}-extra/Identity-* "${pkgdir}/${ANDROID_PREFIX_SHARE}/poppler/cMap"

    # add symlinks to cMaps - FS#76565
    pushd "${pkgdir}/${ANDROID_PREFIX_SHARE}/poppler/cMap"
        find ../cMap -type f -exec ln -s {} . \;
    popd
}
