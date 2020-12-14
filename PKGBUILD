# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Dct Mei <dctxmei@gmail.com>

pkgname=filebrowser-git
pkgver=2.10.0.r0.gc746c193
pkgrel=1
pkgdesc="Standalone web file manager"
arch=(x86_64)
url="https://filebrowser.xyz/"
license=(Apache)
depends=(glibc)
makedepends=(git go npm go.rice)
provides=(filebrowser)
conflicts=(filebrowser)
source=("git+https://github.com/filebrowser/filebrowser.git"
        "filebrowser@.service")
sha512sums=('SKIP'
            '0846815afbb3c5ccbb097a5361461ca0ada69e04246935afb123f4609d09cd61f9e3fe50e3b6698b3e4c1f335cbb0aa3d998cae13b422e2989aad62ed7ce4682')
options=(emptydirs)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}/frontend"

  npm install
  npm update
  npm audit fix
  npm run build

  cd "${srcdir}/${pkgname%-git}/http"
  rice embed-go

  cd "${srcdir}/${pkgname%-git}"
  export GOPATH="$SRCDEST/go-modules"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -buildmode=pie
}

package() {
  install -Dm644 filebrowser@.service "${pkgdir}"/usr/lib/systemd/system/filebrowser@.service
  install -Dm755 "${srcdir}"/filebrowser/filebrowser "${pkgdir}"/usr/bin/filebrowser
  install -d "${pkgdir}"/usr/share/filebrowser
  install -d "${pkgdir}"/etc/filebrowser/
#  cd "${pkgdir}"/usr/share/filebrowser
#  "${srcdir}"/filebrowser/filebrowser config init
#  "${srcdir}"/filebrowser/filebrowser config export ${pkgdir}/etc/filebrowser/config.json
}
