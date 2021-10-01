# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Asterios Dimitriou <asterios@pci.gr>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>
# Contributer: nightuser <nightuser.android at gmail.com>

pkgname=lxd
pkgver=4.19
pkgrel=1
pkgdesc="Daemon based on liblxc offering a REST API to manage containers"
arch=('x86_64')
url="https://linuxcontainers.org/lxd"
license=('APACHE')
depends=('lxc' 'lxcfs' 'squashfs-tools' 'dnsmasq' 'dqlite' 'libuv' 'ebtables')
makedepends=('go' 'git' 'tcl' 'apparmor' 'libseccomp' 'systemd')
optdepends=(
    'lvm2: for lvm2 support'
    'thin-provisioning-tools: for thin provisioning support'
    'btrfs-progs: for btrfs storage driver support'
    'ceph: for ceph storage driver support'
    'cdrtools: VM support'
    'qemu: VM support'
    'ovmf: VM support'
    'systemd-libs: unix device hotplug support'
    'apparmor: apparmor support'
)
source=("https://linuxcontainers.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "lxd.socket"
        "lxd.service"
        "lxd.sysusers")
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67')
sha256sums=('6e4cf6cb1549e1b56802d64ad24d812914e0c0102bfcf146bb18a8dcd1fbab57'
            'SKIP'
            '3a14638f8d0f9082c7214502421350e3b028db1e7f22e8c3fd35a2b1d9153ef4'
            '102d1d54186e0fc606a58f030231d76df6bd662b16dfd8f946e1f48e2b473b54'
            'd0184d9c4bb485e3aad0d4ac25ea7e85ac0f7ed6ddc96333e74fcd393a5b5ec4')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir bin

  # verify modules
  go mod verify
}

build() {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-buildmode=pie -trimpath"
  export CGO_LDFLAGS_ALLOW="-Wl,-z,now"

	go build -v -tags "netgo" -o bin/ ./lxd-p2c/...
	CGO_LDFLAGS="$CGO_LDFLAGS -static" go build -v -tags "agent" -o bin/ ./lxd-agent/...
  for tool in fuidshift lxc lxc-to-lxd lxd lxd-benchmark; do
    go build -v -tags "libsqlite3" -o bin/ ./$tool/...
  done
}

package() {
  cd "$pkgname-$pkgver"

  for tool in fuidshift lxc lxc-to-lxd lxd lxd-agent lxd-benchmark lxd-p2c; do
    install -p -Dm755 "bin/$tool" "${pkgdir}/usr/bin/$tool"
  done

  # Package license
  install -Dm644 "COPYING"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  # systemd files
  install -Dm644 "${srcdir}/"lxd.{service,socket} -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/$pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

  # logs
  install -dm700 "${pkgdir}/var/log/lxd"

  # documentation
  install -d "${pkgdir}/usr/share/doc/lxd"
  install -p -Dm644 "doc/"* "${pkgdir}/usr/share/doc/lxd/"

  # Bash completions
  install -p -Dm644 "scripts/bash/lxd-client" "${pkgdir}/usr/share/bash-completion/completions/lxd"
}

# vim:set ts=2 sw=2 et:
