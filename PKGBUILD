# Maintainer: Amro Emad <korialo001 at gmail dot com>
pkgbase=seanime-git
pkgname=('seanime-server-git' 'seanime-denshi-git')
_pkgname=seanime
_electronver=36
pkgver=v3.0.1.r0.g0d59b28
pkgrel=1
pkgdesc="Open-source media server with a web interface and desktop app for anime and manga."
arch=('x86_64' 'aarch64')
url="https://github.com/5rahim/seanime"
license=('GPL-3.0-only')
makedepends=('git'
             'make'
             'npm'
             'go>=1.25.1'
             'gcc-libs' 
             'glibc' 
             "electron$_electronver")
source=("git+https://github.com/5rahim/seanime.git"
        "seanime-denshi.desktop"
        "seanime-denshi.sh.in"
        )
sha256sums=('SKIP'
            '48a0fc259e347ad05575b594ca20e52e68c96fedcb04a157796ee15846959b1b'
            '7f36f983c1313bba1b5d718865fe6115764429ffad3886a6863ec309f78cbb0c'
            )
pkgver() {
    cd "${_pkgname}"
    # Cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    
    # Add the electron version for denshi
    
    sed "s/@ELECTRON@/electron$_electronver/" ${_pkgname}-denshi.sh.in > ${_pkgname}-denshi.sh
}

build() {
    
    cd "${_pkgname}/seanime-web"

    # Mirror the workflow, build order webapp > server > tauri app & denshi, start with webapp below
    # Check for "npm ci" fix
    
    npm install
    
    # Prep for server and desktop (tauri)
    
    make build-web
    
    # Import web-denshi to seanime denshi
    
    cp -r ../web-denshi ../seanime-denshi/web-denshi

    cd "${srcdir}/${_pkgname}"

    # Prepare for server
    mkdir -p binaries

    # Server: Can be build for both (x64/arm64) try to conform with upstream

    if [ "$CARCH" = aarch64 ]; then
    export GOARCH=arm64
    export _Arch=${GOARCH}
    else
    export GOARCH=amd64
    export _Arch=x64
    fi

    # https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
    # (cgo) is required for linking

    export CGO_ENABLED=1
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o ./binaries/seanime-server-linux-${GOARCH} \
    .	
    
    # Denshi app

    cd "seanime-denshi/"
    
    # Prepare for binary
    mkdir -p binaries

    cp "${srcdir}/${_pkgname}/binaries/seanime-server-linux-${GOARCH}" ./binaries/

    # Prepare for system electron for use after build

    electronDist=/usr/lib/electron$_electronver
    electronVer=$(electron$_electronver --version | tail -c +2)

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm ci
    npm exec -- electron-builder build --linux --${_Arch}  --dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package_seanime-server-git() {
    depends=('gcc-libs'
             'glibc')

    install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}-server"

    cd "${_pkgname}"
    
    install -Dm755 "binaries/seanime-server-linux-${GOARCH}" "${pkgdir}/usr/bin/${_pkgname}-server"  
}

package_seanime-denshi-git() {
    depends=('gcc-libs'
             'glibc'    
             'gtk3'
             'hicolor-icon-theme' 
             "electron$_electronver")

    install -Dm644 "seanime-denshi.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "seanime-denshi.sh" "${pkgdir}/usr/bin/${_pkgname}-denshi"
    install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}-denshi"

    cd "${_pkgname}/seanime-denshi"

    install -Dm644 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}-denshi"
    install -Dm755 "dist/linux-unpacked/resources/binaries/seanime-server-linux-${GOARCH}" -t "${pkgdir}/usr/lib/electron$_electronver/resources/binaries"
    for icon in $(find assets -regex '.*/[0-9]+x[0-9]+\.png' | sort -n); do
    size=$(basename -s .png "$icon")
    install -Dm644 "assets/$size.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}-denshi.png"
    done
}
