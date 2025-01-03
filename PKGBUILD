# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: dadav <33197631+dadav@users.noreply.github.com>
pkgname=go2rtc
pkgver=1.9.8
pkgrel=1
pkgdesc="Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc."
arch=('x86_64')
url="https://github.com/AlexxIT/go2rtc"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "sysuser"
        "tmpfile"
        "service"
        "config")
sha512sums=('29f52b04e18107552175595bf6782bbb24afb7afdd7dd125142fc0e57bbfa18da0ed212e7ebd0c6f104444808be8ebcef2ab7200cea532ba38970f0f79fa127c'
            'eaaf6f9b0840ce88e5a6a12c47d3f969a2cbec0a62e234e16a7d21b58a1064b3f20871fb11c15b248f4f31f7da853bc48d5a621b27aeddeed56c3818707a7d32'
            '45f2adc4a17f6cb0252c9cb25adaa8a32d4f198a4d8bc143e00ba185e4a7afd8e45fbb3ce5dbb9238a2f3a84721e1067b641cc6eb2b3a10db72b2f748a1e875f'
            '3d2dead86d903cc37f29d74dc263b760ba52a838b0974fc1cfd46c4a8e4a4eff7afc893fd00774a0fcff734ca2a30b2e58bfe066a38e1eb6baa6c35c4470595f'
            '06e458dad58d837051c1a53d06a8887087b565a036c520381e23f90a7cfe2181ec64f447e0d653c4832a2372056bcee27752e92704dedfe70972b48e156e2af7')
options=(!strip)
depends=('glibc')
makedepends=('go')
backup=(etc/go2rtc.yaml)

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
  install -D -m644 "${pkgname}-${pkgver}"/README.md "${pkgdir}/usr/doc/go2rtc/README.md"
  install -D -m644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/LICENSE"
  install -D -m644 "${srcdir}"/sysuser "${pkgdir}/usr/lib/sysusers.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/tmpfile "${pkgdir}/usr/lib/tmpfiles.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/service "${pkgdir}/usr/lib/systemd/system/go2rtc.service"
  install -D -m600 "${srcdir}"/config "${pkgdir}/etc/go2rtc.yaml"
}
