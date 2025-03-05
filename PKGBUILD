# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=android-meson
pkgver=4
pkgrel=1
arch=('any')
pkgdesc="Meson wrapper for Android"
depends=('meson'
         'android-environment'
         'android-pkg-config'
         'python-packaging')
license=("GPL")
url="https://mesonbuild.com/"
source=("toolchain_generator.py"
        "meson-android-wrapper.sh")
md5sums=('f16a7491b1568dd51e261dcccd1635ab'
         '6298adc4689a7d9ea86b24dbc3873d1f')
_architectures="aarch64 armv7a-eabi riscv64 x86 x86-64"

build() {
    if [ -z "${ANDROID_MINIMUM_PLATFORM}" ]; then
        unset_ANDROID_MINIMUM_PLATFORM=1
    fi

    if [ -z "${ANDROID_TARGET_PLATFORM}" ]; then
        unset_ANDROID_TARGET_PLATFORM=1
    fi

    if [ -z "${ANDROID_NDK_PLATFORM}" ]; then
        unset_ANDROID_NDK_PLATFORM=1
    fi

    if [ -z "${ANDROID_API_VERSION}" ]; then
        unset_ANDROID_API_VERSION=1
    fi

    for _arch in ${_architectures}; do
        unset ANDROID_CFLAGS
        unset ANDROID_CPPFLAGS
        unset ANDROID_CXXFLAGS
        unset ANDROID_LDFLAGS

        if [ ! -z "${unset_ANDROID_MINIMUM_PLATFORM}" ]; then
            unset ANDROID_MINIMUM_PLATFORM
        fi

        if [ ! -z "${unset_ANDROID_TARGET_PLATFORM}" ]; then
            unset ANDROID_TARGET_PLATFORM
        fi

        if [ ! -z "${unset_ANDROID_NDK_PLATFORM}" ]; then
            unset ANDROID_NDK_PLATFORM
        fi

        if [ ! -z "${unset_ANDROID_API_VERSION}" ]; then
            unset ANDROID_API_VERSION
        fi

        source android-env ${_arch}

        export CFLAGS="${ANDROID_CFLAGS}"
        export CPPFLAGS="${ANDROID_CPPFLAGS}"
        export CXXFLAGS="${ANDROID_CXXFLAGS}"
        export LDFLAGS="${ANDROID_LDFLAGS}"
        python toolchain_generator.py --arch ${_arch} --output-file toolchain-android-${_arch}.meson
        sed "s|@TRIPLE@|${_arch}|g;" meson-android-wrapper.sh > android-${_arch}-meson
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
