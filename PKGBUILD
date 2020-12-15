# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgbase=docspell
pkgname=('docspell-joex' 'docspell-restserver')
pkgver=0.17.1
pkgrel=1
arch=('any')
url="https://github.com/eikek/docspell"
pkgdesc="Assists in organizing your piles of documents, resulting from scanners, e-mails and other sources with miminal effort."
license=('GPL3')
groups=('docspell')
depends=('java-runtime-headless')
optdepends=('solr: provide fulltext search')
source=("$pkgbase-$pkgver-restserver.zip::https://github.com/eikek/$pkgbase/releases/download/v$pkgver/$pkgbase-restserver-$pkgver.zip"
        "$pkgbase-$pkgver-joex.zip::https://github.com/eikek/$pkgbase/releases/download/v$pkgver/$pkgbase-joex-$pkgver.zip"
        "${pkgname[0]}.sh"
        "${pkgname[1]}.sh"
        "${pkgname[0]}.service"
        "${pkgname[1]}.service"
        "$pkgbase.sysusers"
        "$pkgbase.tmpfiles")
sha512sums=('1d3aa21a3a8d1230027596671501c02ca41af4ffb6b7547f34a4a7388e082ddd9cb94cc7a1bd50dbed2f806330166b278c7617e56b35473fc8814d77bc4fd91b'
            '5d87581933834e7a0fcd450e197bab2f4a7ce218d16aed80a871615d4b4df57ee89649be40a13b513b40e69200d525533c2d4162e0b3f2563277885751fc4ace'
            '6ab8b24eb76f02b68e4fa4194b8771ef4f57c8375b34bf7bf914563528e347ea127beb5547e432910911d4fd15982cccdd1df50aeb76058129b909824ce49093'
            '0b8b08f47f1cb46a3bfc16df4b0574cebfb4a851562d134fcba3c4bf80fb011443499a549c3a04480456c048346d09f36fbcbc9d792810001c9c8b370d3926a8'
            'f63f0fa58715b7da01aa265a7bec72eb24f0e98c354eed479b6034bc33b2ccdaef87db8a7630af1d5a6ac43fadf11a0f0a3fb3de5e183aa64d838a69b67125f9'
            '5cbe3c5a547eaa0af0952aca352b5dd86397b2c7fbc4fc730dd8882ee381586630124946d33ac34439505726a924c3b3c12792561ddc824fd5d5ef255d0a8d0f'
            'afe9a62801e962aac2996d1bfdd02bcf027f5135e40130bff2078a0fe2072d1d135ceb0dfce5d2174686f1f60a6d93f460c83fbb62884ef2e51c23232f521597'
            '0fc1d59cd6b57186c3a17d03779f428552f50f161f9a13de3ce727ac47ae8e3aac3c719bae08dfda258de02cd140c0ab7ba9cc6728d0ae6f5a4b0cbbaf72fa9c')

prepare() {
    # shellcheck disable=2016
    sed -i 's@url = "jdbc:h2:\/\/"\${java\.io\.tmpdir}"@url = "jdbc:h2:///var/lib/docspell@' \
        "${pkgname[0]}-$pkgver/conf/${pkgname[0]}.conf" \
        "${pkgname[1]}-$pkgver/conf/$pkgbase-server.conf"
}

# You do not need to compile Java applications from source.
# Very little optimization goes into the compile process, as with gcc created binaries.
# If the source package provides an easy way to build from source go ahead and use it,
# but if its easier to just grab a binary release of a jar file or an installer you may use that as well.
# https://wiki.archlinux.org/index.php/Java_package_guidelines#Java_packaging_on_Arch_Linux
# makedepends=('sbt' 'elm-bin')
# checkdepends=('unpaper' 'ocrmypdf' 'solr')

package_docspell-joex() {
    pkgdesc+=" (Job executer)"
    depends+=('ghostscript' 'tesseract' 'unoconv' 'wkhtmltopdf')
    optdepends+=('ocrmypdf: adds an OCR layer to scanned PDF files to make them searchable'
                 'unpaper: pre-processes images to yield better results when doing ocr')
    backup=("etc/docspell/joex.conf")

    install -Dm 755 "${pkgname[0]}.sh" "$pkgdir/usr/bin/${pkgname[0]}"
    install -Dm 644 "${pkgname[0]}.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname[0]}.conf"
    install -Dm 644 "$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname[0]}.conf"

    cd "${pkgname[0]}-$pkgver" || return

    # shellcheck disable=2174
    mkdir -p -m 750 "$pkgdir/etc/docspell"
    install -Dm 640 "conf/${pkgname[0]}.conf" "$pkgdir/etc/docspell/joex.conf"

    # https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
    # make directories
    mkdir -p "$pkgdir/usr/share/java/${pkgname[0]}"

    # copy documentary
    cp -dpr --no-preserve=ownership \
        `# SRCFILES:` \
            "lib/." \
        `# DSTDIR:` \
            "$pkgdir/usr/share/java/${pkgname[0]}/"
}

package_docspell-restserver() {
    pkgdesc+=" (Server)"
    backup=("etc/docspell/restserver.conf")

    install -Dm 755 "${pkgname[1]}.sh" "$pkgdir/usr/bin/${pkgname[1]}"
    install -Dm 644 "${pkgname[1]}.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname[1]}.conf"
    install -Dm 644 "$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname[1]}.conf"

    cd "${pkgname[1]}-$pkgver" || return

    # shellcheck disable=2174
    mkdir -p -m 750 "$pkgdir/etc/docspell"
    install -Dm 640 "conf/$pkgbase-server.conf" "$pkgdir/etc/docspell/restserver.conf"

    # https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
    # make directories
    mkdir -p "$pkgdir/usr/share/java/${pkgname[1]}"

    # copy documentary
    cp -dpr --no-preserve=ownership \
        `# SRCFILES:` \
            "lib/." \
        `# DSTDIR:` \
            "$pkgdir/usr/share/java/${pkgname[1]}/"
}
