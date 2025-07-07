# Maintainer: esauvisky <esauvisky@gmail.com>
pkgname=leyden-jar-diagnostic-tool-git
_reponame=Leyden_Jar_Diagnostic_Tool
pkgver() {
  cd "${_reponame}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgver=V1.0.3.r5.g25d3f40
pkgrel=1
pkgdesc="Diagnostic utility for Leyden Jar based Model F and Beamspring keyboards (VCS build)."
arch=('x86_64')
url="https://github.com/mymakercorner/Leyden_Jar_Diagnostic_Tool"
license=('MIT')
depends=('sdl2' 'hidapi')
makedepends=('git' 'cmake' 'base-devel')
provides=("leyden-jar-diagnostic-tool")
conflicts=("leyden-jar-diagnostic-tool")
source=("git+https://github.com/mymakercorner/Leyden_Jar_Diagnostic_Tool.git")
sha256sums=('SKIP')
install="${pkgname}.install"

prepare() {
    # Initialize all the git submodules required for the build
    cd "${_reponame}"
    git submodule update --init --recursive
}

build() {
    cd "${_reponame}"
    mkdir -p build
    cd build

    # Temporarily disable the "format-security" warning-as-error.
    # This keeps all other system hardening flags from makepkg.conf active.
    export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security"

    # Create the build directory and run cmake
    # We explicitly disable PipeWire support in the bundled SDL library
    # to avoid compilation errors on modern systems.
    cmake .. -G "Unix Makefiles" -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DSDL_PIPEWIRE=OFF

    # Build the project
    make
}

package() {
    cd "${_reponame}"

    # Install the main executable binary
    install -Dm755 "build/Leyden_Jar_Diagnostic_Tool" \
        "${pkgdir}/usr/bin/leyden-jar-diagnostic-tool"

    # STRIP debug symbols from the installed binary to fix the $srcdir warning
    strip "${pkgdir}/usr/bin/leyden-jar-diagnostic-tool"

    # Install the license file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
