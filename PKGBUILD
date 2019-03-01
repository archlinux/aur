# $Id$
# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena
pkgver=17.12
_branchname="${pkgver}-resin"
pkgrel=1
epoch=1
pkgdesc='A Moby-based container engine for IoT'
arch=('x86_64' 'i686')
url='https://github.com/balena-os/balena-engine'
license=('Apache')
depends=('glibc' 'bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'libsystemd'
         'libseccomp' 'libtool')
makedepends=('git' 'go' 'btrfs-progs' 'cmake' 'systemd')
optdepends=('btrfs-progs: btrfs backend support'
            'lxc: lxc backend support')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip' '!buildflags')
# Use exact commit version from Dockerfile for runc and containerd until 1.0.0
# https://github.com/docker/containerd/issues/299#issuecomment-240745119
# see commit in hack/dockerfile/binaries-commits
# https://github.com/docker/docker-ce/blob/master/components/engine/hack/dockerfile/binaries-commits
source=("git+https://github.com/resin-os/balena.git#branch=${_branchname}"
        "balena.service"
        "balena.socket"
        "balena.sysusers"
        "80-balena.rules")
sha256sums=('SKIP'
            '34297f867f86df0f367539ab361839c41d4a56e28ac04608cd5f4fc79320d119'
            '2e844d773dc497cb040f14c1624ffa609294ad8ed8c895e6ba55b29c6e8f4f15'
            '56b51c714f8a2d8ed3a0d6efec89b4783210dc1fca314ee193d33cc198c9b365'
            '4b8339112920745fe94611dacadd41865fef35349d57f12b347287b54862dab9')

build() {
    cd "${srcdir}/balena/"
    echo $(git describe --tags --always) > VERSION
    ./build.sh
}

package() {
    install -Dm755 "${srcdir}/balena/bundles/latest/binary-balena/balena" "${pkgdir}/usr/bin/balena"
    symlinks=(balenad balena-containerd balena-containerd-ctr balena-containerd-shim balena-proxy balena-runc)
    for s in "${symlinks[@]}"; do
        ln -s "balena" "${pkgdir}/usr/bin/${s}"
    done

    install -Dm644 "${srcdir}/balena.service" \
      "$pkgdir/usr/lib/systemd/system/balena.service"
    install -Dm644 "${srcdir}/balena.socket" \
      "$pkgdir/usr/lib/systemd/system/balena.socket"
    install -Dm644 "${srcdir}/80-balena.rules" \
        "$pkgdir/usr/lib/udev/rules.d/80-balena.rules"
      install -Dm644 "$srcdir/balena.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/balena.conf"
}
