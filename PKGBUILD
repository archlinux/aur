# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=izpack
pkgver=5.2.4
pkgrel=1
pkgdesc='Tool for packaging applications on the Java platform as cross-platform installers'
arch=('any')
url='http://izpack.org/'
license=('Apache-2.0')
depends=('sh' 'java-environment=11' 'hicolor-icon-theme')
optdepends=('python: for wrapper utils'
            'p7zip: for izpack2exe wrapper'
            'upx: for izpack2exe wrapper')
makedepends=('git' 'maven')
checkdepends=('gtk2' 'gnome-themes-standard')
source=("git+https://github.com/izpack/izpack.git#tag=${pkgname}-${pkgver}"
        '010-izpack-compile.patch')
sha256sums=('4bd5b62b899c7670ab06e59d31aa60f1b79024a9da8737d493271856d7a0d895'
            'a42578544bfba028a804f9fd9dfa7ad69bc3d7be72bedd47c95341c7719ab17c')

prepare() {
    patch -d izpack -Np1 -i "${srcdir}/010-izpack-compile.patch"
}

build() {
    mvn -f izpack \
        -Dproject.build.outputTimestamp="$SOURCE_DATE_EPOCH" \
        -DskipTests='true' \
        clean package
}

check() {
    mvn -f izpack test
}

package() {
    # install
    local _ver
    _ver="$(find izpack/izpack-dist/target -type f -name 'izpack-dist-*.jar' |
        sort | head -n1 | sed 's/\.jar$//;s/-tests$//;s|.*/izpack-dist-||')"
    printf '%s\n' '0' '1' '1' '1' "${pkgdir}/opt/izpack" \
                  'O' '1' 'Y' '1' 'N' 'N' 'Y' "${pkgdir}/opt/izpack/auto-install.xml" |
    java -jar "izpack/izpack-dist/target/izpack-dist-${_ver}.jar" -console
    
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
    install -D -m644 izpack/src/doc-reST/izpack-utils.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    
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
