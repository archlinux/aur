# Maintainer: Krister Bäckman <ixevix@gmail.com>

pkgname=virtwold
pkgver=23.12.0
pkgrel=2
pkgdesc='Wake-on-LAN for libvirt based VMs'
depends=('glibc' 'libvirt')
makedepends=('git' 'go' 'libvirt')
source=("https://github.com/ScottESanDiego/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a3ecd37a53a3c1628a93f45876053aa3f3dddfd71e9c7688377410e4a16e934a')
arch=('x86_64')
url='https://github.com/ScottESanDiego/virtwold'

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.goos=$(go env GOOS) -X main.goarch=$(go env GOARCH) -X main.version=${pkgver} -X main.branch=tag-${pkgver} -X main.commit=tag-${pkgver} -extldflags -s"
  go build -ldflags="${_LDFLAGS}"

}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"

  sed -i -e 's/\/usr\/local\/bin/\/usr\/bin/g' "${srcdir}/${pkgname}-${pkgver}/init-scripts/systemd/${pkgname}@.service"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/init-scripts/systemd/${pkgname}@.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}
