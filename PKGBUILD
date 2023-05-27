# Maintainer: Atom Long <atom0815@gmail.com>

pkgname=('siyuan-kernel')
_pkgname=siyuan
pkgver=2.8.9
pkgrel=1
pkgdesc="Build Your Eternal Digital Garden."
arch=('x86_64' 'aarch64')
url="https://github.com/siyuan-note/siyuan"
license=('GPL3')
makedepends=('go' 'pnpm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/${_pkgname}/archive/v${pkgver}.tar.gz"
        'siyuan-kernel.service')
sha256sums=('674aba1b310e0a9f61fdb25d6efae3e6d9cfecb0f3233f22083644d88b88e7b5'
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
  kernel_path="../app/kernel-linux/siyuan-kernel"
  build_args="-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
  pushd "kernel"
    go build --tags fts5 -o "${kernel_path}" -v -ldflags "${build_args}"
  popd
  
  msg2 "Building Electron"
  electron_args="dist-linux"
  pushd app
  pnpm run ${electron_args}
  popd
}

package_siyuan-kernel() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  install -Ddm0755 "${pkgdir}"/usr/{bin,share/webapps}
  cp -arf app/build/linux*unpacked/resources ${pkgdir}/usr/share/webapps/siyuan-kernel
  ln -vsf /usr/share/webapps/siyuan-kernel/kernel/siyuan-kernel "${pkgdir}"/usr/bin/siyuan-kernel
  
  install -Dm644 ${srcdir}/siyuan-kernel.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim:set ts=2 sw=2 ft=sh et:
