# Maintainer: Emiliopg91 <ojosdeserbio@gmail.com>
pkgname=rog-perf-tuner
pkgver=4.5.0
pkgrel=1
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
  'fuse2'
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
  'upower'
)
makedepends=(
  'base-devel'
  'clang'
  'cmake'
  'git'
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
    cd "$srcdir/RogPerfTuner/dist/appimage-fs"

    install -Dm755 ../RogPerfTuner.AppImage \
        "$pkgdir/usr/bin/rog-perf-tuner"

    install -d "$pkgdir/usr/share/applications"
    sed -e 's|Exec=usr/bin/RogPerfTuner|Exec=/usr/bin/rog-perf-tuner|' \
        -e 's|Icon=icon|Icon=rog-perf-tuner|' \
        rog-perf-tuner.desktop > "$pkgdir/usr/share/applications/rog-perf-tuner.desktop"

    install -Dm644 icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/rog-perf-tuner.svg"
}
