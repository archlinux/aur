# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: dadav <33197631+dadav@users.noreply.github.com>
pkgname=go2rtc
pkgver=1.9.14
pkgrel=3
pkgdesc="Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc."
arch=('x86_64')
url="https://github.com/AlexxIT/go2rtc"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "go2rtc.sysusers"
        "go2rtc.tmpfiles"
        "go2rtc.service"
        "go2rtc.config")
sha512sums=('8203af6ff588fec038a8fbe19913397534fbf93af48a5035a67b3142bc1c2d6b16ba963ad29ebe839fd8a25a12da251a4cce54429b7afce72745134a4d0cb850'
            '8b5c6138cbb4e65395f0f97c7efa12f6811b3a5f9694f855380405c8d00d1e0379281a016fb0877ad15db8fcb9e593d9764ccba1005569d83fed7d343ffd05b3'
            '45f2adc4a17f6cb0252c9cb25adaa8a32d4f198a4d8bc143e00ba185e4a7afd8e45fbb3ce5dbb9238a2f3a84721e1067b641cc6eb2b3a10db72b2f748a1e875f'
            'e4cc0dd32052816fe0aca009c7c1f295c42485951df6af1964725c19ae09d3c78eac7092e20a68c21ec0bf595afdd4bc16321e977729028dc9994f52d28f9128'
            '06e458dad58d837051c1a53d06a8887087b565a036c520381e23f90a7cfe2181ec64f447e0d653c4832a2372056bcee27752e92704dedfe70972b48e156e2af7')
depends=('ffmpeg')
makedepends=('go' 'alsa-lib' 'v4l-utils')
backup=(etc/go2rtc.yaml)

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  CGO_ENABLED=0 go build -ldflags "-compressdwarf=false -buildid=" .
}

package() {
  install -D -m755 "${pkgname}-${pkgver}"/go2rtc "${pkgdir}/usr/bin/go2rtc"
  install -D -m644 "${pkgname}-${pkgver}"/README.md "${pkgdir}/usr/share/doc/go2rtc/README.md"
  install -D -m644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/go2rtc/LICENSE"
  install -D -m644 "${srcdir}"/go2rtc.sysusers "${pkgdir}/usr/lib/sysusers.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/go2rtc.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/go2rtc.service "${pkgdir}/usr/lib/systemd/system/go2rtc.service"
  install -D -m600 "${srcdir}"/go2rtc.config "${pkgdir}/etc/go2rtc.yaml"
}
