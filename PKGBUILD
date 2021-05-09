# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filebrowser
pkgver=2.15.0
pkgrel=1
pkgdesc="Standalone web file manager"
arch=(x86_64)
url="https://filebrowser.org/"
license=(Apache)
depends=(glibc)
makedepends=(go npm go.rice)
provides=(filebrowser)
conflicts=(filebrowser)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/filebrowser/filebrowser/archive/v${pkgver}.tar.gz"
        "filebrowser@.service")
sha512sums=('e6401512f1e492568e2dc7e5e5447fa262b4df15c908fd0693fd06826fddc37d94a0899d8241e9d88498e65b9107fbe1bc1b7a6d8fe2c0fb23b5e3a5edd1b57f'
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
