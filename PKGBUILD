# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck shell=bash
# shellcheck disable=SC2034,2154

pkgbase=docspell
pkgname=(
    'docspell-joex'
    'docspell-restserver'
    # 'firefox-extension-docspell'
)
pkgver=0.30.1
pkgrel=1
changelog=.CHANGELOG
arch=('any')
url="https://docspell.org/"
pkgdesc="Assists in organizing your piles of documents, resulting from scanners, e-mails and other sources with miminal effort."
license=('GPL3')
groups=('docspell')
source=("$pkgbase-$pkgver-restserver.zip::https://github.com/eikek/$pkgbase/releases/download/v$pkgver/$pkgbase-restserver-$pkgver.zip"
        "$pkgbase-$pkgver-joex.zip::https://github.com/eikek/$pkgbase/releases/download/v$pkgver/$pkgbase-joex-$pkgver.zip"
        # "$pkgbase-$pkgver-tools.zip::https://github.com/eikek/$pkgbase/releases/download/v$pkgver/$pkgbase-tools-$pkgver.zip"
        "${pkgname[0]}.sh"
        "${pkgname[1]}.sh"
        "${pkgname[0]}.service"
        "${pkgname[1]}.service"
        "$pkgbase.sysusers"
        "$pkgbase.tmpfiles")
sha512sums=('6e69b1553b2891f64e57b7743c9cb9e474e759023bb5f05ae4417cee730fba3d4b5a2d8a857e7ba9dc4267cb352bab3bcdb1cc30f6204d9ccfdd48c72910c255'
            '15b8cf23c50a8544b3e364934e6f91b9a3c3aefb98803c2fa1451d4f1919d63884818fdf5892b3f805e5e7234130d8d329deb84c5ac48681c0f82ca54f2d7e1f'
            '6ab8b24eb76f02b68e4fa4194b8771ef4f57c8375b34bf7bf914563528e347ea127beb5547e432910911d4fd15982cccdd1df50aeb76058129b909824ce49093'
            '0b8b08f47f1cb46a3bfc16df4b0574cebfb4a851562d134fcba3c4bf80fb011443499a549c3a04480456c048346d09f36fbcbc9d792810001c9c8b370d3926a8'
            'c1a7a9cb942413d0febb083554a15ded0ead5c7124624f0ec5fe43d3bc73a1637f89bc27f7b6e0bbdbd0d886799e5331beb5f45f476db70b69ae17c0d803f004'
            '391311d8d9859e579c158ea0d37c17f3f80f286743f68f09f09b6cf6ab4398b2dd1e878498867a8e4631ae38c11a4821ed2b47fa7fb254b6955cf91c3588e9ce'
            'afe9a62801e962aac2996d1bfdd02bcf027f5135e40130bff2078a0fe2072d1d135ceb0dfce5d2174686f1f60a6d93f460c83fbb62884ef2e51c23232f521597'
            '0fc1d59cd6b57186c3a17d03779f428552f50f161f9a13de3ce727ac47ae8e3aac3c719bae08dfda258de02cd140c0ab7ba9cc6728d0ae6f5a4b0cbbaf72fa9c')

prepare() {
    # shellcheck disable=2016
    sed -i -e 's@url = "jdbc:h2://"${java.io.tmpdir}"@url = "jdbc:h2:///var/lib/docspell@' \
        "${pkgname[0]}-$pkgver/conf/${pkgname[0]}.conf" \
        "${pkgname[1]}-$pkgver/conf/$pkgbase-server.conf"

    # sed -i -e 's@/usr/local/share/docspell/native.py@/usr/share/docspell-tools/native.py@' \
    #     "${pkgname[2]}-$pkgver/firefox/native/app_manifest.json"

    # sed -i -e 's@DS_SH_CMD="ds.sh"@DS_SH_CMD="docspell-dsc"@' \
    #     "${pkgname[2]}-$pkgver/firefox/native/native.py"
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
    depends=('ghostscript' 'java-runtime-headless' 'tesseract' 'unoconv' 'wkhtmltopdf')
    optdepends=('ocrmypdf: adds an OCR layer to scanned PDF files to make them searchable'
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

    # copy java libs
    cp -dpr --no-preserve=ownership \
        `# SRCFILES:` \
            "lib/." \
        `# DSTDIR:` \
            "$pkgdir/usr/share/java/${pkgname[0]}/"
}

package_docspell-restserver() {
    pkgdesc+=" (Server)"
    depends=('java-runtime-headless')
    optdepends=('solr: provide fulltext search')
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

    # copy java libs
    cp -dpr --no-preserve=ownership \
        `# SRCFILES:` \
            "lib/." \
        `# DSTDIR:` \
            "$pkgdir/usr/share/java/${pkgname[1]}/"
}

# makedepends+=('python')
# package_firefox-extension-docspell() {
#     pkgdesc="Send documents from the context menu in Firefox to Docspell"
#     depends=('python')
#     conflicts=('docspell-tools')
#     # optdepends=('docspell-dsc')

#     cd "${pkgname[2]}-$pkgver" || return

#     # Firefox extension and native messaging host
#     mkdir -p "$pkgdir/usr/share/${pkgname[2]}"
#     mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
#     install -Dm 644 "firefox/$pkgbase-extension.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/docspell@eikek.github.io.xpi"
#     install -Dm 755 "firefox/native/native.py" "$pkgdir/usr/share/${pkgname[2]}/firefox/native/native.py"
#     ln -s "/usr/share/${pkgname[2]}/firefox/native/app_manifest.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/$pkgbase.json"

#     # https://wiki.archlinux.org/index.php/Python_package_guidelines#Reproducible_bytecode
#     export PYTHONHASHSEED=0
#     python -O -m compileall "$pkgdir/usr/share/${pkgname[2]}/firefox/native/native.py"
# }
