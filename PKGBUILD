# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-git
pkgver=3.3359.1755.gb44919e
pkgrel=1
pkgdesc="Chromium Embedded Framework"
arch=("x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "libxss" "libxtst" "libglvnd")
makedepends=("cmake" "make" "python2" "ninja")
provides=("cef" "cef-minimal")
conflicts=("cef-standard" "cef-minimal")
source=("git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "https://bitbucket.org/chromiumembedded/cef/raw/master/tools/automate/automate-git.py")

sha256sums=('SKIP'
            '1ea166c531f2ab71e45c56baae386d4baa983248f31b8d5854d42c07ead94e19')

prepare() {
    # Python → Python 2 fix
    mkdir -p "${srcdir}/python2"
    cd "${srcdir}/python2"
    ln -sf /usr/bin/python2 ./python
    alias python="python2"

    export PATH="${srcdir}/depot_tools:$PATH"
    export CEF_USE_GN=1

    mkdir -p "${srcdir}/chromium_git"
    cd "${srcdir}/chromium_git"
    msg2 "Please answer the following question with Y!"
    PATH="${srcdir}/python2:$PATH" python2 "${srcdir}"/automate-git.py --download-dir="${srcdir}/chromium_git" --depot-tools-dir="${srcdir}/depot_tools" --no-distrib --no-build

    cd "${srcdir}/chromium_git/chromium/src/cef"
    PATH="${srcdir}/python2:$PATH" ./cef_create_projects.sh
}

pkgver() {
    cat "${srcdir}/chromium_git/chromium/src/cef/include/cef_version.h" | grep -Eo "^#define CEF_VERSION \".*\"$" | grep -Eo "[0-9]\.[0-9]{4}\.[0-9]{4}\.g[0-9a-f]+"
}

build() {
    export PATH="${srcdir}/python2:$PATH"
    cd "${srcdir}/chromium_git/chromium/src"
    ninja -C out/Release_GN_x64 cef chrome_sandbox

    cd "${srcdir}/chromium_git/chromium/src/cef/tools"
    ./make_distrib.sh --ninja-build --minimal --x64

    cd "${srcdir}/chromium_git/chromium/src/cef/binary_distrib/cef_binary_${pkgver}_linux64_minimal"
    sed '/^add_subdirectory[\(]tests[\/].*/d' -i CMakeLists.txt
    cmake .
    make clean
    make libcef_dll_wrapper
}

package() {
    install -dm755 "$pkgdir"/opt/cef/
    cd "${srcdir}/chromium_git/chromium/src/cef/binary_distrib/cef_binary_${pkgver}_linux64_minimal/"
    cp -R * "${pkgdir}/opt/cef/"
    install -Dm644 "${srcdir}/chromium_git/chromium/src/cef/binary_distrib/cef_binary_${pkgver}_linux64_minimal/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
