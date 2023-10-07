# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Asterios Dimitriou <asterios@pci.gr>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>
# Contributer: nightuser <nightuser.android at gmail.com>

pkgname=incus
pkgver=0.1
pkgrel=2
pkgdesc="Daemon based on liblxc offering a REST API to manage containers"
arch=('x86_64')
url="https://linuxcontainers.org/incus"
license=('APACHE')
depends=('lxc' 'lxcfs' 'squashfs-tools' 'dnsmasq' 'cowsql' 'libuv' 'ebtables' 'raft' 'sqlite' 'libcap' 'acl')
makedepends=('go' 'git' 'tcl' 'apparmor' 'libseccomp' 'systemd')
conflicts=("lxd")
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
options=('!debug')
source=("https://github.com/lxc/incus/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "incus.socket"
        "incus.service"
        "incus.sysusers")
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67'  # Stéphane Graber <stgraber@stgraber.org>
              'ED1CA1E7A6F80E22E5CB2DA84ACE106615754614') # Thomas Parrott <tomp@tomp.uk>
sha256sums=('771b6f438e369f729eaaa6dfd938f14dcc8de09dbc9da23c7c80c6d14f02653b'
            'SKIP'
            'b5a6aae662fd18d8f85b9106d204ae9fee61996bf2785d43578c5c955049957b'
            'b781fe13230e6a2be4b9d45cbd3c6a5acc553f193a17ab6d6987f62a888da39b'
            'd7c334814dca020437668111f69885bce98cb4e6be8eb5e23df1688ebc4031f2')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir bin
  go mod verify
}

build() {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-buildmode=pie -trimpath"
  export CGO_LDFLAGS_ALLOW="-Wl,-z,now"

  CGO_LDFLAGS="-static" go build -v -tags "agent" -o bin/ ./cmd/incus-agent/...

  go build -v -tags "netgo" -o bin/ ./cmd/incus-migrate/...
  for tool in fuidshift incus lxc-to-incus incusd incus-benchmark incus-user; do
    go build -v -tags "libsqlite3" -o bin/ ./cmd/$tool/...
  done
}

package() {
  cd "$pkgname-$pkgver"

  for tool in fuidshift incus lxc-to-incus incusd incus-agent incus-benchmark incus-migrate incus-user; do
    install -v -p -Dm755 "bin/$tool" "${pkgdir}/usr/bin/$tool"
  done

  # Package license
  install -v -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  # systemd files
  install -v -Dm644 "${srcdir}/"incus.{service,socket} -t "${pkgdir}/usr/lib/systemd/system"
  install -v -Dm644 "${srcdir}/incus.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

  # logs
  install -v -dm700 "${pkgdir}/var/log/incus"

  # documentation
  install -d "${pkgdir}/usr/share/doc/incus/"
  rm -rf doc/html
  cp -vr doc/* "${pkgdir}/usr/share/doc/incus/"

  # Bash completions
  install -v -p -Dm644 "scripts/bash/incus" "${pkgdir}/usr/share/bash-completion/completions/incus"
}

# vim:set ts=2 sw=2 et:
