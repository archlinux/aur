# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Asterios Dimitriou <asterios@pci.gr>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>
# Contributer: nightuser <nightuser.android at gmail.com>

pkgname=lxd
pkgver=5.7
pkgrel=1
pkgdesc="Daemon based on liblxc offering a REST API to manage containers"
arch=('x86_64')
url="https://linuxcontainers.org/lxd"
license=('APACHE')
depends=('lxc' 'lxcfs' 'squashfs-tools' 'dnsmasq' 'dqlite' 'libuv' 'ebtables')
makedepends=('go' 'git' 'tcl' 'apparmor' 'libseccomp' 'systemd')
optdepends=(
    'lvm2: lvm2 support'
    'thin-provisioning-tools: thin provisioning support'
    'btrfs-progs: btrfs storage driver support'
    'minio: storage buckets support'
    'cdrtools: VM support'
    'qemu: VM support'
    'edk2-ovmf: VM support'
    'systemd-libs: unix device hotplug support'
    'apparmor: apparmor support'
)
source=("https://linuxcontainers.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "lxd.socket"
        "lxd.service"
        "lxd.sysusers")
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67')
sha256sums=('4d9785fd53eb3f8a910157b3270416b5fca9b31049a674eb493d2e0ddc375952'
            'SKIP'
            'b89a725223ef72b25eab25184084d069af312f8c23612c57fdb75427a510232e'
            '102d1d54186e0fc606a58f030231d76df6bd662b16dfd8f946e1f48e2b473b54'
            'd0184d9c4bb485e3aad0d4ac25ea7e85ac0f7ed6ddc96333e74fcd393a5b5ec4')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir bin
  go mod verify
}

build() {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-buildmode=pie -trimpath"
  export CGO_LDFLAGS_ALLOW="-Wl,-z,now"

  go build -v -tags "netgo" -o bin/ ./lxd-migrate/...
  CGO_LDFLAGS="$CGO_LDFLAGS -static" go build -v -tags "agent" -o bin/ ./lxd-agent/...
  for tool in fuidshift lxc lxc-to-lxd lxd lxd-benchmark lxd-user; do
    go build -v -tags "libsqlite3" -o bin/ ./$tool/...
  done
}

package() {
  cd "$pkgname-$pkgver"

  for tool in fuidshift lxc lxc-to-lxd lxd lxd-agent lxd-benchmark lxd-migrate lxd-user; do
    install -v -p -Dm755 "bin/$tool" "${pkgdir}/usr/bin/$tool"
  done

  # Package license
  install -v -Dm644 "COPYING"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  # systemd files
  install -v -Dm644 "${srcdir}/"lxd.{service,socket} -t "${pkgdir}/usr/lib/systemd/system"
  install -v -Dm644 "${srcdir}/$pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

  # logs
  install -v -dm700 "${pkgdir}/var/log/lxd"

  # documentation
  install -d "${pkgdir}/usr/share/doc/lxd/"
  rm -rf doc/html
  cp -vr doc/* "${pkgdir}/usr/share/doc/lxd/"

  # Bash completions
  install -v -p -Dm644 "scripts/bash/lxd-client" "${pkgdir}/usr/share/bash-completion/completions/lxd"
}

# vim:set ts=2 sw=2 et:
