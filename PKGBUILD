# Maintainer: Emiliopg91 <ojosdeserbio@gmail.com>
pkgname=rog-perf-tuner-git
pkgver=4.13.2.r11
pkgrel=1
pkgdesc="An utility to manage Asus Rog laptop performance and RGB lighting"
arch=(
  'x86_64'
)
url="https://github.com/Emiliopg91/RogPerfTuner"
license=(
  'GPL2'
)
source=(
  "git+$url.git#commit=3d6a79de"
)
sha256sums=(
  'SKIP'
)
options=(
  '!debug'
  '!lto'
)
provides=('rog-perf-tuner')
replaces=('rog-perf-tuner')
conflicts=('rog-perf-tuner')
depends=(
  'asusctl'
  'coreutils'
  'hicolor-icon-theme'
  'hidapi'
  'konsole'
  'libusb'
  'mangohud-git'
  'nlohmann-json'
  'power-profiles-daemon'
  'python'
  'python-pip'
  'python-yaml'
  'qt6-base'
  'qt6-charts'
  'qt6-svg'
  'qtermwidget'
  'qtkeychain-qt6'
  'scx-scheds'
  'openssl'
  'switcheroo-control'
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
install=rog-perf-tuner-git.install

prepare() {
    if [[ ! -d "${HOME}/.local/share/pnpm" ]]; then
        echo "Setup for pnpm..."
        SHELL=/bin/bash pnpm setup
    fi

    cd "$srcdir/RogPerfTuner"
    git submodule update --init --recursive
}

build() {
    pip install --break-system-packages asyncio pyyaml

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
    GIT_RELEASE=1 make pkgbuild
}

package() {
    cd "$srcdir/RogPerfTuner"

    install -Dm755 build/RogPerfTuner/RogPerfTuner "$pkgdir/usr/bin/rog-perf-tuner"
    
    install -d "$pkgdir/usr/share/rog-perf-tuner"
    cp -r build/assets/* "$pkgdir/usr/share/rog-perf-tuner/"
    chmod -R 755 "$pkgdir/usr/share/rog-perf-tuner/"
    install -Dm644 "$pkgdir/usr/share/rog-perf-tuner/OpenRGB/60-openrgb.rules" "$pkgdir/usr/lib/udev/rules.d/60-rog-perf-tuner.rules"
    rm "$pkgdir/usr/share/rog-perf-tuner/OpenRGB/60-openrgb.rules"
    rm "$pkgdir/usr/share/rog-perf-tuner/suggestions.yaml"

    install -Dm755 resources/RogPerfTuner.desktop "$pkgdir/usr/share/applications/rog-perf-tuner.desktop"
}
