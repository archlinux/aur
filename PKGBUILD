# Maintainer: yobson <aur@yobson.xyz>
_reponame=SteamVRLinuxFixes
_pkgname=steamvr-linux-fixes-layer
pkgname=${_pkgname}-git
pkgdesc="A Vulkan layer that patches SteamVR's vrcompositor to address issues for wired headsets"
pkgver=0.1.3.r0.g04e43c9
pkgrel=1
arch=('x86_64')
url="https://github.com/BnuuySolutions/${_reponame}"
license=('MIT')
makedepends=('git' 'cmake' 'vulkan-headers')
depends=('vulkan-icd-loader')
source=("git+$url.git" 'git+https://github.com/kubo/funchook.git')
sha256sums=('SKIP' 'SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")

pkgver() {
    cd "$srcdir/$_reponame"
    git describe --tags --long --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_reponame"
    git submodule init
    git config submodule.funchook.url "$srcdir/funchook"
    git -c protocol.file.allow=always submodule update

    # Make sure the JSON file points to the system library path instead of a relative path
    sed -i 's/"library_path": ".\/libsteamvr_linux_fixes.so"/"library_path": "libsteamvr_linux_fixes.so"/' "VkLayer_steamvr_linux_fixes.json"
}

build() {
    local cmake_options=(
        -B build
        -S $srcdir/$_reponame
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    cd "$srcdir/$_reponame"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/build"
    install -Dm755 'VkLayer_steamvr_linux_fixes.json' "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_steamvr_linux_fixes.json"
    install -Dm755 'libsteamvr_linux_fixes.so' "$pkgdir/usr/lib/libsteamvr_linux_fixes.so"
}
