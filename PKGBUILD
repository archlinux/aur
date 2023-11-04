# Briefly hijacked by: zer0def <zer0def@zer0def.0>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Asterios Dimitriou <asterios@pci.gr>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>
# Contributer: nightuser <nightuser.android at gmail.com>

pkgname=incus
pkgver=0.2
pkgrel=1
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
source=("https://github.com/lxc/incus/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
        "incus.socket"
        "incus.service"
        "incus.sysusers")
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67'  # Stéphane Graber <stgraber@stgraber.org>
              'ED1CA1E7A6F80E22E5CB2DA84ACE106615754614') # Thomas Parrott <tomp@tomp.uk>
sha256sums=('aa53b22ad3bdce380c448f687b9c79872770d96308e3e797ca3fe6b11bbb0baf'
            'SKIP'
            'f0daecf62d1f3f990344416eba55e445fffa31d6679d13da9b2bfc57812abe10'
            'b3e45f028d81ae1d84939f641349257db0b2b5dcaecf7b8b95661be22d83c21b'
            '9ea457bbffd9111563e3054505d42484deb76cfbd8a9db94b533d4edd6b8cf32')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir bin
  go mod verify
}

build() {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-buildmode=pie -trimpath"
  export CGO_LDFLAGS_ALLOW="-Wl,-z,now"

  CGO_LDFLAGS="-static" go build -v -tags "agent,netgo" -o bin/ ./cmd/incus-agent/...

  pushd cmd/lxd-to-incus
  go build -v -o ../../bin ./...
  popd

  go build -v -tags "netgo" -o bin/ ./cmd/incus-migrate/...
  for tool in fuidshift incus lxc-to-incus incusd incus-benchmark incus-user; do
    go build -v -tags "libsqlite3" -o bin/ ./cmd/$tool/...
  done
}

package() {
  cd "$pkgname-$pkgver"

  for tool in fuidshift incus lxc-to-incus lxd-to-incus incusd incus-agent incus-benchmark incus-migrate incus-user; do
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
