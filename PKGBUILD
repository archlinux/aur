# Maintainer: BrewCity <rickybrewing@gmail.com>
pkgname=beammp
pkgver=2.8.1
pkgrel=1
pkgdesc="Since the other packages i tried didnt want to work"
arch=('x86_64')
url="https://github.com/BeamMP/BeamMP-Launcher"
license=('AGPL-3.0-or-later')

depends=(
    'curl'
    'gcc-libs'
    'glibc'
    'openssl'
    'zlib'
)

makedepends=(
    'cmake'
    'git'
    'ninja'
    'pkgconf'
    'unzip'
    'zip'
)

optdepends=(
    'steam: launch BeamNG.drive through Steam'
)

provides=('beammp-launcher')
conflicts=(
    'beammp-launcher'
    'beammp-launcher-git'
)

source=(
    "BeamMP-Launcher-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'vcpkg::git+https://github.com/microsoft/vcpkg.git'
    'beammp.desktop'
)

sha256sums=('fb49ee9ab310927805ac448d2ddf47a25c9893a9deced0c8bdd7f5f33409d649'
            'SKIP'
            'd9212a9430e35d7f62918e706f2e6a786e61429db9a2f4ccb6a7effa8b51f32e')

prepare() {
    cd "$srcdir/vcpkg"
    ./bootstrap-vcpkg.sh -disableMetrics
}

build() {
    cmake \
        -S "$srcdir/BeamMP-Launcher-$pkgver" \
        -B "$srcdir/build" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_TOOLCHAIN_FILE="$srcdir/vcpkg/scripts/buildsystems/vcpkg.cmake" \
        -DVCPKG_TARGET_TRIPLET=x64-linux

    cmake --build "$srcdir/build" --parallel
}

package() {
    install -Dm755 \
        "$srcdir/build/BeamMP-Launcher" \
        "$pkgdir/usr/lib/beammp/BeamMP-Launcher"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/beammp" <<'EOF'
#!/bin/bash

data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/beammp"
system_launcher="/usr/lib/beammp/BeamMP-Launcher"
user_launcher="$data_dir/BeamMP-Launcher"

mkdir -p "$data_dir"

if [[ ! -x "$user_launcher" ]] ||
   ! cmp -s "$system_launcher" "$user_launcher"; then
    install -m755 "$system_launcher" "$user_launcher"
fi

cd "$data_dir" || exit 1
exec "$user_launcher" "$@"
EOF

    install -Dm644 \
        "$srcdir/beammp.desktop" \
        "$pkgdir/usr/share/applications/beammp.desktop"

    install -Dm644 \
        "$srcdir/BeamMP-Launcher-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
