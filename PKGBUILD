# Maintainer: Amro Emad <korialo001 at gmail dot com>
pkgbase=seanime-git
pkgname=(seanime-server-git seanime-desktop-git seanime-denshi-git)
_pkgname=seanime
_electronver=36
pkgver=v2.9.10.r2.g8afb003
pkgrel=2
pkgdesc="Open-source media server with a web interface and desktop app for anime and manga."
arch=('x86_64' 'aarch64')
url="https://github.com/5rahim/seanime"
license=('GPL-3.0-only')
makedepends=('git'
             'npm'
             'go>=1.24.1'
             'gcc-libs' 
             'glibc' 
             'glib2' 
             'libsoup3' 'libsoup-3.0.so'
             'gtk3' 
             'rust' #to be removed later
             'cargo' 
             'clang' 
             'llvm' 
             'lld' 
             'patchelf' 
             'cargo-tauri' 
             'webkit2gtk-4.1' 
             'gdk-pixbuf2' 'libgdk_pixbuf-2.0.so' 
             'libappindicator-gtk3' 
             'cairo' 'libcairo.so' 
             "electron$_electronver")
source=("git+https://github.com/5rahim/seanime.git"
        "seanime-denshi.desktop"
        "seanime-denshi.sh.in"
        "deactivate-updater.patch")
sha256sums=('SKIP'
            '48a0fc259e347ad05575b594ca20e52e68c96fedcb04a157796ee15846959b1b'
            '7f36f983c1313bba1b5d718865fe6115764429ffad3886a6863ec309f78cbb0c'
            '77da87a9d62141cd10143790c1187c4a7646d5c06138ac2581ae5db9469a3019')
pkgver() {
    cd "$_pkgname"
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    
    #Add the electron version for denshi
    sed "s/@ELECTRON@/electron$_electronver/" ${_pkgname}-denshi.sh.in > ${_pkgname}-denshi.sh
    
    #Disable the updater for tauri
    cd "${_pkgname}"
    patch -Np1 -i ../deactivate-updater.patch
}

build() {
    
    cd "${_pkgname}/seanime-web"

    # Mirror the workflow, build order webapp > server > tauri app & denshi, start with webapp below

    npm install --cache "${srcdir}/npm-cache"
    npm run build
    npm run build:desktop
    npm run build:denshi
    
    # Needed for the server build, tauri build and denshi

    cp -r out/ ../web
    cp -r out-denshi/ ../seanime-denshi/web-denshi
    cp -r out-desktop/ ../web-desktop

    cd "${srcdir}/${_pkgname}"

    # Prepare for server
    mkdir -p binaries

    # Server: Can be build for both try to comform with upstream

    if [ "$CARCH" = aarch64 ]; then
    export GOARCH=arm64
    else
    export GOARCH=amd64
    fi

    #https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
    #(cgo) is required for linking
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
    
    #Prepare for binary
    mkdir -p binaries

    cp "${srcdir}/${_pkgname}/binaries/seanime-server-linux-${GOARCH}" ./binaries/

    # Prepare for system electron for use after build

    electronDist=/usr/lib/electron$_electronver
	electronVer=$(electron$_electronver --version | tail -c +2)
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1

    npm install --cache "${srcdir}/npm-cache"
    npm exec -c "electron-builder --linux --x64 --dir -c.electronDist=$electronDist \
	             -c.electronVersion=$electronVer"
   
   # Tauri app
  
   cd "${srcdir}/${_pkgname}/seanime-desktop"
  
   npm install --cache "${srcdir}/npm-cache"
  
   cd "src-tauri/"
  
   cp "${srcdir}/${_pkgname}/binaries/seanime-server-linux-${GOARCH}" ./binaries/seanime-"$(rustc -vV | sed -n 's/host: //p')"
  
   # Build tauri with clang to not raise errors, bundle as 'deb' instead of 'appimage'
  
   export CC=clang
   export CXX=clang++
   export ld=lld
   export llvm=1
   export RUSTFLAGS="-Cforce-frame-pointers=yes -Clinker=clang -Clink-arg=-fuse-ld=lld"
   export RUSTUP_TOOLCHAIN=stable
   cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
   cargo tauri build -b deb --ci
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
             'hicolor-icon-theme' 
             "electron$_electronver")

    install -Dm644 "seanime-denshi.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "seanime-denshi.sh" "${pkgdir}/usr/bin/${_pkgname}-denshi"
    install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}-denshi"

    cd "${_pkgname}/seanime-denshi"

    install -Dm644 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}-denshi"
    install -Dm755 "dist/linux-unpacked/resources/binaries/seanime-server-linux-${GOARCH}" -t "${pkgdir}/usr/lib/electron36/resources/binaries"
    for icon in $(find assets -regex '.*/[0-9]+x[0-9]+\.png' | sort -n); do
    size=$(basename -s .png "$icon")
    install -Dm644 "assets/$size.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}-denshi.png"
    done
}

package_seanime-desktop-git() {
    depends=('gcc-libs'
             'glibc'
             'glib2'
             'webkit2gtk-4.1'
             'libgdk_pixbuf-2.0.so'
             'hicolor-icon-theme'
             'libsoup-3.0.so'
             'gtk3'
             'libcairo.so')

    install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}-desktop"

    cd "${_pkgname}/seanime-desktop/src-tauri"

    cp -r 'target/release/bundle/deb/Seanime Desktop_2.9.10_amd64/data/usr' "${pkgdir}"
}
