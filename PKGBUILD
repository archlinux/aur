# Maintainer: ca-x <https://github.com/ca-x>
pkgname=lightos-codec-ffmpeg-bin
pkgver=0.1.24
pkgrel=1
pkgdesc='Optional Arch-native FFmpeg hardware H.264 worker for LightOS remote desktop'
arch=('x86_64')
url='https://github.com/ca-x/lightos-remote-desktop'
license=('PolyForm-Noncommercial-1.0.0' 'MIT' 'BSD-2-Clause' 'BSD-3-Clause' 'IJG' 'Zlib' 'WTFPL')
depends=('glibc' 'libgcc' 'libstdc++' 'ffmpeg' 'libavcodec.so=63-64'
         'libavutil.so=61-64' 'libswscale.so=10-64')
makedepends=('python' 'binutils')
optdepends=('lightos-remoted-bin: Remote desktop service that discovers this optional worker')
provides=("lightos-codec-ffmpeg=$pkgver")
conflicts=('lightos-codec-ffmpeg')
options=('!strip' '!debug')
install=lightos-codec-ffmpeg-bin.install
_bundle=lightos-codec-ffmpeg-linux-x86_64-archlinux
source=('lightos-codec-ffmpeg-bin.install' 'validate-arch-codec.py')
sha256sums=('0b269f4269f4d39719f6654e8e094ff6bf9672a0d0dda92411000a16126e3bae'
            'b1a16652f3ffef6185f0636da9c6fc9bbc665ffb9c0a7dc98776373b1b4b1a91')
sha256sums_x86_64=('40d93666ea635c4a21011413c6b210779d6eb7a5b5b5d00174cb91e4ee83f73f'
                   '973608c195e5f4b894e5866d6be04b2f5a82a3b176e850714ebaadb56e42b2f1')
source_x86_64=("${_bundle}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_bundle}.tar.gz"
               "${_bundle}-${pkgver}.tar.gz.sha256::${url}/releases/download/v${pkgver}/${_bundle}.tar.gz.sha256")

prepare() {
    local expected
    expected=$(awk -v name="${_bundle}.tar.gz" '$2 == name && $1 ~ /^[0-9a-f]+$/ && length($1)==64 { print $1 }' "${_bundle}-${pkgver}.tar.gz.sha256")
    [[ $expected =~ ^[0-9a-f]{64}$ ]] || return 1
    printf '%s  %s\n' "$expected" "${_bundle}-${pkgver}.tar.gz" | sha256sum --check --status || return 1
    python "$srcdir/validate-arch-codec.py" "$srcdir/$_bundle" || return 1
}

package() {
    install -Dm755 "${_bundle}/lightos-codec-ffmpeg" "$pkgdir/usr/lib/lightos-remoted/lightos-codec-ffmpeg"
    install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/$pkgname"
    ln -s /usr/lib/lightos-remoted/lightos-codec-ffmpeg "$pkgdir/usr/bin/lightos-codec-ffmpeg"
    install -m644 "${_bundle}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -a "${_bundle}/licenses/." "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 "${_bundle}/README.md" "${_bundle}/dependencies.txt" "${_bundle}/ffmpeg-abi.txt" "${_bundle}/abi.json" "$pkgdir/usr/share/doc/$pkgname/"
}
