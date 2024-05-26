# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Asterios Dimitriou <asterios@pci.gr>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>
# Contributer: nightuser <nightuser.android at gmail.com>

pkgbase=incus-git
base=incus
pkgname=(incus-git incus-tools-git)
provides=(incus incus-tools)
conflicts=(incus incus-tools)
pkgver=v6.1.0.r148.3f91a7cc7
pkgrel=1
pkgdesc="Powerful system container and virtual machine manager, git version"
arch=('x86_64')
url="https://linuxcontainers.org/incus/"
license=('Apache-2.0')
depends=('lxc' 'lxcfs' 'squashfs-tools' 'dnsmasq' 'cowsql' 'libuv' 'ebtables' 'raft' 'sqlite' 'libcap' 'acl'

          # VM Support
          'qemu-base' 'qemu-chardev-spice' 'qemu-hw-usb-redirect'
          'qemu-hw-display-virtio-vga' 'qemu-hw-display-virtio-gpu'
)
makedepends=('go' 'git' 'tcl' 'apparmor' 'libseccomp' 'systemd')
optdepends=(
    'lvm2: lvm2 support'
    'thin-provisioning-tools: thin provisioning support'
    'btrfs-progs: btrfs storage driver support'
    'minio: storage buckets support'
    'cdrtools: VM support'
    'systemd-libs: unix device hotplug support'
    'apparmor: apparmor support'
    'xdelta3: support delta downloads of images'
)
source=("git+https://github.com/lxc/incus.git"
        "incus.socket"
        "incus.service"
        "incus-user.socket"
        "incus-user.service"
        "incus.sysusers")
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67'  # Stéphane Graber <stgraber@stgraber.org>
             )
sha256sums=('SKIP'
            '602a8035cc51b8e0c4ca265e31ebf96c7977db4239d384d8f60fed0d2d0317c4'
            '646b0a9b38954890bc8706b41dfb93c7fdc83cbee1a3632c7258d77a1fddd725'
            '50288528ea910d186157a2515c5200b3b073f645922fb581d1913f236f14667d'
            '1c934cac1aa61be2ede5830ea76dbb9ba199498f6eb920ce1016bbb54dd088bf'
            '90beead5dbde947936a58df8773519c49d92a2028881ae0ec81ee5402510e39a')


pkgver() {
	cd "$srcdir/${base}"
	printf "%s" "$(git describe --long --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


prepare() {
  cd "$base"

  mkdir bin
  go mod verify
}

build() {
  cd "$base"

  export GOFLAGS="-buildmode=pie -modcacherw"
  export CGO_LDFLAGS_ALLOW="-Wl,-z,now"
  GO_LDFLAGS="-compressdwarf=false -linkmode external"

  CGO_LDFLAGS="-static" go build -v -tags "agent" -o bin/ ./cmd/incus-agent/...

  go build -v -ldflags "${GO_LDFLAGS}" -tags "netgo" -o bin/ ./cmd/incus-migrate/...
  for tool in fuidshift incus lxc-to-incus lxd-to-incus incusd incus-benchmark incus-user; do
    go build -v -ldflags "${GO_LDFLAGS}" -tags "libsqlite3" -o bin/ ./cmd/$tool
  done

  # Generate manpages - not worth it
  # mkdir manpages
  # ./bin/incus manpage --all ./manpages
  # ./bin/incusd manpage --all ./manpages
}

package_incus-git() {
  cd "$base"

  for tool in incus incusd incus-agent incus-user lxd-to-incus; do
    install -v -p -Dm755 "bin/$tool" "${pkgdir}/usr/bin/$tool"
  done

  # Package license
  install -v -Dm644 "COPYING"  "${pkgdir}/usr/share/licenses/incus/LICENCE"

  # systemd files
  install -v -Dm644 "${srcdir}/"incus.{service,socket} -t "${pkgdir}/usr/lib/systemd/system"
  install -v -Dm644 "${srcdir}/"incus-user.{service,socket} -t "${pkgdir}/usr/lib/systemd/system"
  install -v -Dm644 "${srcdir}/incus.sysusers" "${pkgdir}/usr/lib/sysusers.d/incus.conf"

  # logs
  install -v -dm700 "${pkgdir}/var/log/incus"

  # documentation
  install -d "${pkgdir}/usr/share/doc/incus/"
  rm -rf doc/html
  cp -vr doc/* "${pkgdir}/usr/share/doc/incus/"

  # Bash completions
	./bin/incus completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/incus"
	./bin/incus completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_incus"
	./bin/incus completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/incus.fish"
}

package_incus-tools-git() {
  conflicts=('lxd')
  cd "$base"
  for tool in fuidshift lxc-to-incus incus-benchmark; do
    install -v -p -Dm755 "bin/$tool" "${pkgdir}/usr/bin/$tool"
  done
  # Package license
  install -v -Dm644 "COPYING"  "${pkgdir}/usr/share/licenses/incus-tools/LICENCE"
}

# vim:set ts=2 sw=2 et:
