# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=radium
pkgver=4.2.9
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
    'libpthread-stubs'
)
options=(!strip)
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz"
        "faust-accept-clang-390.patch"
        "dont-empty-qt-library-paths.patch"
        "use-gcc5-for-pluginhost.patch"
        "use-system-vstsdk.patch")
md5sums=('61e8aa38ed8f464a7d6b85bc490674f8'
         '9c72bd466ead73e36b0c2d4297d76870'
         '77c202bc0a36562eb7b805ad6b7a85b3'
         '9c19006defeef7e317ec23ed8eae1b72'
         '661c15bc037131c1ad8f8f11d3bc957f')

prepare() {
    cd "${pkgname}-${pkgver}"

    msg2 "Fixing faust2 compilation on llvm 3.9.0"
    patch -Nsp1 < "${srcdir}/faust-accept-clang-390.patch"

    msg2 "Fixing QT_QPA_PLATFORM_PLUGIN_PATH problem"
    patch -Nsp1 < "${srcdir}/dont-empty-qt-library-paths.patch"

    # Some parts of JUCE that Radium uses depend on unstandardized behaviour
    # specific to GCC5, so they don't compile with Arch's regular GCC6 and we
    # have to switch back manually
    msg2 "Switching pluginhost build to GCC 5"
    patch -Nsp1 < "${srcdir}/use-gcc5-for-pluginhost.patch"

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
