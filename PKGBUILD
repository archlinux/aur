# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=izpack
pkgver=5.1.3
pkgrel=2
pkgdesc='Tool for packaging applications on the Java platform as cross-platform installers'
arch=('any')
url='http://izpack.org/'
license=('Apache')
depends=('sh' 'java-environment=8' 'hicolor-icon-theme')
optdepends=('python: for wrapper utils'
            'p7zip: for izpack2exe wrapper'
            'upx: for izpack2exe wrapper')
makedepends=('maven')
checkdepends=('gtk2' 'gnome-themes-standard')
source=("https://github.com/izpack/izpack/archive/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-izpack-compile.patch')
sha256sums=('5c82c115ce58d476cc8dbc7c7e5aa6069511df0dcc8b657c3a7ddb9afc0363be'
            '42609fa684456afe770d43670fcc1ffcce099f25a76cea00df3f8323aa95f582')

prepare() {
    patch -d "${pkgname}-${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-izpack-compile.patch"
}

build() {
    mvn -f "${pkgname}-${pkgname}-${pkgver}" \
        -Dproject.build.outputTimestamp="$SOURCE_DATE_EPOCH" \
        -DskipTests='true' \
        clean package
}

check() {
    mvn -f "${pkgname}-${pkgname}-${pkgver}" test
}

package() {
    # install
    printf '%s\n' '0' '1' '1' '1' "${pkgdir}/opt/izpack" \
                  'O' '1' 'Y' '1' 'N' 'N' 'Y' "${pkgdir}/opt/izpack/auto-install.xml" |
    java -jar "${pkgname}-${pkgname}-${pkgver}/izpack-dist/target/izpack-dist-${pkgver}.jar" -console
    
    # fix permissions
    chmod a+x "${pkgdir}/opt/izpack/utils/wrappers/izpack2app/izpack2app.py"
    chmod a+x "${pkgdir}/opt/izpack/utils/wrappers/izpack2exe/izpack2exe.py"
    chmod a+x "${pkgdir}/opt/izpack/utils/wrappers/izpack2jnlp/izpack2jnlp.py"
    
    # remove unneeded/unwanted files
    rm -r "${pkgdir}/opt/izpack/Uninstaller"
    rm "${pkgdir}/opt/izpack/bin"/{*.bat,start.sh}
    rm "${pkgdir}/opt/izpack/utils/wrappers/izpack2exe"/{7za,upx}{,.exe}
    
    # remove $pkgdir reference from auto-install.xml
    sed -Ei "s|${pkgdir}(/opt/izpack)|\1|" "${pkgdir}/opt/izpack/auto-install.xml"
    
    # wrapper utils doc
    install -D -m644 "${pkgname}-${pkgname}-${pkgver}/src/doc-reST/izpack-utils.txt" \
        -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # symlinks
    local _dest
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//' <<< "$_file")"
        _dest="$(sed ";s/_${_res}//;s/_/-/" <<< "$_file")"
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/mimetypes"
        ln -s "../../../../../../opt/izpack/icons/${_file}" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/mimetypes/${_dest}"
    done < <(find "${pkgdir}/opt/izpack/icons" -type f -name '*.png' -print0 |
        sed -z "s|${pkgdir}/opt/izpack/icons/||")
    mkdir -p "${pkgdir}/usr"/{bin,share/licenses}
    ln -s "../../opt/izpack/bin/compile" "${pkgdir}/usr/bin/izpack-compile"
    ln -s "../../../opt/izpack/legal" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/bin/7za "${pkgdir}/opt/izpack/utils/wrappers/izpack2exe/7za"
    ln -s /usr/bin/upx "${pkgdir}/opt/izpack/utils/wrappers/izpack2exe/upx"
}
