# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: dadav <33197631+dadav@users.noreply.github.com>
pkgname=go2rtc
pkgver=1.9.9
pkgrel=2
pkgdesc="Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc."
arch=('x86_64')
url="https://github.com/AlexxIT/go2rtc"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "sysuser"
        "tmpfile"
        "service"
        "config"
        "commit-47f32a5f.patch"
        "import-c.patch"
        "remove-main.patch")
sha512sums=('a41c27c4ff2861c0ff60bb102f44bd03e4e577b56d9bfd54b6f1a66999950be93664b9e01bc573e3d5c6bb614ceb02822a0548e226280586fb50af69151cc958'
            'eaaf6f9b0840ce88e5a6a12c47d3f969a2cbec0a62e234e16a7d21b58a1064b3f20871fb11c15b248f4f31f7da853bc48d5a621b27aeddeed56c3818707a7d32'
            '45f2adc4a17f6cb0252c9cb25adaa8a32d4f198a4d8bc143e00ba185e4a7afd8e45fbb3ce5dbb9238a2f3a84721e1067b641cc6eb2b3a10db72b2f748a1e875f'
            '3d2dead86d903cc37f29d74dc263b760ba52a838b0974fc1cfd46c4a8e4a4eff7afc893fd00774a0fcff734ca2a30b2e58bfe066a38e1eb6baa6c35c4470595f'
            '06e458dad58d837051c1a53d06a8887087b565a036c520381e23f90a7cfe2181ec64f447e0d653c4832a2372056bcee27752e92704dedfe70972b48e156e2af7'
            'bab4828eb73d8a3daecacb8359246becbccb391b7cf94e6c7ccd9cc9747170aed14558c99e59b4274e998728fcfe6d1de9aa7e8f214f6e8781b6c7442bfe97f6'
            'a93b05fb38c34a64d1522d903ad5681ea2f5e0b66680e950d7c113632316e5fc78f25c88f47aa3021766227e16cc2a1d46016fadf4b32f2b623919dae6316dfb'
            '9efe4ffa1001cd0c94078cd8e544e8fddb9869188cfd55da4307b5b2f3e103b97ed84b01deca4fbbc93d0f7448031b5193202b0d6d719662fde5cb191083b430')
options=(!strip)
depends=('glibc' 'ffmpeg')
makedepends=('go' 'v4l-utils')
backup=(etc/go2rtc.yaml)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../commit-47f32a5f.patch
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
  install -D -m644 "${pkgname}-${pkgver}"/README.md "${pkgdir}/usr/doc/go2rtc/README.md"
  install -D -m644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/LICENSE"
  install -D -m644 "${srcdir}"/sysuser "${pkgdir}/usr/lib/sysusers.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/tmpfile "${pkgdir}/usr/lib/tmpfiles.d/go2rtc.conf"
  install -D -m644 "${srcdir}"/service "${pkgdir}/usr/lib/systemd/system/go2rtc.service"
  install -D -m600 "${srcdir}"/config "${pkgdir}/etc/go2rtc.yaml"
}
