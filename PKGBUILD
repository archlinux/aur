# Maintainer: witt <1989161762 at qq dot com>

pkgname=cmd-markdown
pkgver=3.0
pkgrel=1
pkgdesc='An enhanced Markdown editor with MathJax, flowchart & sequence-diagram support'
arch=('x86_64' 'i686')
url='https://www.zybuluo.com/cmd'
license=('custom')
depends=('nss' 'gconf' 'libnotify' 'gtk2' 'alsa-lib' 'libxtst' 'libudev0-shim' 'hicolor-icon-theme')
DLAGENTS=("https::/usr/bin/wget --user-agent=Mozilla --referer=https://zybuluo.com -O %o %u")
source_x86_64=("${pkgname}_x86_64_${pkgver}.zip::https://client.zybuluo.com/cmd_linux64_v3.zip")
source_i686=("${pkgname}_i686_${pkgver}.zip::https://client.zybuluo.com/cmd_linux32_v3.zip")
options=('!strip')
sha256sums_x86_64=('ab1cf279d9edf10421771afb6e7665b6ebcf712955e9bd24be878774375677ef')
sha256sums_i686=('5ca01813eaed9ae3e162b03c8fc843b70c57f3a38335a005d6eed1366dcca9b3')

prepare(){
    [ -d "${srcdir}/${pkgname/-/_}_linux64" ] && mv "${srcdir}/${pkgname/-/_}_linux64" "${srcdir}/${pkgname}"
    [ -d "${srcdir}/${pkgname/-/_}_linux32" ] && mv "${srcdir}/${pkgname/-/_}_linux32" "${srcdir}/${pkgname}"

    {
        echo "Icon=${pkgname}"
        echo "Terminal=false"
        echo "Categories=Office;Applications;TextEditor;"
        echo "Comment=An enhanced Markdown editor"
        echo "Encoding=UTF-8"
    } >> "${srcdir}/${pkgname}/Cmd Markdown.desktop"

    sed -i "s/Exec=Cmd Markdown/Exec=${pkgname}/" "${srcdir}/${pkgname}/Cmd Markdown.desktop"
}

package(){
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}/Cmd Markdown.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm "${srcdir}/${pkgname}/Cmd Markdown.desktop"

    # icons
    find "${srcdir}/${pkgname}/package.nw/black_icons" -type f -name "icon_*x*.png" | while read -r icon_file; do
        # 提取文件名
        filename=$(basename "${icon_file}")

        size="${filename##icon_}"
        size="${size/.png/}"

        install -Dm644 "${icon_file}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done

    # binary
    install -Dm755 "${srcdir}/${pkgname}/Cmd Markdown" "${pkgdir}/opt/${pkgname}/Cmd Markdown"
    ln -s "/opt/${pkgname}/Cmd Markdown" "${pkgdir}/usr/bin/${pkgname}"
    rm "${srcdir}/${pkgname}/Cmd Markdown"

    install -Dm755 "${srcdir}/${pkgname}/chrome_crashpad_handler" "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"
    rm "${srcdir}/${pkgname}/chrome_crashpad_handler"

    find "${pkgname}/" -type f -exec install -Dm644 {} "${pkgdir}/opt/{}" \;
}

