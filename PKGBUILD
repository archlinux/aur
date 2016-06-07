# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

# NOTICE: This needs Steinberg VST Audio Plug-Ins SDK in ~/SDKs to work.
# It can obtained like this:
# 1. curl -LO http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip
# 2. unzip vstsdk360_22_11_2013_build_100.zip
# 3. mkdir -p ~/SDKs/vstsdk2.4
# 4. cp -va "VST3 SDK/." ~/SDKs/vstsdk2.4

pkgname=radium
pkgver=3.9.2
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
    'qt4'
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
)
options=(!strip)
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz"
        "reenable-libbfd-workaround.patch"
        "use-gcc5-for-pluginhost.patch"
        "https://github.com/kmatheussen/radium/commit/62dbff512d430c9e93c04e85fd24221a26553c3c.patch"
        "https://github.com/kmatheussen/radium/commit/ec15def19888a2200e0dca2f9d7dd39282b6a23a.patch")
md5sums=('5446a04c647665ce3968d7f5fb74ec34'
         '74ea7a54f0e358035a7f0cc7baf54b6e'
         '9c19006defeef7e317ec23ed8eae1b72'
         '840ef9b1f4f06627d69550f1e76c7f4a'
         '17a8de84ad89a635a6f5737b45549116')

prepare() {
    cd "${pkgname}-${pkgver}"

    # See https://github.com/kmatheussen/radium/commit/22be69fd24235cafb5878692d574d500f843c911#commitcomment-17394610
    patch -Np1 < "${srcdir}/reenable-libbfd-workaround.patch"
    # Some parts of JUCE that Radium uses depend on unstandardized behaviour
    # specific to GCC5, so they don't compile with Arch's regular GCC6 and we
    # have to switch back manually
    patch -Np1 < "${srcdir}/use-gcc5-for-pluginhost.patch"
    # See https://groups.google.com/d/msg/radium-music-editor/rXIcVpKgXXs/od7802ojBQAJ
    patch -Np1 < "${srcdir}/62dbff512d430c9e93c04e85fd24221a26553c3c.patch"
    patch -Np1 < "${srcdir}/ec15def19888a2200e0dca2f9d7dd39282b6a23a.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    make packages
    BUILDTYPE=RELEASE ./build_linux.sh
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
}

# vim:set ts=4 sw=4 et:
