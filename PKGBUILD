# Maintainer: Krister Bäckman <ixevix@gmail.com>

pkgname=virtwold
pkgver=23.03.0
pkgrel=1
pkgdesc='Wake-on-LAN for libvirt based VMs'
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/ScottESanDiego/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2665ede2464aedaa14f46d36b0a90f5ff41c67ce667503ae2800dfd8df720ac4')
arch=('x86_64')

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.goos=$(go env GOOS) -X main.goarch=$(go env GOARCH) -X main.version=${pkgver} -X main.branch=tag-${pkgver} -X main.commit=tag-${pkgver} -extldflags ${LDFLAGS}"
  go build -ldflags="${_LDFLAGS}"

}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" \
    "${pkgdir}/usr/local/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/init-scripts/systemd/${pkgname}@.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}
