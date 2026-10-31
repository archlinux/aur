# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: lori28167 <lori28167@users.noreply.github.com>
pkgname=ssc-codec-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Samsung Scalable/Seamless Codec (SSC) A2DP codec for PipeWire (Galaxy Buds), replaces the aptx plugin'
arch=('x86_64')
url='https://github.com/lori28167/SamsungSeamlessCodec-linux'
license=('GPL-3.0-or-later AND BSD-3-Clause')
depends=('pipewire-audio' 'bluez-libs')
makedepends=('git' 'meson' 'pipewire')
provides=('ssc-codec')
conflicts=('ssc-codec')
options=('!debug')
install=ssc-codec.install
source=("git+$url.git"
        'ssc-codec.hook'
        'ssc-codec-activate')
sha256sums=('SKIP'
            '7e0fb8b158dd2bf548030593e5610fd41c3fc701becf33d7a599aadb249a24c4'
            '00cffeefd9b4bfa2121be8b0ad6b4455ed380839e603226b3ab42d529e41361d')

pkgver() {
    cd SamsungSeamlessCodec-linux
    local d
    if d=$(git describe --long --tags 2>/dev/null); then
        printf '%s' "$d" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    # always compile: the plugin uses PipeWire's private codec interface and must match the installed version
    arch-meson SamsungSeamlessCodec-linux build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    # not in the PipeWire plugin directory: that file belongs to pipewire-audio (aptx), see ssc-codec.hook
    install -Dm755 build/libspa-codec-bluez5-aptx.so "$pkgdir/usr/lib/ssc-codec/libspa-codec-bluez5-aptx.so"
    install -Dm755 ssc-codec-activate "$pkgdir/usr/share/libalpm/scripts/ssc-codec-activate"
    install -Dm644 ssc-codec.hook "$pkgdir/usr/share/libalpm/hooks/ssc-codec.hook"
    install -Dm644 SamsungSeamlessCodec-linux/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 SamsungSeamlessCodec-linux/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
