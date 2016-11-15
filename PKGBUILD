# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=radium
pkgver=4.2.7
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
    'gcc5'
    'boost'
    'llvm'
    'qt5-tools'
    'libxrandr'
    'steinberg-vst36'
)
options=(!strip)
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz"
        "faust-accept-clang-390.patch"
        "dont-empty-qt-library-paths.patch"
        "use-gcc5-for-pluginhost.patch"
        "use-system-vstsdk.patch")
md5sums=('26038c402857fdb314eb29cb74dcac88'
         '9c72bd466ead73e36b0c2d4297d76870'
         '77c202bc0a36562eb7b805ad6b7a85b3'
         '9c19006defeef7e317ec23ed8eae1b72'
         '661c15bc037131c1ad8f8f11d3bc957f')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Fix faust2 compilation on llvm 3.9.0
    patch -Np1 < "${srcdir}/faust-accept-clang-390.patch"

    # Fix QT_QPA_PLATFORM_PLUGIN_PATH problem
    patch -Np1 < "${srcdir}/dont-empty-qt-library-paths.patch"

    # Some parts of JUCE that Radium uses depend on unstandardized behaviour
    # specific to GCC5, so they don't compile with Arch's regular GCC6 and we
    # have to switch back manually
    patch -Np1 < "${srcdir}/use-gcc5-for-pluginhost.patch"

    # Use the VST SDK from steinberg-vst36, so the user doesn't have to
    # manually put it into his home directory
    patch -Np1 < "${srcdir}/use-system-vstsdk.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    RADIUM_QT_VERSION=5 make packages
    RADIUM_QT_VERSION=5 BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
    cd "${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/opt/radium"
    mkdir -p "${pkgdir}/usr/bin"
    cp -va "bin/." "${pkgdir}/opt/radium/"
    ln -s "/opt/radium/radium" "${pkgdir}/usr/bin/radium"

    # Remove objects created during packages compilation.
    rm -rf "${pkgdir}/opt/radium/packages"

    # Restore s7 sources - needed to make the Scheme parts of Radium work
    mkdir -p "${pkgdir}/opt/radium/packages"
    tar -xvf "bin/packages/s7.tar.gz" -C "${pkgdir}/opt/radium/packages" \
      --no-same-owner --no-same-permissions --wildcards '*.scm'

    # Restore Faust GUI styles - Radium will complain if these are missing
    install -Dm644 -t "${pkgdir}/opt/radium/packages/faust2/architecture/faust/gui/Styles" \
      "bin/packages/faust2/architecture/faust/gui/Styles/"*".qss"
}

# vim:set ts=4 sw=4 et:
