# Maintainer: ca-x <https://github.com/ca-x>
pkgname=lightos-codec-ffmpeg-bin
pkgver=0.1.13
pkgrel=1
pkgdesc='Optional Arch-native FFmpeg hardware H.264 worker for LightOS remote desktop'
arch=('x86_64')
url='https://github.com/ca-x/lightos-remote-desktop'
license=('MIT' 'BSD-2-Clause' 'BSD-3-Clause' 'IJG' 'Zlib' 'WTFPL')
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
sha256sums=('57819d8658719114e59247776cf769046de25dd43ad2d99fbfef155a2c9ad3a7'
            'b1a16652f3ffef6185f0636da9c6fc9bbc665ffb9c0a7dc98776373b1b4b1a91')
sha256sums_x86_64=('01b1f5af32c91d00e824723796de39c58e9c757fd4ea69003051f40c476cf1bf'
                   'aed4280102f9faca2e4c2d747284a9db6e929a0fb1181602f7dc17bedbbbee7b')
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
