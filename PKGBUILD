# Maintainer: L. Gayral <lgayral@math.cnrs.fr>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>
# Contributor: heavysink <winstonwu91 at gmail>

softname=miktex
pkgname=$softname-git
conflicts=(miktex)
pkgver=26.2
pkgrel=1
pkgdesc="a distribution of the TeX/LaTeX typesetting system"
arch=('x86_64')
url="https://miktex.org"
license=('custom:MiKTeX License')
depends=('apr' 'boost-libs' 'apr-util' 'bzip2' 'cairo' 'expat' 'fontconfig' 'freetype2'
         'fribidi' 'gd' 'gmp' 'graphite' 'hunspell' 'icu'
         'libjpeg' 'log4cxx' 'xz' 'mpfr' 'libmspack' 'openssl' 'pixman' 'libpng'
         'poppler' 'popt' 'potrace' 'uriparser' 'hicolor-icon-theme' 'zziplib' 'poppler-qt6'
         'qt6-declarative' 'qt6-5compat' 'mpfi')
makedepends=('cmake' 'coreutils' 'fop' 'sed' 'libxslt' 'qt6-tools' 'boost')
source=("https://github.com/MiKTeX/miktex/archive/${pkgver}.tar.gz")
md5sums=('7639d606db2387d7099185a992532516')
options=('!buildflags')

prepare() {
    cd "$srcdir/$softname-$pkgver"
    find . -name "*.h" -exec sed -i 's|log4cxx/rollingfileappender.h|log4cxx/rolling/rollingfileappender.h|g' {} +
    find . -name "*.cpp" -exec sed -i 's|log4cxx/rollingfileappender.h|log4cxx/rolling/rollingfileappender.h|g' {} +
    cp cmake/modules/FindPOPPLER_QT5.cmake cmake/modules/FindPOPPLER_QT6.cmake
    sed -i 's/QT5/QT6/g' cmake/modules/FindPOPPLER_QT6.cmake
    sed -i 's/qt5/qt6/g' cmake/modules/FindPOPPLER_QT6.cmake
    sed -i -e '1i #include <cstdint>' Programs/DviWare/dvisvgm/source/libs/woff2/include/woff2/output.h
}

build() {
    cd "$srcdir/$softname-$pkgver"
    [ -d build ] || mkdir build
    cd build
    cmake   -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX=/opt/miktex \
            -DWITH_UI_QT=ON \
            -DUSE_SYSTEM_POPPLER=TRUE -DUSE_SYSTEM_POPPLER_QT=TRUE \
            -DUSE_SYSTEM_HARFBUZZ=FALSE -DUSE_SYSTEM_HARFBUZZ_ICU=FALSE \
            -Wno-dev ..
    make -j2
}

package() {
    cd "$srcdir/$softname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
 
    cd "$srcdir/$softname-$pkgver"
    install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${softname}/README.md"
    install -vDm644 "HACKING.md"   "${pkgdir}/usr/share/doc/${softname}/HACKING.md"
    install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${softname}/CHANGELOG.md"
    install -vDm644 "COPYING.md"   "${pkgdir}/usr/share/licenses/${softname}/COPYING.md"

    cd "${pkgdir}/opt/${softname}"
    find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
    find "man"   -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/{}" \;
    rm -rf "share" "man"

    cd "${pkgdir}/usr/share/applications"
    find "icons" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/{}" \;
    rm -rf "icons"


    sed -i 's|Exec=|Exec=/opt/miktex/bin/|' "miktex-console.desktop"

    cd "${pkgdir}/usr/share/polkit-1/actions"
    sed -i 's|/usr/bin|/opt/miktex/bin|' "miktex-console.policy"

    cd "${pkgdir}/opt/${softname}/bin"
    for _gsu in pkexec kdesu gksu; do
        ln -s "/usr/bin/${_gsu}" "${_gsu}"
    done

    install -dm755 "${pkgdir}/usr/bin"
    find . -type f -name 'miktex*' -exec ln -s "/opt/miktex/bin/{}" "${pkgdir}/usr/bin/{}" \;
}
