# Maintainer: Asterios Dimitriou <asterios@pci.gr>
# based on lxd package https://aur.archlinux.org/packages/lxd/
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>

pkgname=lxd-git
_pkgname=lxd
pkgver=3.4.r0.520cea20
pkgrel=1
pkgdesc="Daemon based on liblxc offering a REST API to manage containers"
arch=('x86_64')
url="https://github.com/lxc/lxd"
license=('APACHE')
conflicts=('lxd' 'lxd-lts')
provides=('lxd')
depends=('lxc' 'squashfs-tools' 'dnsmasq' 'libuv')
makedepends=('go-pie' 'git' 'tcl' 'patchelf')
optdepends=(
    'lvm2: for lvm2 support'
    'thin-provisioning-tools: for thin provisioning support'
    'btrfs-progs: for btrfs storage driver support'
    'ceph: for ceph storage driver support'
)
options=('!strip' '!emptydirs')
source=(
    "lxd.service"
    "lxd.socket"
)
_lxd=github.com/lxc/lxd

md5sums=('ad8ad313898fac0487fcf9a3b9b926ea'
         '1fb28d8dfe82af71d0675c8e9a0a7293')

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p "${GOPATH}"
  # download the go package along with all of its go dependencies
  go get -d -v "${_lxd}/lxd"
}

pkgver() {
  cd "${GOPATH}/src/${_lxd}"
  printf "%s" "$(git describe --long | sed 's/^lxd-//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() { 
  cd "${GOPATH}/src/${_lxd}"
  make deps
  export CGO_CFLAGS="-I${GOPATH}/deps/sqlite/ -I${GOPATH}/deps/dqlite/include/"
  export CGO_LDFLAGS="-L${GOPATH}/deps/sqlite/.libs/ -L${GOPATH}/deps/dqlite/.libs/"
  export LD_LIBRARY_PATH="${GOPATH}/deps/sqlite/.libs/:${GOPATH}/deps/dqlite/.libs/"
  make
}

package() {
  go_bin_dir="${srcdir}/go/bin"
  go_deps_dir="${srcdir}/go/deps"
  install=lxd.install
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/lxd"
  mkdir -p "${pkgdir}/usr/share/doc/lxd"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  install -p -m755 "${go_bin_dir}/"* "${pkgdir}/usr/bin"
  patchelf --set-rpath "/usr/lib/lxd" "${pkgdir}/usr/bin/lxd"
  cp --no-dereference --preserve=timestamps \
    "${go_deps_dir}/sqlite/.libs/"libsqlite3.so* \
    "${go_deps_dir}/dqlite/.libs/"libdqlite.so* \
    "${pkgdir}/usr/lib/lxd"
  patchelf --set-rpath "/usr/lib/lxd" "${pkgdir}/usr/lib/lxd/libdqlite.so"

  # Package license
  install -Dm644 "${srcdir}/go/src/${_lxd}/COPYING"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE"

  # systemd files
  install -D -m644 "${srcdir}/lxd.service" \
    "${pkgdir}/usr/lib/systemd/system/lxd.service"
  install -D -m644 "${srcdir}/lxd.socket" \
    "${pkgdir}/usr/lib/systemd/system/lxd.socket"

  # documentation
  install -D -m644 "${srcdir}/go/src/${_lxd}/doc/"* \
    "${pkgdir}/usr/share/doc/lxd/"

  # Bash completions
  install -p -m644 "${srcdir}/go/src/${_lxd}/scripts/bash/lxd-client" \
    "${pkgdir}/usr/share/bash-completion/completions/lxd-client"
}

# vim:set ts=2 sw=2 et:
