# Maintainer: Kevin Hilton <>
pkgname=('xe-guest-utilities-git' 'xenstore-git')
pkgrel=1
pkgver=20190927.2f5d2e4
pkgdesc="Citrix XenServer Tools"
arch=('x86_64')
url="https://github.com/xenserver/xe-guest-utilities"
license=('BSD-2')
makedepends=('go-pie' 'git')
source=('git+https://github.com/xenserver/xe-guest-utilities.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase%-git}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "${srcdir}/${pkgbase%-git}"
  export GOPATH="${srcdir}/${pkgbase%-git}"
  go get golang.org/x/sys/unix
}

build() {
  cd "${srcdir}/${pkgbase%-git}"
  export GOPATH="${srcdir}/${pkgbase%-git}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath"
  make
}

package_xe-guest-utilities-git() {
  pkgdesc="Writes distribution version information and IP address to XenStore"
  depends=('lsb-release')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  cd "$srcdir/${pkgbase%-git}"
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m0755 build/obj/xe-daemon "${pkgdir}/usr/share/oem/xs/xe-daemon"
  install -D -m0755 mk/xe-linux-distribution "${pkgdir}/usr/share/oem/xs/xe-linux-distribution"
  install -D -m0644 mk/xen-vcpu-hotplug.rules "${pkgdir}/usr/lib/udev/rules.d/10-xen-vcpu-hotplug.rules"
  install -D -m0644 mk/xe-linux-distribution.service "${pkgdir}/usr/lib/systemd/system/xe-guest-utilities.service"

}

package_xenstore-git(){
  pkgdesc="Utilities for interacting with XenStore from within a Xen virtual machine"

  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/${pkgbase%-git}"
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m0755 build/obj/xenstore "${pkgdir}/usr/bin/xenstore"
  ln -s xenstore "${pkgdir}/usr/bin/xenstore-exists"
  ln -s xenstore "${pkgdir}/usr/bin/xenstore-read"
  ln -s xenstore "${pkgdir}/usr/bin/xenstore-rm"
  ln -s xenstore "${pkgdir}/usr/bin/xenstore-write"
}

