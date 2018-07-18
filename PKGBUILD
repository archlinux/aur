# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Teteros <teteros at teknik dot io>

pkgname=radium
pkgver=5.8.4
pkgrel=1
pkgdesc="A graphical music editor. A next generation tracker."
arch=('i686' 'x86_64')
url="https://users.notam02.no/~kjetism/radium/"
license=('GPL')
depends=(
    'fftw'
    'glu'
    'hicolor-icon-theme'
    'jack'
    'liblrdf'
    'libmpc'
    'libsamplerate'
    'libxaw'
    'libxcursor'
    'libxinerama'
    'libxkbfile'
    'python2'
    'qt5-webkit'
    'qt5-x11extras'
    'speex'
    'libmpc'
)
optdepends=('calf-ladspa' 'ladspa-plugins' 'tcl')
makedepends=(
    'boost'
    'cmake'
    'libxrandr'
    'lld'
    'llvm40'
    'qt5-tools'
    'steinberg-vst36'
)
options=(!strip)
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz"
        "include-glibc-rpc.patch"
        "radium"
        "use-llvm40-static-libs.patch"
        "use-system-libxcb.patch"
        "use-system-vstsdk.patch"
)
sha256sums=('2b1b9944898e95a1c2bd1b3211d312fa8bbb8fa1ef7a20b16906ebabb0d6e2ac'
            '3436c478637fd1c8f7ff4089c30ba7f2048a71de8243756893df35cdb25be893'
            '6ea834fbf695187c244bbb1dacc1d462ded807ee4997761fdaa60d5373b386cd'
            '4155b427be299ba74c1d9278bcf2b72f720f55c814e01ca38f6f0afbda282890'
            'ac41c94513ca615a71198a91160b2d605ea73c8a97a0192d275105248669df8d'
            '2a69303ca540e2f9c41034588fc3580b4e51bc30e8e5bcc8059c3b168ea17142')

prepare() {
    cd "${pkgname}-${pkgver}"

    # glibc legacy rpc includes were moved to libtirpc, this patch radium's libpd to locate them
    msg2 "Patching libpd to use legacy rpc includes in libtirpc"
    patch -Nsp1 < "${srcdir}/include-glibc-rpc.patch"

    # LLVM5 is not currently supported by Radium's faust fork so we need to
    # link llvm40 statically to avoid conflicts with any other system llvm
    # See https://github.com/kmatheussen/radium/issues/1068
    # and https://users.notam02.no/~kjetism/radium/forum/viewtopic.php?f=7&t=39
    msg2 "Patching faust to link with llvm40-libs statically"
    patch -Nsp1 < "${srcdir}/use-llvm40-static-libs.patch"

    # Radium bundles libxcb 1.13+ as F22 has an older version available in repos
    # We can use libxcb from extra repo instead
    msg2 "Switching to system-wide libxcb"
    patch -Nsp1 < "${srcdir}/use-system-libxcb.patch"

    # Patch paths to use VST SDK from steinberg-vst36 AUR package as
    # JUCE expects the SDK in the users home directory
    msg2 "Using VST SDK from steinberg-vst36 package"
    patch -Nsp1 < "${srcdir}/use-system-vstsdk.patch"

    # s7 scheme tarball seems to not unpack for some users during make,
    # extracting it here is a workaround until someone with that issue can debug it
    msg2 "Extracting s7.tar.gz"
    tar xvzf bin/packages/s7.tar.gz -C bin/packages
}

build() {
    cd "${pkgname}-${pkgver}"

    msg2 "Building packages"
    RADIUM_QT_VERSION=5 make packages

    msg2 "Building Radium"
    RADIUM_QT_VERSION=5 BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
    cd "${pkgname}-${pkgver}"

    msg2 "Installing Radium core files"
    install -dm755 "${pkgdir}/opt/radium"
    # Copy everything from bin except packages
    find "bin" -mindepth 1 -maxdepth 1 -name packages -o -exec cp -a "{}" "${pkgdir}/opt/radium/" \;

    msg2 "Installing Radium binary wrapper"
    install -Dm755 "${srcdir}/radium" "${pkgdir}/usr/bin/radium"

    # Needed to make the Scheme parts of Radium work
    msg2 "Installing s7 sources"
    install -dm755 "${pkgdir}/opt/radium/packages"
    tar -xf "bin/packages/s7.tar.gz" -C "${pkgdir}/opt/radium/packages" \
        --no-same-owner --no-same-permissions --wildcards '*.scm'

    msg2 "Installing libpd-master pure-data"
    install -dm755 "${pkgdir}/opt/radium/packages/libpd-master/"
    cp -a "bin/packages/libpd-master/pure-data/" \
        "${pkgdir}/opt/radium/packages/libpd-master/"

    msg2 "Installing FAUST libraries and GUI styles"
    install -dm755 "${pkgdir}/opt/radium/packages/faust2/architecture/faust/gui/Styles"
    cp -a "bin/packages/faust2/architecture/faust/gui/Styles" \
        "${pkgdir}/opt/radium/packages/faust2/architecture/faust/gui"
    # Copy faust's *.lib files to be able to import them in faustdev
    cp -a "bin/packages/faust2/architecture/"*".lib" \
        "${pkgdir}/opt/radium/packages/faust2/architecture/"

    msg2 "Installing .desktop, icon and mimetype files"
    install -dm755 "${pkgdir}/usr/share/applications"
    ln -s "/opt/radium/radium.desktop" \
        "${pkgdir}/usr/share/applications/radium.desktop"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/"{256x256,128x128,32x32,16x16}"/apps"
    ln -s "/opt/radium/radium_256x256x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radium.png"
    ln -s "/opt/radium/radium_128x128x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/radium.png"
    ln -s "/opt/radium/radium_32x32x24.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/radium.png"
    ln -s "/opt/radium/radium_16x16x8.png" \
        "${pkgdir}/usr/share/icons/hicolor/16x16/apps/radium.png"

    install -dm755 "${pkgdir}/usr/share/mime/packages"
    ln -s "/opt/radium/radium-mimetype.xml" \
        "${pkgdir}/usr/share/mime/packages/radium.xml"
}

# vim:set ts=4 sw=4 et:
