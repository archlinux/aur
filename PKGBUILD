# Maintainer: Emiliopg91 <ojosdeserbio@gmail.com>
pkgname=rog-perf-tuner
pkgver=4.5.5
pkgrel=2
pkgdesc="RogPerfTuner - An utility to manage Asus Rog laptop performance and RGB lighting"
arch=(
    'x86_64'
)
url="https://github.com/Emiliopg91/RogPerfTuner"
license=(
    'GPL2'
)
source=(
    "git+https://github.com/Emiliopg91/RogPerfTuner.git#tag=$pkgver"
)
sha256sums=(
    'SKIP'
)
options=(
    '!strip'
    '!debug'
    '!lto'
)
depends=(
  'asusctl'
  'coreutils'
  'hicolor-icon-theme'
  'hidapi'
  'libusb'
  'power-profiles-daemon'
  'python'
  'python-pip'
  'qt6-base'
  'qt6-charts'
  'qt6-svg'
  'qtkeychain-qt6'
  'scx-scheds'
  'spdlog'
  'upower'
  'yaml-cpp'
)
makedepends=(
  'base-devel'
  'clang'
  'cmake'
  'git'
  'fuse2'
  'ninja'
  'npm'
  'pkgconf'
  'pnpm'
  'qtcreator'
  'unzip'
  'zip'
)

prepare() {
    if [[ ! -d "${HOME}/.local/share/pnpm" ]]; then
        echo "Setup for pnpm..."
        SHELL=/bin/bash pnpm setup
    fi

    cd "$srcdir/RogPerfTuner"
    git submodule update --init --recursive
}

build() {
    export APPIMAGE_EXTRACT_AND_RUN=1
    unset SOURCE_DATE_EPOCH

    clean_flags() {
        echo "$1" \
        | sed -E 's/(^| )-Wp,-D_FORTIFY_SOURCE=[0-9]+//g' \
        | sed -E 's/(^| )-D_FORTIFY_SOURCE=[0-9]+//g' \
        | sed -E 's/(^| )-O[0-9sfast]*//g' \
        | tr -s ' ' \
        | sed -E 's/-Wp, */-Wp,/g'
    }

    CFLAGS=$(clean_flags "$CFLAGS")
    CXXFLAGS=$(clean_flags "$CXXFLAGS")

    export CFLAGS="${CFLAGS}"
    export CXXFLAGS="${CXXFLAGS}"

    cd "$srcdir/RogPerfTuner"
    IS_AURPKG=1 make release
}

package() {
    cd "$srcdir/RogPerfTuner"

    install -Dm755 build/RogPerfTuner/RogPerfTuner "$pkgdir/usr/bin/rog-perf-tuner"
    
    install -d "$pkgdir/usr/share/rog-perf-tuner"
    cp -r build/assets/* "$pkgdir/usr/share/rog-perf-tuner/"
    chmod -R 755 "$pkgdir/usr/share/rog-perf-tuner/"

    install -Dm755 resources/RogPerfTuner.desktop "$pkgdir/usr/share/applications/rog-perf-tuner.desktop"

}
