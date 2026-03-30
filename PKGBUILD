# Maintainer: qr243vbi

pkgname=(nekobox nekobox-core)
pkgver=5.10.29
pkgrel=10
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64' 'aarch64' 'riscv64' 'pentium4' 'i686' 'armv7h')
url="https://github.com/qr243vbi/nekobox"
license=('GPL-3.0-or-later')
makedepends=('bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base' 'qt6-declarative' 'thrift' 'boost')
makedepends+=('pkgconfig' 'ccache' 'ninja')
makedepends+=('cmake' 'gendesk' 'go' 'qt6-tools' 'vulkan-headers' 'cpio' 'upx' 'boost-libs' 'acl')
source=("https://github.com/qr243vbi/nekobox/releases/download/${pkgver}/nekobox-unified-source-${pkgver}.tar.xz")
sha256sums=("64eec3d68e3e3cd521ecdb2013d2fc21da126ea4a334532308f1bcc6a8fd8060")

nekobox_source_directory="nekobox-unified-source-${pkgver}"

build() {
    export DEST=$PWD/build
    pushd "${nekobox_source_directory}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOARCH=""
    export GOOS=linux
    export SKIP_UPDATER=y
    if [[ "${nekobox_source_directory}" != "nekobox-git" ]]
    then
      export GOFLAGS='-mod=vendor'
    fi
    export VERSION_SINGBOX="$(cat SingBox.Version)"
    ( bash -x script/build_go.sh ; )
    
    cmake -B "${DEST}" -S . \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SKIP_UPDATE_BUTTON=ON \
        -D "NKR_DEFAULT_VERSION=${pkgver}" \
        -W no-dev -GNinja
    cmake --build "${DEST}" -j "$(nproc)" -v
    popd
}

packagecore() {
    depends=('gcc-libs' 'glibc')
    provides=('sing-box')
    conflicts=('sing-box')
    install -Dm755 "$DEST"/nekobox_core -t "${pkgdir}/usr/lib/Iblis"
    upx "${pkgdir}/usr/lib/Iblis/nekobox_core"
}

packageapp() {
    depends=('acl' 'bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base' 'qt6-declarative' "$1" 'thrift' 'boost-libs')
    provides=('nekoray')
    conflicts=('nekoray')

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --categories 'Network'

    install -Dm755 "$DEST"/nekobox -t "${pkgdir}/usr/lib/Iblis"
    upx "${pkgdir}/usr/lib/Iblis/nekobox"

    echo '#!/bin/bash -x' > "nekobox.sh"
    echo 'exec /usr/lib/Iblis/nekobox -appdata "$@"' >> "nekobox.sh"

    echo '#!/bin/bash -x' > "sing-box.sh"
    echo 'exec /usr/lib/Iblis/nekobox_core sing-box "$@"' >> "sing-box.sh"
    install -Dm755 "nekobox.sh" "${pkgdir}/usr/bin/nekobox"
    install -Dm755 "sing-box.sh" "${pkgdir}/usr/bin/sing-box"
    install -Dm644 "nekobox.desktop" -t "${pkgdir}/usr/share/applications"

    cd "${nekobox_source_directory}"
    install -Dm644 srslist.json -t "${pkgdir}/usr/lib/Iblis"
    cp -RfvT "res/public" "${pkgdir}/usr/lib/Iblis/public"
    cp *.js "$DEST"/*.qm "res/languages.txt" "${pkgdir}/usr/lib/Iblis/public"
    install -Dm644 res/public/icon.png "${pkgdir}/usr/share/pixmaps/nekobox.png"
}

clearsources(){
    unset source ||:
    unset sha256sums ||:
    typeset -a "source" ||:
    typeset -a "sha256sums" ||:
}

if [[ "${#source[@]}" == "0" || "${#source[0]}" == "" || "${NEKOBOX_BRANCH}" != "" ]]
then
makedepends+=('jq' 'curl' 'coreutils' 'git')
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

