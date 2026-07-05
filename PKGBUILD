# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=audio.cpp-git
pkgver=r48.e74a290
pkgrel=1
pkgdesc='All-in-one C++ audio inference engine on ggml: TTS, voice cloning, ASR, VAD, diarization, source separation, music generation'
arch=('x86_64')
url='https://github.com/0xShug0/audio.cpp'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    export CFLAGS+=" -ffile-prefix-map=${srcdir}/="
    export CXXFLAGS+=" -ffile-prefix-map=${srcdir}/="
    cmake -S "${srcdir}/${pkgname%-git}" -B build \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build --target audiocpp_cli audiocpp_server -- -j"$(nproc)"
}

package() {
    install -Dm755 build/bin/audiocpp_cli build/bin/audiocpp_server -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}"/README.md "${srcdir}/${pkgname%-git}"/docs/*.md \
        -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
