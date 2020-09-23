# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.39.5
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/v${pkgver}.tar.gz")
sha512sums=('75d28e741be05a167d1dcc446e67554e3c25066f56cdf20cf027e0aa3e29af5fca998bf0815f4ccc4323f5f582b91dc94fd977cfd507cce41ccff7546df8d0cd')
b2sums=('851c34de58fa59fe07d15b09598251ff7072cadf4f35eaf3fc50fdd5d7a8d3da59dcdf7d3e8dcd8fa2a934ccd71592207ce03c9be0c033561114eeebec7f2f76')

prepare() {
  mv -v "${_upstream_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 755 "${_upstream_name}" -t "${pkgdir}/usr/bin/"
  install -vDm 644 {README,RELEASE}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
