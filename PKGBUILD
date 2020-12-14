# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filebrowser
pkgver=2.10.0
pkgrel=1
pkgdesc="Standalone web file manager"
arch=(x86_64)
url="https://filebrowser.xyz/"
license=(Apache)
depends=(glibc)
makedepends=(go npm go.rice)
provides=(filebrowser)
conflicts=(filebrowser)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/filebrowser/filebrowser/archive/v${pkgver}.tar.gz"
        "filebrowser@.service")
sha512sums=('f763e8a30f85cb48f5faae7d92ae3253086e91bc65a5fa7185f44637c34e1016c916dc7a8fbd3cab44d9ebd79d0110abf408f8baf5e57d10b85859a6a11c91b0'
            '0846815afbb3c5ccbb097a5361461ca0ada69e04246935afb123f4609d09cd61f9e3fe50e3b6698b3e4c1f335cbb0aa3d998cae13b422e2989aad62ed7ce4682')
options=(emptydirs)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/frontend"

  npm install
  npm update
  npm audit fix
  npm run build

  cd "${srcdir}/${pkgname}-${pkgver}/http"
  rice embed-go

  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="$SRCDEST/go-modules"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -buildmode=pie
}

package() {
  install -Dm644 filebrowser@.service "${pkgdir}"/usr/lib/systemd/system/filebrowser@.service
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/filebrowser" "${pkgdir}"/usr/bin/filebrowser
  install -d "${pkgdir}"/usr/share/filebrowser
  install -d "${pkgdir}"/etc/filebrowser/
#  cd "${pkgdir}"/usr/share/filebrowser
#  "${srcdir}"/filebrowser/filebrowser config init
#  "${srcdir}"/filebrowser/filebrowser config export ${pkgdir}/etc/filebrowser/config.json
}
