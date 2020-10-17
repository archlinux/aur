# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgbase=docspell
pkgname=('docspell-joex' 'docspell-restserver')
pkgver=0.12.0
pkgrel=1
arch=('any')
url="https://github.com/eikek/docspell"
license=('GPL3')
groups=('docspell')
source=("$pkgbase-$pkgver-restserver.zip::https://github.com/eikek/$pkgbase/releases/download/v$pkgver/$pkgbase-restserver-$pkgver.zip"
        "$pkgbase-$pkgver-joex.zip::https://github.com/eikek/$pkgbase/releases/download/v$pkgver/$pkgbase-joex-$pkgver.zip"
        "${pkgname[0]}.sh"
        "${pkgname[1]}.sh"
        "${pkgname[0]}.service"
        "${pkgname[1]}.service"
        "$pkgbase.sysusers"
        "$pkgbase.tmpfiles")
sha512sums=('71d57a7645fb62138019d2be01d6fcd627c8b85407954cba50d4dd4c939ea35f06516eda24f10cc53d2f28b0ed4a534ec842b15409e1c21fe639581e7bb9d878'
            'd563241a071f81fd325c88bccd6c9f448e6b297be326266639af2eec51f766d134dad379f56fd737247769b22007ba2ded6e8ad2b3b84e13f9bc4b9cfb529e9b'
            '2603c87f2db0e5d57486ad15f83092f577308d1bcda94d9f03bb142cc367c8421105b09bdcd93164a5f55059ac2d4f6d188ba3f729c11211438643675b577f00'
            '71887a73f3f545260667084e065d8268cefb10912d81e3cdbcbb0e104f3ebb1a498b8fc7bf14ec1ebcbfae9d79006a618f2477969eb2bd79603e0abfe9cb120c'
            'ecc4caa40f4605b6889f5afae2686b9082c012e4a12225a219daaf304a7ceec31b7b2d9458133d33ec12cb10b47b3275b0b14707c39733204e64904885858d41'
            '20874138bfbcb952a9cd913d38418b0ab19c3c91f035e6a1b2b4549daf7f63075968dfc1eb114322a0666c9709888a3f578c8924fd23ccb2d839385c923e1ff9'
            '1c5d5ade3948e3791b790ff27ec20017b589101622342a7ff603127a4400fd557cdc1125a35b812eef317abdb04b5ffd43d4b52977eac85e4ed009086293bc78'
            '22bece62e82fcbc7c41daeb457cf7473a5e22690ec6a9a7e45e471aabcce930fca8220102b2b979057b577ddfedba3b758227ee912191f8074dbdd2f56b20e8c')

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
    depends=('java-runtime-headless' 'ghostscript' 'tesseract' 'unoconv' 'wkhtmltopdf')
    optdepends=('unpaper: pre-processes images to yield better results when doing ocr'
            'ocrmypdf: adds an OCR layer to scanned PDF files to make them searchable'
            'solr: provide the fulltext search feature')
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
    depends=('java-runtime-headless')
    optdepends=('solr: provide the fulltext search feature')
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
