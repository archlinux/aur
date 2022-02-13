# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=cloudflare-warp-bin
pkgver=2022.2.29
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

# in ubuntu focal: apt-get --print-uris install cloudflare-warp
source=(
    "${pkgname}-${pkgver}-x86_64.deb::https://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2022_2_29_1_amd64_4c914fa5af_amd64.deb"
    "${pkgname}-${pkgver}-${pkgrel}-Release::https://pkg.cloudflareclient.com/dists/focal/Release"
    "${pkgname}-${pkgver}-${pkgrel}-Release.sig::https://pkg.cloudflareclient.com/dists/focal/Release.gpg"
    "${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages::https://pkg.cloudflareclient.com/dists/focal/main/binary-amd64/Packages"
)

# If you're getting PGP validation errors, you likely need to import the cloudflare GPG key.
# You can import it using one of the following methods:
#
# Using curl directly from their servers:
#  * curl -sS https://pkg.cloudflareclient.com/pubkey.gpg  | gpg --import -
#
# Using MIT's keyserver:
#  gpg --recv-keys --keyserver hkp://pgp.mit.edu C068A2B5771775193CBE1F2F6E2DD2174FA1C3BA
#
# Or a utility like `yay` can do this automatically for you using:
#   yay -S --pgpfetch cloudflare-warp-bin
#
# which will automatically import the GPG key based on the `validpgpkeys` attribute below.

validpgpkeys=('C068A2B5771775193CBE1F2F6E2DD2174FA1C3BA')

md5sums=('b9489e943a4b0b97fce23ac3ff23b422'
         'SKIP'
         'SKIP'
         'SKIP')
sha256sums=('d690f6345ce378cce25991144ab471ac3276aa11ffe64ec1fb25de1c94a2bf97'
            'SKIP'
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

    # We don't extract the usr/ subdirectory, which only contains debian changelogs
    mkdir -p "${srcdir}/build/usr/" \
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

    # This grabs the .deb sha5125 hash from the Packages file
    echo "$(grep -E '(Version|SHA512)' ${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages | grep -E -A1 '2022.2.29' | tail -n1 | awk '{print $2}') ${pkgname}-${pkgver}-x86_64.deb" > ${DEBHASH}


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
    cp -R "${srcdir}/build/"{bin,lib} "${pkgdir}/usr/"

    # Fix systemd unit
    sed -i \
        -e "s%ExecStart=/bin/warp-svc%ExecStart=/usr/bin/warp-svc%" \
        "${pkgdir}"/usr/lib/systemd/system/warp-svc.service

}
