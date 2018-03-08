# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=subgraph-oz
pkgver=0.2.6
pkgrel=2
pkgdesc="Subgraph sandboxing system targeting everyday workstation applications"
arch=('any')
url="https://github.com/subgraph/fw-daemon"
license=('MIT')
source=("subgraph-oz-${pkgver}.tar.gz::https://github.com/subgraph/oz/archive/${pkgver}.tar.gz"
	"https://github.com/subgraph/oz/raw/debian/debian/oz-daemon.service"
	"subgraph-oz-profiles-0.2.5.tar.gz::https://github.com/subgraph/subgraph-oz-profiles/archive/0.2.5.tar.gz")
sha512sums=("d71a463d0e45a7386e97b821d48f97adef02c0dc96dba2d20aea98b765ec3443cec4f60aff7a9dc98f96b1d3e541fc705ee3b3bb07af9e873900b84cbd78c586"
	    "a8cd846894331ca5e5fff993e4739e11e95951642c17e910c3060ca3477acaf17aa614c7648c9dfb85ae5c968fa74c5f35aba767a4812f38dc787a006b87b789"
	    "0077bfa7f46ce6eb11a45213f07ee7a110be3d96daaee1ea09e0c9e69649a1da5a3d7b4f729026d076336e8f5ddc273ffb0e48258d11539a6b513e1c0ebcd812")

prepare() {
  cd "${srcdir}"
  mkdir -p "gopath/src/github.com/subgraph"
  ln -fs "${srcdir}/oz-${pkgver}" "${srcdir}/gopath/src/github.com/subgraph/oz"
}

build() {
  cd "${srcdir}/gopath/src/github.com/subgraph/oz"
  export GOPATH="${srcdir}/gopath"
  go get ./...
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/var/lib/oz/cells.d"
  install -d "${pkgdir}/etc"
  cp "${srcdir}/gopath/bin/"oz* "${pkgdir}/usr/bin/"
  cp -r "${srcdir}/gopath/src/github.com/subgraph/oz/sources/etc/oz" "${pkgdir}/etc/"
  cp "${srcdir}/subgraph-oz-profiles-0.2.5/"* "${pkgdir}/var/lib/oz/cells.d/"

  install -Dm644 "${srcdir}/oz-daemon.service" "${pkgdir}/usr/lib/systemd/system/oz-daemon.service"
  install -D "${srcdir}/gopath/src/github.com/subgraph/oz/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
