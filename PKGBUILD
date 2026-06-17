# Maintainer: ezberlin <ezberlin at proton dot me>
pkgname=lichess-mobile-git
_pkgname=lichess-mobile
pkgver=0.24.6.r12.g605d9d5
pkgrel=1
pkgdesc="Linux build of the official Flutter Lichess client"
arch=('x86_64')
url="https://lichess.org/app"
license=('GPL-3.0-only')
depends=(
    'gtk3' 
    'pango'
    'fontconfig'
    'libepoxy'
    'glibc'
    'at-spi2-core'
    'glib2'
    'cairo'
    'libstdc++'
    'hicolor-icon-theme'
    'libgcc'
    'libsecret'
    'bash'
)
makedepends=(
    'fvm' 
    'pkgconf' 
    'cmake' 
    'clang' 
    'ninja'
    'git'
)
source=(
    "source-${_pkgname}::git+https://github.com/lichess-org/mobile.git"
    "${_pkgname}"
    "${_pkgname}.desktop"
)
sha256sums=(
    'SKIP'
    'fb76904e9943ffe0c32b810333a6392d45934a9dab99f81196d0f972affbaf12'
    '0f0e8008e548db36b5f43aaf8e77a14cb40f7de3f14c26454ab246c35547ad85'
)
pkgver() {
  cd "source-${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "source-${_pkgname}"

    # Adjust server url
    if [[ -f "lib/src/constants.dart" ]]; then
	cp lib/src/constants.dart lib/src/constants.dart.orig
	sed -i 's/lichess.dev/lichess1.org/g' lib/src/constants.dart
    fi
    
    # Prevent home directory spam
    export FVM_CACHE_PATH="${srcdir}/fvm"

    # Install and prepare Flutter
    fvm use stable
    fvm flutter config --no-analytics
    fvm flutter pub get "${_flutter_ver}"
    fvm flutter clean
}

build() {
    cd "source-${_pkgname}"

    fvm dart run build_runner build
    fvm flutter build linux --release
}

package() {
    cd "source-${_pkgname}"

    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "assets/images/logo-white.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}" # Wrapper
}
