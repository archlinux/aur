# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname='pseint'
pkgver=20210609
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode."
arch=('x86_64')
url='https://sourceforge.net/projects/pseint'
license=('GPL2')
conflicts=('pseint-bin')
depends=('gendesk' 'wxwidgets-gtk3')
noextract=(creator.psz)
source=("https://netactuate.dl.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-src-${pkgver}.tgz")
sha256sums=('cbebd218c7b8adf3050054c3e778bc4c8fdace59bc6cd43754cf4d267dd02952')  # 'makepkg -g' to generate it.

prepare(){

    cd ${pkgname}
    gendesk -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="${pkgname}" \
        --genericname="${pkgname}" \
        --comment="${pkgdesc}" \
        --exec="${pkgname}" \
        --path="/opt/${pkgname}" \
        --icon="${pkgname}" \
        --categories='Development,Education'
}

pkgver(){

    cd ${pkgname}
    cat "bin/version"
}

build(){

    cd ${pkgname}
    local -r wxconfig_version=$(wx-config --version | sed -E 's/([0-9]\.[0-9])(\.[0-9])*/\1/')
    sed -Ei \
        "s/(--version=)[0-9](\.[0-9])*/\1${wxconfig_version}/g ; \
        s,bin(/bin),\1," \
        {wxPSeInt,ps{eval,term,draw{E,3}}}/Makefile.lnx
    make linux
 }

package(){

    cd "${pkgname}"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rv bin/* ${pkgdir}/opt/${pkgname}
    install -Dvm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dvm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dvm755 <(echo -e '#!/usr/bin/env bash\n/opt/pseint/wxPSeInt') ${pkgdir}/usr/bin/${pkgname}
}

## Test
# rm -rf pseint-* src/ pkg/

## References
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=densify
# https://wiki.archlinux.org/title/Desktop_entries#How_to_use
# https://sourceforge.net/p/pseint/code/ci/master/tree/
# https://askubuntu.com/questions/1060601/is-there-a-way-to-create-a-script-and-make-it-executable-in-less-code-than-this#comment1736560_1060642
# https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
