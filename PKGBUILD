# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filebrowser
pkgver=2.17.2
pkgrel=1
pkgdesc="Standalone web file manager"
arch=(x86_64)
url="https://filebrowser.org/"
license=(Apache)
depends=(glibc)
makedepends=(go npm go.rice)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/filebrowser/filebrowser/archive/v${pkgver}.tar.gz"
        "filebrowser@.service")
sha512sums=('29c4fc86a86963a171a58a7706f06cb02216a93ca707e73da74ec805692c8779bd3a2b4c064c01f16a9b12457985d84da00d0041173a413c47feda85b60ff920'
            '0846815afbb3c5ccbb097a5361461ca0ada69e04246935afb123f4609d09cd61f9e3fe50e3b6698b3e4c1f335cbb0aa3d998cae13b422e2989aad62ed7ce4682')
options=(emptydirs)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/frontend"

  npm install
  npm update
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
