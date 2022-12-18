# Maintainer: Atom Long <atom0815@gmail.com>

pkgname=('siyuan-kernel')
_pkgname=siyuan
pkgver=2.5.4
pkgrel=1
pkgdesc="Build Your Eternal Digital Garden."
arch=('x86_64' 'aarch64')
url="https://github.com/siyuan-note/siyuan"
license=('GPL3')
makedepends=('go' 'pnpm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'siyuan-kernel.service')
sha256sums=('5bc11a06d8686e3de9cebb6832d44ec298cb0379018a1df6866a3161f80fafcc'
		    '3a264b1e664521d43daf33bf7966edd3beaf0e26a700c3a8b39a42800f990a53')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  msg2 "Install Node Dependencies"
  pushd app
  pnpm install
  popd
  
  msg2 "Building UI"
  pushd app
  pnpm run build
  popd
  
  msg2 'Building Kernel'
  export CGO_ENABLED=1
  export GO111MODULE=on
  export GOPROXY=https://goproxy.io
  export GOOS=linux
  export GOPATH="$srcdir"/go
  export GOOS=linux
case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  aarch64) export GOARCH=arm64 ;;
esac
  kernel_path="../app/kernel-linux/siyuan-kernel"
  build_args="-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
  pushd "kernel"
    go build --tags fts5 -o "${kernel_path}" -v -ldflags "${build_args}"
  popd
  
  msg2 "Building Electron"
case "$CARCH" in
  x86_64) electron_args="dist-linux" ;;
  aarch64) electron_args="dist-darwin-arm64" ;;
esac
  pushd app
  pnpm run ${electron_args}
  popd
}

package_siyuan-kernel() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  install -dm0755 app/build/linux-unpacked/resources ${pkgdir}/usr/share/webapps/siyuan-kernel
  ln -vsf /usr/share/webapps/siyuan-kernel/kernel/siyuan-kernel "${pkgdir}"/usr/bin/siyuan-kernel
  
  install -Dm644 ${srcdir}/siyuan-kernel.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim:set ts=2 sw=2 ft=sh et:
