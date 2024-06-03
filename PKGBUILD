# Maintainer: Mekyt <hello at mek dot yt>

pkgname='onnxruntime-server'
pkgver=1.18.0
pkgrel=2
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
  'fe401d3d37388d313be3a2820e0d43fcd9b7a757a5afa398900afd622780b8b9f31f80716d83534bf91be3f2b2cf5052a0f262e982bda296e429c7a447eac593'
  '80657a51c70d6be0a6e230a78cfee278b92b040b1a9d08977ccaff9ee643b87abcf045825c4772ec0f1520d50c1602172b4bb57fd3ceea81ef6cde4f30e2d185'
  '4bfbc47d79e3e9b9f748c3876d407d72f28d4ba91daef704684efc22b62b2ac92eaa5a36982519d94d73cb364f43c80243642e17876682ef2c5dbaa8416caadc'
  '4d75919838753f4ca7226713e80b0992bc3d8ccbf3cab8810a0bb716f1eedc119c7397580794bd6faf5783c98399f20e21c92882be7254388a7b721ece284ff6'
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
    install -Dm 640 config.env "${pkgdir}/etc/onnxruntime-server/config.env"

    cd "${pkgname}-${pkgver}"

    install -Dm 755 "build/src/standalone/onnxruntime_server" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
