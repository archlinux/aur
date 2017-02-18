# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=radium
pkgver=4.5.0
pkgrel=1
pkgdesc="A graphical music editor. A next generation tracker."
arch=('i686' 'x86_64')
url="http://users.notam02.no/~kjetism/radium/"
license=('GPL')
depends=(
    'python2'
    'libxaw'
    'libsndfile'
    'libsamplerate'
    'liblrdf'
    'qt5-webkit'
    'qt5-x11extras'
    'libxkbfile'
    'glu'
    'speex'
    'fftw'
    'jack'
    'libxinerama'
    'libxcursor'
)
makedepends=(
    'cmake'
    'boost'
    'llvm'
    'qt5-tools'
    'libxrandr'
    'steinberg-vst36'
)
options=(!strip)
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz"
        "faust-accept-current-clang.patch"
        "dont-empty-qt-library-paths.patch"
        "fix-misleading-indentation.patch"
        "fix-X11_keyboard-compilation.patch"
        "use-system-libxcb.patch"
        "use-system-vstsdk.patch")
md5sums=('e2bddd56d0e9dc3a9cdf89249a3915ef'
         'df250d13d5826b35c9139e6d436ebac9'
         '77c202bc0a36562eb7b805ad6b7a85b3'
         '1ca36c75ce4b3fed28c22753b8dc045a'
         '24e927620d8aeb09c83b903a92dacf9f'
         '60e99f9362d08726877d14ea2cdfd5c6'
         '5c78211475528b588cabced5f024eb54')

prepare() {
    cd "${pkgname}-${pkgver}"

    msg2 "Fixing faust2 compilation on llvm 3.9.1"
    patch -Nsp1 < "${srcdir}/faust-accept-current-clang.patch"

    msg2 "Fixing QT_QPA_PLATFORM_PLUGIN_PATH problem"
    patch -Nsp1 < "${srcdir}/dont-empty-qt-library-paths.patch"

    msg2 "Fixing misleading indentation"
    patch -Nsp1 < "${srcdir}/fix-misleading-indentation.patch"

    msg2 "Fixing X11_keyboard compilation"
    patch -Nsp1 < "${srcdir}/fix-X11_keyboard-compilation.patch"

    msg2 "Switching to systemd-wide libxcb"
    patch -Nsp1 < "${srcdir}/use-system-libxcb.patch"

    # Use the VST SDK from steinberg-vst36, so the user doesn't have to
    # manually put it into his home directory
    msg2 "Switching to system-wide VST SDK"
    patch -Nsp1 < "${srcdir}/use-system-vstsdk.patch"
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

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/radium/radium_linux.bin" "${pkgdir}/usr/bin/radium"

    # Needed to make the Scheme parts of Radium work
    msg2 "Installing s7 sources"
    install -dm755 "${pkgdir}/opt/radium/packages"
    tar -xf "bin/packages/s7.tar.gz" -C "${pkgdir}/opt/radium/packages" \
      --no-same-owner --no-same-permissions --wildcards '*.scm'

    # Radium will complain if these are missing
    msg2 "Installing Faust GUI styles"
    install -Dm644 -t "${pkgdir}/opt/radium/packages/faust2/architecture/faust/gui/Styles" \
      "bin/packages/faust2/architecture/faust/gui/Styles/"*".qss"
}

# vim:set ts=4 sw=4 et:
