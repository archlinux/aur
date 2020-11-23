# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=cri-o
pkgver=1.19.0
pkgrel=5
pkgdesc="Open Container Initiative-based implementation of Kubernetes Container Runtime Interface"
arch=('x86_64')
url="https://github.com/cri-o/cri-o"
license=('Apache')
depends=('cni-plugins' 'conmon' 'conntrack-tools' 'device-mapper' 'glibc'
'iproute2' 'iptables' 'runc')
makedepends=('apparmor' 'btrfs-progs' 'gpgme' 'go' 'go-md2man' 'libassuan' 'libseccomp' 'ostree')
optdepends=('apparmor: for apparmor integration'
            'btrfs-progs: for btrfs support')
provides=('container-runtime')
backup=('etc/crio/crio.conf')
# configuration override and hook directories should exist
options=('emptydirs')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "modules-${pkgname}.conf"
        "sysctl-${pkgname}.conf"
        "${pkgname}-1.19.0-pinns_pie.patch")
sha512sums=('15b506d755be735d7b71e503b02b309693e3090be41f5790bd34cec460238eab56829239caf18849f3656cf8c12f77a10bbb3ae4ad81eb4e18858946e454583d'
            '85ee1310cb36c85c42b4068a9549a3ef72b856cd61b2c1036c3e871ef43a69ed80b43599ad94ce5b069ddd823e730596bb3d3875d4ba8cd77c4cc1985335ffff'
            'fbcc3c29d5d3dedf56ea96577dec50cb2656b4a22f5a82bf2d600ae20c6b113d35d5db116bac5520398d47a22d40835f56b86433c5713924060e1a7018d297ec'
            '1eb382a0a5c273a6ed1df9666ff2b7a83cdb513818f85ca9984da254aecf518580c1b13410715eb73fd1bc7d687a4fd6ef5ae30eb11a1046e422157f117aeb1a')
b2sums=('8288985392a08fb7fdc58f509d34f8814bf9670386b7aae42be349765cb1f3bd3f4b77077e9c282a4a25b0f99b8a8fc335c6a53053bd2575b3e23c225483a1d3'
        '2771c64b45876d728fc139aa90754df8aadb07e14a7e1126a1488dfcbad7ebcbca923cb0230c4b87acdc6dad8243af2ad06ef4ce587d5c71fc200e40835d8b8d'
        'c8a2133df6575c54eb9bd0a89a0c6c764c0cd456bff7338c4a2e1ef4f70a5a778d5a05c335fcf2491ed55e15fc36c677853c0bc8ab66d673f1950fa2c7695f6e'
        '8d77c8060f483c943bd48d9bc2c1d676878e570b29989b7ff733906612b6dff09ed1ffcabc5174175ebc667df897e37e98a8132016bddcb27137661fca2da6dd')

prepare() {
  cd "${pkgname}-${pkgver}"
  # make sure that /run instead of /var/run is used
  sed -e 's|/var/run|/run|g' \
      -i crictl.yaml pkg/config/config{,_unix}.go \
      docs/*.md crio-umount.conf \
      vendor/github.com/containers/conmon/runner/config/config_unix.go \
      vendor/github.com/containers/storage/{storage.conf,store.go}
  # make sure that /usr/bin is used in systemd units
  sed -e 's|/usr/local|/usr|g' \
      -i contrib/systemd/*.service
  # set the correct default PATH for cni-plugins
  sed -e 's|/opt/cni/bin/|/usr/lib/cni/|g' \
      -i pkg/config/config_unix.go
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
  depends+=('libdevmapper.so' 'libgpgme.so' 'libseccomp.so')
  cd "${pkgname}-${pkgver}"
  # makefile is mixing DESTDIR and PREFIX
  make install install.systemd DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"
  # modules
  install -vDm 644 "../modules-${pkgname}.conf" "${pkgdir}/usr/lib/modules-load.d/cri-o.conf"
  # sysctl
  install -vDm 644 "../sysctl-${pkgname}.conf" "${pkgdir}/usr/lib/sysctl.d/90-cri-o.conf"
  # docs
  install -vDm 644 {CONTRIBUTING,README,awesome,code-of-conduct,install,transfer,tutorial}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 tutorials/*.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/tutorials/"
  install -vDm 644 contrib/cni/*.{conf,md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/cni/"
  install -vDm 644 contrib/metrics-exporter/{Containerfile,*.{yaml,gif,json,go}} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/metrics-exporter/"
}
