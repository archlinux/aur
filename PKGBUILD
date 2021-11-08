# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=cloudflare-warp-bin
pkgver=2021.10.0
pkgrel=2
pkgdesc="Cloudflare Warp Client"

url="https://1.1.1.1"
license=("unknown")

depends=("glibc" "dbus" "lz4" "zstd" "xz" "nftables" "libgpg-error")
checkdepends=("coreutils")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')
conflicts=('cloudflare-warp')
# zcat src/build/usr/usr/share/doc/cloudflare-warp/changelog.gz > cloudflare-warp-bin.changelog
changelog=$pkgname.changelog

# in ubuntu: apt-get --print-uris install cloudflare-warp
source=("https://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2021_10_0_1_amd64_916ef55734_amd64.deb")

md5sums=('74db1c816442229cebfab10c66dc580e')
sha256sums=('1e724fd480ed96b8a2bd9dcf65129ae4556097b98b96d062de3a5134d5f58270')
install=$pkgname.install

prepare() {
    tar -xzOf control.tar.gz ./md5sums \
        | grep -v 'usr' \
        | awk '{print $1, "'"${srcdir}"'/usr/" $2}' \
        > ${srcdir}/md5sums
}

build() {
    if [[ -d ${srcdir}/usr/ ]]
    then
        rm -rf ${srcdir}/usr/
    fi

    mkdir ${srcdir}/usr/ \
          && tar -xzf data.tar.gz  --exclude="usr" -C "${srcdir}/usr/"
}

check() {
    echo "==> Validating package contents"
    md5sum -c ${srcdir}/md5sums
}

package() {
    mv ${srcdir}/usr/ ${pkgdir}/usr/
}
