# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filebrowser
pkgver=2.46.1
pkgrel=1
pkgdesc="Standalone web file manager"
arch=(x86_64)
url="https://filebrowser.org/"
license=(Apache-2.0)
depends=(glibc)
makedepends=(git go nodejs npm pnpm go.rice)
source=("git+https://github.com/filebrowser/filebrowser.git#tag=v${pkgver}"
        "filebrowser@.service")
sha512sums=('e89c1d9723a8e25c0ceb20747de2ed015ebb58f0c425ce388513c47f191e5f2452c8bbc08725db309418cd8236d82ce21610410cca4850e11b6f0e45eef43f82'
            '0846815afbb3c5ccbb097a5361461ca0ada69e04246935afb123f4609d09cd61f9e3fe50e3b6698b3e4c1f335cbb0aa3d998cae13b422e2989aad62ed7ce4682')
options=(emptydirs !lto)

build() {
  cd "filebrowser/frontend"
  npm install
  echo "DONE NPM INSTALL"

  #npm update --legacy-peer-deps
  npm update --force
  echo "DONE NPM UPDATE"

  npm run build
  echo "DONE NPM RUN BUILD"

  cd "${srcdir}/filebrowser/http"
  rice embed-go
  echo "DONE rice embed-go"

  cd "${srcdir}/filebrowser"
  export GOPATH="$SRCDEST/go-modules"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  install -Dm644 filebrowser@.service "${pkgdir}"/usr/lib/systemd/system/filebrowser@.service
  install -Dm755 "${srcdir}/${pkgname}/filebrowser" "${pkgdir}"/usr/bin/filebrowser
  install -d "${pkgdir}"/usr/share/filebrowser
  install -d "${pkgdir}"/etc/filebrowser/
#  cd "${pkgdir}"/usr/share/filebrowser
#  "${srcdir}"/filebrowser/filebrowser config init
#  "${srcdir}"/filebrowser/filebrowser config export ${pkgdir}/etc/filebrowser/config.json
}
