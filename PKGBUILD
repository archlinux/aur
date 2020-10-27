# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgbase=docspell
pkgname=('docspell-joex' 'docspell-restserver')
pkgver=0.13.0
pkgrel=1
arch=('any')
url="https://github.com/eikek/docspell"
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
sha512sums=('d4892ad84b0d91713dd2fd0eb4b22bb7acf7b285898acda55928049c2a463cdb0c7f865acf5fe05c15bd5e581049948e9d2cbef31049dc049786324fb117ac1c'
            '315f2bdcefa48685bf4cfe5f0c1860c88904aab5cfdf4eea8885975d72177baa9308fbdf0e350fe14b1f6a22edfab538cfa82a70739c4b8bade1857f216226a5'
            '2603c87f2db0e5d57486ad15f83092f577308d1bcda94d9f03bb142cc367c8421105b09bdcd93164a5f55059ac2d4f6d188ba3f729c11211438643675b577f00'
            '71887a73f3f545260667084e065d8268cefb10912d81e3cdbcbb0e104f3ebb1a498b8fc7bf14ec1ebcbfae9d79006a618f2477969eb2bd79603e0abfe9cb120c'
            'f63f0fa58715b7da01aa265a7bec72eb24f0e98c354eed479b6034bc33b2ccdaef87db8a7630af1d5a6ac43fadf11a0f0a3fb3de5e183aa64d838a69b67125f9'
            '5cbe3c5a547eaa0af0952aca352b5dd86397b2c7fbc4fc730dd8882ee381586630124946d33ac34439505726a924c3b3c12792561ddc824fd5d5ef255d0a8d0f'
            'afe9a62801e962aac2996d1bfdd02bcf027f5135e40130bff2078a0fe2072d1d135ceb0dfce5d2174686f1f60a6d93f460c83fbb62884ef2e51c23232f521597'
            '2c3926f7bb67b2556c1d46116035053b204ab5aa5f11bbf2b0e7e7b5b10acfa5e1dd86fa9aa7b57f8d7d92a7cdac0d8f314de4dc289e33d5d327c2349fd97698')

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
    description=("Assists in organizing your piles of documents, resulting from scanners, e-mails and other sources with miminal effort. (Job executer)")
    pkgdesc="Job executer for docspell"
    depends+=('ghostscript' 'tesseract' 'unoconv' 'wkhtmltopdf')
    optdepends+=('ocrmypdf: adds an OCR layer to scanned PDF files to make them searchable'
                 'unpaper: pre-processes images to yield better results when doing ocr')
    backup=("etc/${pkgname[0]}.conf")

    install -Dm 755 "${pkgname[0]}.sh" "$pkgdir/usr/bin/${pkgname[0]}"
    install -Dm 644 "${pkgname[0]}.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname[0]}.conf"
    install -Dm 644 "$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname[0]}.conf"

    cd "${pkgname[0]}-$pkgver" || exit

    install -Dm 644 "conf/${pkgname[0]}.conf" -t "$pkgdir/etc"

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
    description=("Assists in organizing your piles of documents, resulting from scanners, e-mails and other sources with miminal effort. (Server)")
    backup=("etc/${pkgname[1]}.conf")

    install -Dm 755 "${pkgname[1]}.sh" "$pkgdir/usr/bin/${pkgname[1]}"
    install -Dm 644 "${pkgname[1]}.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname[1]}.conf"
    install -Dm 644 "$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname[1]}.conf"

    cd "${pkgname[1]}-$pkgver" || exit

    install -Dm 644 "conf/$pkgbase-server.conf" "$pkgdir/etc/${pkgname[1]}.conf"

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
