# Maintainer: Mekyt <hello at mek dot yt>

pkgname='onnxruntime-server'
pkgver=1.18.0
pkgrel=1
pkgdesc='TCP and HTTP/HTTPS REST APIs for ONNX inference'
arch=('x86_64')
url='https://github.com/kibae/onnxruntime-server'
license=('MIT')
depends=('onnxruntime' 'boost-libs' 'openssl' 'gcc-libs' 'glibc' 'openmpi')
makedepends=('cmake' 'gcc')
optdepends=(
  'cuda: CUDA support'
  'cudnn: cuDNN support'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kibae/onnxruntime-server/archive/refs/tags/v${pkgver}.tar.gz"
  'onnxruntime-server.service'
  'onnxruntime-server.sysusers'
  'onnxruntime-server.tmpfiles'
  'config.env'
)
b2sums=(
  'a7b64b6fdb80a971c0cb5ed97adf9217203df22a9eccf38de3430821575c839d1a5398b4639d2ad0438edd7b35993f55536150c6c7e6a4aea4d966a8adf8ed0f'
  'eb800d57d390c77eb298a5f4c4e4e3e839cc80bb24b86fb766be9ba9fa422904fff3943876066d2ea33694b9b50e0e2d7122d95566bd078ff45d78a2a8f51a14'
  '80c8590fcd478f4c5d661d6a04f0379f67f05366951cd00ae1eb6995cd42a6edd4c984be558283fc42a97860186649817142cd2318216293809a1a55b690a48f'
  '4bfbc47d79e3e9b9f748c3876d407d72f28d4ba91daef704684efc22b62b2ac92eaa5a36982519d94d73cb364f43c80243642e17876682ef2c5dbaa8416caadc'
  'c1ac1cee27a124d0e759cf1a86df27e2e975c815c59c22174b4cc258efe58cc5133a1024f87344786cf12f9f90a19025a7fa2139d34980abf9d8079f067cbbcf'
)

backup=('etc/onnxruntime-server/config.env')

build() {
    cd "${pkgname}-${pkgver}"

    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
    cmake --build build --parallel
}

package() {
    install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm 644 config.env "${pkgdir}/etc/onnxruntime-server/config.env"

    cd "${pkgname}-${pkgver}"

    install -Dm 755 "build/src/standalone/onnxruntime_server" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
