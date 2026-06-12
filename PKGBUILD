# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=izpack
pkgver=5.2.6
pkgrel=1
pkgdesc='Tool for packaging applications on the Java platform as cross-platform installers'
arch=('any')
url='http://izpack.org/'
license=('Apache-2.0')
depends=(
    'hicolor-icon-theme'
    'java-environment=11'
    'sh')
optdepends=(
    'p7zip: for izpack2exe wrapper'
    'python: for wrapper utils'
    'python-setuptools: for wrapper utils'
    'upx: for izpack2exe wrapper')
makedepends=(
    'git'
    'maven')
checkdepends=(
    'gnome-themes-extra'
    'gtk3')
source=("git+https://github.com/izpack/izpack.git#tag=${pkgname}-${pkgver}"
        '010-izpack-compile.patch')
sha256sums=('73c4a1e619f2538d085153a7213937b364c093b5212779c7c4cbcbc709ed54cf'
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
    _ver="$(find izpack/izpack-dist/target -type f -name 'izpack-dist-*-installer.jar' |
        sed 's/-installer\.jar$//;s/-tests$//;s|.*/izpack-dist-||')"
    printf '%s\n' '0' '1' '1' '1' "${pkgdir}/opt/izpack" \
                  'O' '1' 'Y' '1' 'N' 'N' 'Y' "${pkgdir}/opt/izpack/auto-install.xml" |
    java -jar "izpack/izpack-dist/target/izpack-dist-${_ver}-installer.jar" -console
    
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
