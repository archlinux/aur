# Maintainer: qr243vbi

pkgname=(nekobox nekobox-core)
pkgver=5.11.28.1
pkgrel=10
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64' 'aarch64' 'riscv64' 'pentium4' 'i686' 'armv7h')
url="https://github.com/qr243vbi/nekobox"
license=('GPL-3.0-or-later')

makedepends=('boost' 'pkgconfig' 'ccache' 'ninja' 'jq' 'coreutils' 'git' 'cmake' 'gendesk' 'go' 'qt6-tools' 'vulkan-headers' 'cpio' 'patchelf')
depends=('acl' 'bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base' 'thrift' 'boost-libs' 'leveldb' 'yaml-cpp' 'curl' 'openssl' 'zlib' 'libunistring')

source=()
sha256sums=()

nekobox_source_directory="nekobox-unified-source-${pkgver}"

build() {
    export NEKOBOX_BUILD=$PWD/build

    cd "${nekobox_source_directory}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
        
    cmake -B "${NEKOBOX_BUILD}" -S . -D "NKR_DEFAULT_VERSION=${pkgver}"
    cmake --build "${NEKOBOX_BUILD}"
}

packagecore() {
    depends=('gcc-libs' 'glibc')
    provides=('sing-box')
    conflicts=('sing-box')
    DESTDIR="${pkgdir}" cmake --install "${NEKOBOX_BUILD}" --component core
}

packageapp() {
    depends+=("$1")
    provides=('nekoray')
    conflicts=('nekoray')
    DESTDIR="${pkgdir}" cmake --install "${NEKOBOX_BUILD}" --component gui
}

clearsources(){
    unset source ||:
    unset sha256sums ||:
    typeset -a "source" ||:
    typeset -a "sha256sums" ||:
}

if [[ "${#source[@]}" == "0" || "${#source[0]}" == "" || "${NEKOBOX_BRANCH}" != "" ]]
then
nekobox_source_directory="nekobox-git"
pkgname=(nekobox-git nekobox-core-git)
clearsources

package_nekobox-core-git() {
    packagecore
}
package_nekobox-git() {
    packageapp 'nekobox-core-git'
}
prepare() {
    local BRANCH="${NEKOBOX_BRANCH:-main}"
    local REPO="qr243vbi/nekobox"

    if [[ -d "${nekobox_source_directory}" ]]
    then
        pushd "${nekobox_source_directory}"
        git pull
        popd
    else
        git clone --recurse-submodules --depth 1 --single-branch --branch "${BRANCH}" https://github.com/"${REPO}" "${nekobox_source_directory}"
    fi
}
pkgver(){
    local BRANCH="${NEKOBOX_BRANCH:-main}"
    local REPO="qr243vbi/nekobox"
    local LATEST_TAG=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq -r '.tag_name')
    local COMMIT_TIMESTAMP=$(curl -s "https://api.github.com/repos/$REPO/commits/$BRANCH" | jq -r '.commit.committer.date' | xargs -I{} date -d "{}" +%s)
    local SHORT_SHA=$(curl -s "https://api.github.com/repos/$REPO/commits/$BRANCH" | jq -r '.sha[0:7]')
    local VERSION_STRING="${LATEST_TAG}.git${COMMIT_TIMESTAMP}.${SHORT_SHA}"
    echo $VERSION_STRING
}
else
package_nekobox-core() {
    packagecore
}

package_nekobox() {
    packageapp 'nekobox-core'
}
fi

