# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=cloudflare-warp-bin
pkgver=2021.10.0
pkgrel=3
pkgdesc="Cloudflare Warp Client"
url="https://1.1.1.1"
license=("unknown")
depends=("glibc" "dbus" "lz4" "zstd" "xz" "nftables" "libgpg-error")
checkdepends=("coreutils")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')
conflicts=('cloudflare-warp')

# zcat src/build/usr/share/doc/cloudflare-warp/changelog.gz  > cloudflare-warp-bin.changelog
changelog=$pkgname.changelog

# in ubuntu focal: apt-get --print-uris install cloudflare-warp
source=("https://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2021_10_0_1_amd64_916ef55734_amd64.deb")

md5sums=('74db1c816442229cebfab10c66dc580e')
sha256sums=('1e724fd480ed96b8a2bd9dcf65129ae4556097b98b96d062de3a5134d5f58270')
install=$pkgname.install

# The .deb package contains the md5sums of the individual files as well -- we'll extract
# it, and update the paths to those files.
prepare() {
    # We don't extract the usr/ subdirectory, which only contains debian changelogs
    tar -xzOf control.tar.gz ./md5sums \
        | awk '{print $1, "'"${srcdir}"'/build/" $2}' \
        > ${srcdir}/md5sums
}

# Prepares our source directory, all cloudflare expected output will be placed
# in `build/`
build() {
    # This is not stricly necessary, but it ensures we have a clean build every time.
    if [[ -d ${srcdir}/build/ ]]
    then
        rm -rf ${srcdir}/build/
    fi

    # We don't extract the usr/ subdirectory, which only contains debian changelogs
    mkdir -p ${srcdir}/build/usr/ \
        && tar --extract \
               --gzip \
               --file=data.tar.gz \
               -C "${srcdir}/build/"
}

# Note that `${srcdir}/md5sums` contains the absolute path to the files on disk
# in the src paths.
check() {
    echo "==> Validating packaged md5sums"

    if ! md5sum --status --check ${srcdir}/md5sums
    then
        echo "!!> Packaged md5sum mismatch!"
        exit 1
    fi

    echo "==> Validation succeeded"
}

package() {
    mkdir ${pkgdir}/usr/ || true
    cp -R ${srcdir}/build/{bin,lib} ${pkgdir}/usr/
}
