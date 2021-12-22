# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=android-meson
pkgver=1
pkgrel=2
arch=('any')
pkgdesc="Meson wrapper for Android (android)"
depends=('meson' 'android-environment' 'android-pkg-config')
license=("GPL")
url="https://mesonbuild.com/"
source=("toolchain_generator.py"
        "meson-android-wrapper")
sha256sums=('SKIP'
            'SKIP')
_architectures="aarch64 armv7a-eabi x86 x86-64"

build() {
    for _arch in ${_architectures}; do
        unset CPPFLAGS
        unset CFLAGS
        unset CXXFLAGS
        unset LDFLAGS
        source android-env ${_arch}
        python toolchain_generator.py --arch ${_arch} --output-file toolchain-android-${_arch}.meson
        sed "s|@TRIPLE@|${_arch}|g;" meson-android-wrapper > android-${_arch}-meson
    done
}

package() {
    install -d "${pkgdir}"/usr/bin
    install -d "${pkgdir}"/usr/share/android

    for _arch in ${_architectures}; do
        install -m 755 "${srcdir}/android-${_arch}-meson" "$pkgdir/usr/bin/android-${_arch}-meson"
        install -m 644 toolchain-android-${_arch}.meson "${pkgdir}"/usr/share/android/
    done
}
