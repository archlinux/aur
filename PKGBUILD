# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=cloudflare-warp-bin
pkgver=2023.3.398
pkgrel=1
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

#
# when updating, find latest package by executing:
#
# `curl https://pkg.cloudflareclient.com/dists/focal/main/binary-amd64/Packages`
source=(
    "${pkgname}-${pkgver}-x86_64.deb::https://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2023_3_398_1_amd64_9880b6c7ae_amd64.deb"
    "${pkgname}-${pkgver}-${pkgrel}-Release::https://pkg.cloudflareclient.com/dists/focal/Release"
    "${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages::https://pkg.cloudflareclient.com/dists/focal/main/binary-amd64/Packages"
)

md5sums=('762831f7419edfe79374e7489cbc85e1'
         'SKIP'
         'SKIP')
sha256sums=('49d8046fc85f172dded51f217e012c15800e9a6113bd8f575fc98f8c0cdd5eb1'
            'SKIP'
            'SKIP')
install=$pkgname.install

# The .deb package contains the md5sums of the individual files as well -- we'll extract
# it, and update the paths to those files.
prepare() {
    # We don't extract the usr/ subdirectory, which only contains debian changelogs
    tar -xzOf control.tar.gz ./md5sums \
        | awk '{print $1, "'"${srcdir}"'/build/" $2}' \
        > "${srcdir}/md5sums"
}

# Prepares our source directory, all cloudflare expected output will be placed
# in `build/`
build() {
    # This is not stricly necessary, but it ensures we have a clean build every time.
    if [[ -d "${srcdir}/build/" ]]
    then
        rm -rf "${srcdir}/build/"
    fi

    mkdir -p "${srcdir}/build/" \
        && tar --extract \
               --gzip \
               --file=data.tar.gz \
               -C "${srcdir}/build/"
}

check() {
    # Validate hashes from the PGP signed "Release" file.
    # Based off the spotify PKGBUILD:
    #   https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=spotify#n48
    #
    #
    # First verify the hash of the Packages file:
    #  * narrow down to rows which contain the Package files, 'main/binary-amd64/Packages'
    #  * narrow down to rows which have 128-character hashes (sha512)
    #  * keep only the hash
    #  * save it in a file and run it through sha512sum
    #
    # Once we verified the Packages files, look up the .deb's hash in the Packages file,
    # and verify the .deb

    PKGHASH="${srcdir}/${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages.sha512"
    DEBHASH="${srcdir}/${pkgname}-${pkgver}-x86_64.deb.sha512"
    MD5SUMS="${srcdir}/md5sums"

    # This grabs the Packages sha512 hash from the Release file
    echo "$(grep -E '^\s?[a-f0-9]{128}\s+[0-9]+\s+main/binary-amd64/Packages$' ${pkgname}-${pkgver}-${pkgrel}-Release | tail -n 2 | head -n 1 | awk '{print $1}') ${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages" > ${PKGHASH}

    # This grabs the .deb sha512 hash from the Packages file
    echo "$(grep -E '(Version|SHA512)' ${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages | grep -E -A1 ${pkgver} | tail -n1 | awk '{print $2}') ${pkgname}-${pkgver}-x86_64.deb" > ${DEBHASH}

    echo "==> Validating package checksums"

    echo "==> sha512sum: ${PKGHASH}"
    if ! sha512sum --status --check ${PKGHASH}
    then
        echo "!!> SHA512 mismatch: ${PKGHASH}"
        exit 1
    fi

    echo "==> sha512sum: ${DEBHASH}"
    if ! sha512sum --status --check ${DEBHASH}
    then
        echo "!!> SHA512 mismatch: ${DEBHASH}"
        exit 1
    fi

    echo "==> md5sum: ${MD5SUMS}"
    if ! md5sum --status --check ${MD5SUMS}
    then
        echo "!!> Packaged md5sum mismatch!"
        exit 1
    fi

    echo "==> Validation succeeded"
}

package() {
    mkdir "${pkgdir}/usr/" || true

    # Copy everything from /usr as-is
    cp -R -v "${srcdir}/build/usr/" "${pkgdir}/"

    # Install binaries from /bin/* and /lib/* into /usr/bin/* and /usr/lib/*
    cp -R -v "${srcdir}/build/"{bin,lib} "${pkgdir}/usr/"


    # Fix systemd units
    sed -i \
        -e "s%ExecStart=/bin/warp-svc%ExecStart=/usr/bin/warp-svc%" \
        "${pkgdir}"/usr/lib/systemd/system/warp-svc.service
    sed -i \
        -e "s%ExecStart=/bin/warp-taskbar%ExecStart=/usr/bin/warp-taskbar%" \
        "${pkgdir}"/usr/lib/systemd/user/warp-taskbar.service

}
