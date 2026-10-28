# Maintainer: ca-x <https://github.com/ca-x>
pkgname=lightos-remoted-bin
pkgver=0.1.22
pkgrel=1
pkgdesc='Cross-platform Rust remote desktop host for browser clients (Linux binary)'
arch=('x86_64')
url='https://github.com/ca-x/lightos-remote-desktop'
license=('PolyForm-Noncommercial-1.0.0' 'MIT' 'BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'wayland' 'libxkbcommon' 'libpulse'
         'hyprland' 'aquamarine=0.15.1' 'hyprutils' 'libdisplay-info' 'libdrm'
         'libglvnd' 'libhyprutils.so' 'libdisplay-info.so' 'libinput' 'mesa' 'pixman' 'seatd' 'systemd-libs'
         'cage' 'ghostty' 'ttf-liberation' 'dbus' 'pipewire' 'pipewire-pulse'
         'wireplumber' 'wl-clipboard' 'xorg-xauth' 'systemd' 'shadow' 'bash' 'coreutils' 'util-linux' 'gawk')
optdepends=('lightos-codec-ffmpeg-bin: Optional native hardware H.264 encoders; software fallback remains available')
makedepends=('cmake' 'ninja' 'pkgconf' 'hyprwayland-scanner' 'wayland-protocols' 'hwdata' 'patch')
provides=("lightos-remoted=$pkgver" "lightos-remote-desktop=$pkgver")
conflicts=('lightos-remoted' 'lightos-remote-desktop')
options=('!strip' '!debug')
install=lightos-remoted-bin.install
_aqcommit=f31c47a1b9d300847d8fc3108ad959448103dfc1
_bundle=lightos-remoted-linux-x86_64
source=("aquamarine-0.15.1-${_aqcommit}.tar.gz::https://codeload.github.com/hyprwm/aquamarine/tar.gz/${_aqcommit}"
        'aquamarine-wayland.patch' 'lightos-remoted-bin.install')
sha256sums=('975a3479b458722ec2e34e5fed9cdd46f77fa70485431f70093693532f685ff3'
            'c905d0cb7abb194e2772b4a655bd834b7f198f92b38de228040d37e4cc492986'
            'f31d2a33bae7aeecf890e927e8575f6768a2ebfa0d21da3a26c0b81e79b81c78')
sha256sums_x86_64=('77cf64158c713fbea7fd79ccbdb92f5c5e88277ef854966e6ee095ccbbab261e'
                   '0edc9df1af1638ec05662f1adcfa017d84ac4c02602793add95e3017b8446d6c')
source_x86_64=("${_bundle}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_bundle}.tar.gz"
               "${_bundle}-${pkgver}.tar.gz.sha256::${url}/releases/download/v${pkgver}/${_bundle}.tar.gz.sha256")

prepare() {
    # Verify the release's checksum as well as makepkg's independently recorded sums.
    local expected
    expected=$(awk -v name="${_bundle}.tar.gz" '$2 == name && $1 ~ /^[0-9a-f]+$/ && length($1)==64 { print $1 }' "${_bundle}-${pkgver}.tar.gz.sha256")
    [[ $expected =~ ^[0-9a-f]{64}$ ]] || return 1
    printf '%s  %s\n' "$expected" "${_bundle}-${pkgver}.tar.gz" | sha256sum --check --status || return 1
    cd "aquamarine-${_aqcommit}"
    [[ $(<VERSION) == 0.15.1 ]] || return 1
    patch -Np1 -i ../aquamarine-wayland.patch
}

build() {
    [[ $(pkg-config --modversion aquamarine) == 0.15.1 ]] || return 1
    cmake -S "aquamarine-${_aqcommit}" -B aq-build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=/usr/src/lightos-remoted"
    cmake --build aq-build --target aquamarine
    readelf -d aq-build/libaquamarine.so.0.15.1 | grep -Fq 'Library soname: [libaquamarine.so.14]' || return 1
    readelf -d /usr/bin/Hyprland | grep -Fq 'Shared library: [libaquamarine.so.14]' || return 1
}

package() {
    local binary="$srcdir/${_bundle}/lightos-remoted"
    local units="$srcdir/generated-systemd"
    install -d "$units"
    "$binary" install-service --print-unit transport > "$units/lightos-remote-desktop.service" || return 1
    "$binary" install-service --print-unit session > "$units/lightos-remote-desktop-session.service" || return 1
    [[ -s $units/lightos-remote-desktop.service && -s $units/lightos-remote-desktop-session.service ]] || return 1
    install -Dm755 "${_bundle}/lightos-remoted" "$pkgdir/usr/lib/lightos-remoted/lightos-remoted"
    install -Dm755 aq-build/libaquamarine.so.0.15.1 "$pkgdir/usr/lib/lightos-remoted/aquamarine/libaquamarine.so.14"
    install -Dm644 "aquamarine-${_aqcommit}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/aquamarine.txt"
    install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/$pkgname"
    ln -s /usr/lib/lightos-remoted/lightos-remoted "$pkgdir/usr/bin/lightos-remoted"
    install -Dm644 "${_bundle}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -a "${_bundle}/licenses/." "$pkgdir/usr/share/licenses/$pkgname/"
    cp -a "${_bundle}/docs/." "$pkgdir/usr/share/doc/$pkgname/"
    install -m644 "${_bundle}/README.md" "${_bundle}/README.en.md" "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$units/lightos-remote-desktop.service" "$pkgdir/usr/lib/systemd/system/lightos-remote-desktop.service"
    install -Dm644 "$units/lightos-remote-desktop-session.service" "$pkgdir/usr/lib/systemd/system/lightos-remote-desktop-session.service"
}
