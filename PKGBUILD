# Maintainer: dcreager@dcreager.net
pkgname=jj-musubi-bin
pkgver=0.47.1
pkgrel=2
pkgdesc="jj-musubi: live sync for jujutsu"
arch=('x86_64' 'aarch64')
url="https://www.serpentine.com/software/jj-musubi/"
license=('Apache-2.0')
options=('!strip' '!debug')
source_x86_64=("https://github.com/bos/jj-musubi/releases/download/v${pkgver}/jj-musubi-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/bos/jj-musubi/releases/download/v${pkgver}/jj-musubi-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('787dc51e2b7fb9cbda04f70f44cb4d612959a6dc7deef8404de65fc05ba81a89')
sha256sums_aarch64=('638fec68d00642b3755f70a678ba069efb84380d9448913594c5ab87c12e4d66')

package() {
    local _arch="x86_64"
    [[ "${CARCH}" == "aarch64" ]] && _arch="aarch64"

    install -dm755 "${pkgdir}/opt/jj-musubi"
    bsdtar -xf "${srcdir}/jj-musubi-${pkgver}-${CARCH}-unknown-linux-musl.tar.gz" \
        -C "${pkgdir}/opt/jj-musubi" --strip-components=1

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/jj-musubi/musubi "${pkgdir}/usr/bin/musubi"

    # Upstream tarball carries the builder's uid; pacman packages must be root-owned
    chown -R root:root "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
