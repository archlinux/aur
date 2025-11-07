# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=zotero-wpsjs
pkgver=1.6.3 
pkgvariant=''
pkgrel=1
pkgdesc="Zotero plugin for WPS Office Writer with background Python bridge"
arch=('x86_64')
url="https://gitee.com/wangrui5015/Zotero-WPSJS"
license=('GPL3')
depends=('python' 'wps-office-cn' 'zotero')   # adjust names if different in AUR
makedepends=('git')
install="${pkgname}.install"
source=(
  "${pkgname}::git+https://github.com/eslam-allam/zotero-wpsjs-mirror.git#tag=V${pkgver}${pkgvariant:+-$pkgvariant}"
  "${pkgname}.service"
)
sha256sums=('SKIP' 'SKIP')

build() {
  :
}

package() {
 cd "${srcdir}/${pkgname}/Linux" || exit 1
    export HOME=${srcdir}
    prefix="${HOME}/.local/share/Kingsoft/wps/"
    new_prefix="${pkgdir}/usr/lib/office6/"

    echo 'Patching settings file location...'
    sed -i "s|wps.Env.GetHomePath() + \`/.local/share/Kingsoft/wps/jsaddons/wps-zotero_1.0.0\`|'/usr/lib/office6/jsaddons/wps-zotero_1.0.0'|g" js/util.js
    
    mkdir -p "${prefix}"
    python install.py &> /dev/null

    cp "$prefix/jsaddons/publish.xml" "$prefix/jsaddons/jsplugins.xml"
    pushd "${prefix}" &&\
        find . -type f "(" \
            "(" -path "./*/.git*" -o -path "./*/__pycache__*" -o -name "*.bat" ")"\
                -prune\
            -o -name "*.py" -exec\
                install -D "${prefix}/{}" "${new_prefix}/{}" ";"\
            -o -exec \
                install -Dm777 "${prefix}/{}" "${new_prefix}/{}" ";"\
        ")"
    popd || exit 1

  install -Dm644 "$srcdir/${pkgname}.service" \
      "$pkgdir/usr/lib/systemd/user/${pkgname}.service"

}
