# Maintainer: Krister Bäckman <ixevix@gmail.com>

pkgname=virtwold
pkgver=25.10.0
pkgrel=1
pkgdesc='Wake-on-LAN for libvirt based VMs'
depends=('glibc' 'libvirt')
makedepends=('git' 'go' 'libvirt')
source=("https://github.com/ScottESanDiego/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('874597279e0188bedfa73cdb1c8e86bc652b3bbd3dd2389970670a3854d486f1')
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
