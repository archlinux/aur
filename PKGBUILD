# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: dadav <33197631+dadav@users.noreply.github.com>
pkgname=go2rtc
pkgver=1.9.13
pkgrel=1
pkgdesc="Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc."
arch=('x86_64')
url="https://github.com/AlexxIT/go2rtc"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "sysuser"
        "tmpfile"
        "service"
        "config"
        "import-c.patch"
        "remove-main.patch")
sha512sums=('2b1a340fae8309a6ffa0b84cf781317fa2c11eb091ef843b884cedd7b0a107c7b1c840314b91d711bf086f46246bd3b51fcd215f2ff5512a19673d030c87da3e'
            '8b5c6138cbb4e65395f0f97c7efa12f6811b3a5f9694f855380405c8d00d1e0379281a016fb0877ad15db8fcb9e593d9764ccba1005569d83fed7d343ffd05b3'
            '45f2adc4a17f6cb0252c9cb25adaa8a32d4f198a4d8bc143e00ba185e4a7afd8e45fbb3ce5dbb9238a2f3a84721e1067b641cc6eb2b3a10db72b2f748a1e875f'
            '3d2dead86d903cc37f29d74dc263b760ba52a838b0974fc1cfd46c4a8e4a4eff7afc893fd00774a0fcff734ca2a30b2e58bfe066a38e1eb6baa6c35c4470595f'
            '06e458dad58d837051c1a53d06a8887087b565a036c520381e23f90a7cfe2181ec64f447e0d653c4832a2372056bcee27752e92704dedfe70972b48e156e2af7'
            'cb1cc2c78ed98fbf4a86847568ed713ae91ec2c314fde441ae7ec650dfbe3b6584f23c1c6be51a2d1d6bf7b13d07d82dc57009120006e32189da1499392ff5b5'
            '06617ae3d07a1aa20ae344a6e9bc551ee9e7eed9c68ae459d6531ce8b490c8f0db74dc3e7d0d2109adb1b21f9491f209368da6ac02f06ac6ff472fe9f143f26c')
options=(!strip)
depends=('ffmpeg')
makedepends=('go' 'alsa-lib' 'v4l-utils')
backup=(etc/go2rtc.yaml)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../import-c.patch
  patch -Np1 -i ../remove-main.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  install -D -m755 "${pkgname}-${pkgver}"/go2rtc "${pkgdir}/usr/bin/go2rtc"
  install -D -m644 "${pkgname}-${pkgver}"/README.md "${pkgdir}/usr/share/doc/go2rtc/README.md"
  install -D -m644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/go2rtc/LICENSE"
  install -D -m644 "${srcdir}"/sysuser "${pkgdir}/usr/lib/sysusers.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/tmpfile "${pkgdir}/usr/lib/tmpfiles.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/service "${pkgdir}/usr/lib/systemd/system/go2rtc.service"
  install -D -m600 "${srcdir}"/config "${pkgdir}/etc/go2rtc.yaml"
}
