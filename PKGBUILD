# Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgbase=seanime-git
pkgname=('seanime-server-git' 'seanime-denshi-git')
_pkgname=seanime
_electronver=42
pkgver=v3.9.1.r0.g46d7aec
pkgrel=1
pkgdesc="Open-source media server with a web interface and desktop app for anime and manga."
arch=('x86_64' 'aarch64')
url="https://seanime.app"
license=('GPL-3.0-only')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'git'
    'make'
    'npm'
    'go>=1.26'
    "electron$_electronver")
source=(
    "git+https://github.com/5rahim/seanime.git"
    "app.seanime.seanime_denshi.desktop"
    "seanime-denshi.sh.in")
sha256sums=(
    'SKIP'
    'a95400bc0f4cc9a8fb15feb243ed2a05a5b1d93aa3e0522bd2bac1095b821d1e'
    '7f36f983c1313bba1b5d718865fe6115764429ffad3886a6863ec309f78cbb0c')

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

    # Mirror the workflow, build order webapp > server > denshi, start with webapp below

    npm ci
    make build-all

    # Prepare for the server (go)

    cd "${srcdir}/${_pkgname}"

    mkdir -p binaries

    # Server: We can build for both (x64/arm64 or aarch64) try to conform with upstream

    if [ "$CARCH" = aarch64 ]; then
    export GOARCH=arm64
    export _Arch=${GOARCH}
    else
    export GOARCH=amd64
    export _Arch=x64
    fi

    # https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
    # (cgo) is required for linking and its enabled by default

    # Fail if we have to downlaod (go) from the internet
    export GOTOOLCHAIN=path
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
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
    npm run sync:mpv-prism -- linux-${_Arch}
    npm exec -- electron-builder build --linux --${_Arch} --dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package_seanime-server-git() {

    install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}-server"
    install -Dm644 "${_pkgname}/"*.md -t "${pkgdir}/usr/share/doc/${_pkgname}-server"  

    cd "${_pkgname}"
    
    install -Dm755 "binaries/seanime-server-linux-${GOARCH}" "${pkgdir}/usr/bin/${_pkgname}-server"
}

package_seanime-denshi-git() {
    depends=(
	'gtk3'
        'hicolor-icon-theme' 
        "electron$_electronver")

    install -Dm644 "app.seanime.seanime_denshi.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "seanime-denshi.sh" "${pkgdir}/usr/bin/${_pkgname}-denshi"
    install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}-denshi"
    install -Dm644 "${_pkgname}/"*.md -t "${pkgdir}/usr/share/doc/${_pkgname}-denshi"

    cd "${_pkgname}/seanime-denshi"

    install -Dm644 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}-denshi"
    install -Dm755 "dist/linux-unpacked/resources/binaries/seanime-server-linux-${GOARCH}" -t "${pkgdir}/usr/lib/electron$_electronver/resources/binaries"
    mv -v "native-builds/" "${pkgdir}/usr/lib/electron$_electronver/resources/"

    for icon in $(find assets -regex '.*/[0-9]+x[0-9]+\.png' | sort -n); do
    size=$(basename -s .png "$icon")
    install -Dm644 "assets/$size.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}-denshi.png"
    done
}
