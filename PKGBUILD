# Maintainer: Emiliopg91 <ojosdeserbio@gmail.com>
pkgname=rog-perf-tuner-git
pkgver=4.14.10.r4
pkgrel=1
pkgdesc="An utility to manage Asus Rog laptop performance and RGB lighting"
arch=(
  'x86_64'
)
url="https://github.com/Emiliopg91/RogPerfTuner"
packager="Emiliopg91 <ojosdeserbio@gmail.com>"
license=(
  'GPL2'
)
source=(
  "git+$url.git#commit=5e039a83"
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
  'curl'
  'hicolor-icon-theme'
  'hidapi'
  'konsole'
  'libusb'
  'power-profiles-daemon'
  'psmisc'
  'qt6-base'
  'util-linux'
  'webkit2gtk-4.1'
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
  'python'
  'rust'
  'unzip'
  'zip'
)
optdepends=(
  'mangohud-git: Monitoring FPS, temperatures, CPU/GPU load and more'
  'scx-scheds: Use sched-ext schedulers'
  'switcheroo-control: Allow GPU selector for games'
  'steam: Define and apply automatically performance configurations for games'
)

install=rog-perf-tuner-git.install

prepare() {
    cd "$srcdir/RogPerfTuner"

    git submodule init
    git submodule sync
    git submodule update --init --recursive --depth 1
}

build() {
    cd "$srcdir/RogPerfTuner"

    export CARGO_BUILD_JOBS=$(nproc)
    if [ -z "$GITHUB_ACTIONS" ] && [ -z "$CI" ]; then
        export RUSTFLAGS="-C target-cpu=native"
    fi

    GIT_RELEASE=1 make build
}

package() {
    cd "$srcdir/RogPerfTuner"

    install -Dm755 src-tauri/target/release/rog-perf-tuner "$pkgdir/usr/bin/rog-perf-tuner"

    install -d "$pkgdir/usr/share/rog-perf-tuner"
    cp -r build/assets/* "$pkgdir/usr/share/rog-perf-tuner/"
    chmod -R 755 "$pkgdir/usr/share/rog-perf-tuner/"
    install -Dm644 "$pkgdir/usr/share/rog-perf-tuner/OpenRGB/60-openrgb.rules" "$pkgdir/usr/lib/udev/rules.d/60-rog-perf-tuner.rules"
    rm "$pkgdir/usr/share/rog-perf-tuner/OpenRGB/60-openrgb.rules"
    rm "$pkgdir/usr/share/rog-perf-tuner/suggestions.yaml"

    install -Dm755 resources/RogPerfTuner.desktop "$pkgdir/usr/share/applications/rog-perf-tuner.desktop"

    install -Dm644 resources/completion-bash \
        "$pkgdir/usr/share/bash-completion/completions/rog-perf-tuner"
}
