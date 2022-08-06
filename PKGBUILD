# Maintainer: Asterios Dimitriou <asterios@pci.gr>
# based on lxd package https://aur.archlinux.org/packages/lxd/
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>

pkgname=lxd-git
_pkgname=lxd
pkgver=5.4.r293.ce5d10282
pkgrel=2
pkgdesc="Daemon based on liblxc offering a REST API to manage containers"
arch=('x86_64')
url="https://linuxcontainers.org/lxd"
license=('APACHE')
conflicts=('lxd' 'lxd-lts')
provides=('lxd')
depends=('lxc' 'lxcfs' 'squashfs-tools' 'dnsmasq' 'libuv' 'sqlite')
makedepends=('go' 'git' 'patchelf')
optdepends=('lvm2: for lvm2 support'
            'thin-provisioning-tools: for thin provisioning support'
            'btrfs-progs: for btrfs storage driver support'
            'ceph: for ceph storage driver support'
            'jq: needed by empty-lxd.sh script'
            'qemu-base: needed for virtual machine support'
            'edk2-ovmf: needed for virtual machine support'
            'cdrtools: needed for virtual machine support'
)
options=('!strip' '!emptydirs')
source=("git+https://github.com/lxc/lxd.git"
        "lxd.service"
        "lxd.socket"
        "lxd.sysusers"
)
md5sums=('SKIP'
         '8cb3f1d6188b5b49459d36524587bfc1'
         '41a58bbbb018f26937ab5167ee3d2d43'
         '518ccee2025394ce1094d716668bc83f')

_lxd=github.com/lxc/lxd

prepare() {
  mkdir -p "${srcdir}/go/src/github.com/lxc"
  ln -rTsf "${_pkgname}" "${srcdir}/go/src/${_lxd}"
}

pkgver() {
  cd "${srcdir}/go/src/${_lxd}"
  printf "%s" "$(git describe --long | sed 's/^lxd-//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() { 
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/${_lxd}"
  make deps
  export CGO_CFLAGS="-I${GOPATH}/deps/raft/include/ -I${GOPATH}/deps/dqlite/include/"
  export CGO_LDFLAGS="-L${GOPATH}/deps/raft/.libs -L${GOPATH}/deps/dqlite/.libs/"
  export LD_LIBRARY_PATH="${GOPATH}/deps/raft/.libs/:${GOPATH}/deps/dqlite/.libs/"
  export CGO_LDFLAGS_ALLOW="(-Wl,-wrap,pthread_create)|(-Wl,-z,now)"
  make
}

package() {
  go_bin_dir="${srcdir}/go/bin"
  go_deps_dir="${srcdir}/go/deps"
  install=lxd.install
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/lxd"
  install -p -m755 "${go_bin_dir}/"* "${pkgdir}/usr/bin"
  patchelf --set-rpath "/usr/lib/lxd" "${pkgdir}/usr/bin/lxd"
  cp --no-dereference --preserve=timestamps \
    "${go_deps_dir}/raft/.libs/"libraft.so* \
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
  mkdir -p "${pkgdir}/usr/share/doc/lxd"
  rm -rf "${srcdir}/go/src/${_lxd}/doc/html"
  cp -vr "${srcdir}/go/src/${_lxd}/doc/"* \
    "${pkgdir}/usr/share/doc/lxd/"

  # helper scripts
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  install -p -m644 "${srcdir}/go/src/${_lxd}/scripts/bash/lxd-client" \
    "${pkgdir}/usr/share/bash-completion/completions/lxd"
  install -p -m755 "${srcdir}/go/src/${_lxd}/scripts/empty-lxd.sh" "${pkgdir}/usr/lib/lxd"
}

# vim:set ts=2 sw=2 et:
