# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=cri-o
pkgver=1.19.0
pkgrel=1
pkgdesc="Open Container Initiative-based implementation of Kubernetes Container Runtime Interface"
arch=('x86_64')
url="https://github.com/cri-o/cri-o"
license=('Apache')
depends=('glibc')
makedepends=('gpgme' 'go' 'go-md2man' 'libseccomp' 'ostree')
optdepends=('cni-plugins: for CNI networking'
            'conmon: for per-container monitoring')
backup=('etc/crio/crio.conf')
# configuration override and hook directories should exist
options=('emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-1.19.0-pinns_pie.patch")
sha512sums=('15b506d755be735d7b71e503b02b309693e3090be41f5790bd34cec460238eab56829239caf18849f3656cf8c12f77a10bbb3ae4ad81eb4e18858946e454583d'
            '1eb382a0a5c273a6ed1df9666ff2b7a83cdb513818f85ca9984da254aecf518580c1b13410715eb73fd1bc7d687a4fd6ef5ae30eb11a1046e422157f117aeb1a')
b2sums=('8288985392a08fb7fdc58f509d34f8814bf9670386b7aae42be349765cb1f3bd3f4b77077e9c282a4a25b0f99b8a8fc335c6a53053bd2575b3e23c225483a1d3'
        '8d77c8060f483c943bd48d9bc2c1d676878e570b29989b7ff733906612b6dff09ed1ffcabc5174175ebc667df897e37e98a8132016bddcb27137661fca2da6dd')

prepare() {
  cd "${pkgname}-${pkgver}"
  # make sure that /usr/bin is used in systemd units
  sed -e 's|/usr/local|/usr|g' \
      -i contrib/systemd/*.service
  # do not statically link pinns and enable PIE
  patch -Np1 -i "../${pkgname}-1.19.0-pinns_pie.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  make
}

package() {
  depends+=('libgpgme.so' 'libseccomp.so')
  cd "${pkgname}-${pkgver}"
  # makefile is mixing DESTDIR and PREFIX
  make install install.systemd DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"
  install -vDm 644 {CONTRIBUTING,README,awesome,code-of-conduct,install,transfer,tutorial}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 tutorials/*.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/tutorials/"
  install -vDm 644 contrib/cni/*.{conf,md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/cni/"
  install -vDm 644 contrib/metrics-exporter/{Containerfile,*.{yaml,gif,json,go}} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/metrics-exporter/"
}
