# $Id$
# Maintainer: Gegrely Imreh <imrehg@gmail.com>

pkgname=balena-engine
pkgver=18.9.10
pkgrel=1
epoch=1
pkgdesc='A Moby-based container engine for the Internet of Things'
arch=('x86_64' 'i686')
url='https://www.balena.io/'
license=('Apache')
depends=('glibc' 'bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'libsystemd'
         'libseccomp' 'libtool' 'btrfs-progs')
makedepends=('git' 'go>=1.10.8' 'cmake' 'systemd')
optdepends=('lxc: lxc backend support')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip' '!buildflags')
# Use exact commit version from Dockerfile for runc and containerd until 1.0.0
# https://github.com/docker/containerd/issues/299#issuecomment-240745119
# see commit in hack/dockerfile/binaries-commits
# https://github.com/docker/docker-ce/blob/master/components/engine/hack/dockerfile/binaries-commits
source=("git+https://github.com/balena-os/balena-engine.git#tag=v${pkgver}"
        "balena-engine.sysusers"
        "80-balena-engine.rules"
        "balena-engine.service.patch")
sha256sums=('SKIP'
            '39ab64fca83966b0edf2d56013ce33dcb44962800c1f0a29673708c9ba9328e3'
            'fbdcb0d6c5794c9db8fa30e81fa0f1d2f91d11e23f4c286e15ff57e8bef87bce'
            'c871ee7817b57c6f1c7674d0c93b1db767bb394a70852d8288df257bc2d29f54')


prepare() {
    cd "${srcdir}/${pkgname}"
    patch --forward --strip=1 --input="${srcdir}/balena-engine.service.patch"
}

build() {
    cd "${srcdir}/${pkgname}/"
    echo -n $(git describe --tags --always | sed 's/^v//;s/-/./g') > VERSION
    ./build.sh
}

package() {
    # The engine files
    mkdir -p "${pkgdir}/usr/bin/"
    for artifact in "${srcdir}/${pkgname}/bundles/binary-balena/"* ; do
      if [ ! -L "${artifact}" ]; then
        install -Dm755 "${artifact}" -t "${pkgdir}/usr/bin/"
      else
        cp -P "${artifact}" "${pkgdir}/usr/bin/"
      fi
    done

    # systemd
    install -Dm644 "${srcdir}/${pkgname}/contrib/init/systemd/${pkgname}.service" \
      "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}/contrib/init/systemd/${pkgname}.socket" \
      "$pkgdir/usr/lib/systemd/system/${pkgname}.socket"
    install -Dm644 "${srcdir}/80-${pkgname}.rules" \
      "${pkgdir}/usr/lib/udev/rules.d/80-${pkgname}.rules"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" \
      "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
