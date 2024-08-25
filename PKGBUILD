# Maintainer: Joshua Ellis <josh@jpellis.me>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: kjslag <kjslag at gmail dot com>
# Contributor: teratomata <teratomat@gmail.com>
# Contributor: Maxim Mikityanskiy <maxtram95@gmail.com>

pkgname=mathematica-light
pkgver=14.1.0
_pkgver=${pkgver%.[0-9]}
pkgrel=1
pkgdesc="A computational software program used in scientific, engineering, and mathematical fields and other areas of technical computing with online documentation."
provides=('mathematica')
conflicts=('mathematica')
arch=('x86_64')
url="http://www.wolfram.com/mathematica/"
license=(LicenseRef-WolframMathematicaLicenseAgreement) # https://www.wolfram.com/legal/agreements/wolfram-mathematica/
depends=('openmp')
makedepends=('curl' 'inetutils')
optdepends=(
    ## The following list of dependencies was inferred from namcap's output.  If
    ## you believe there is an error, please let me know.  Also feel free to
    ## contribute description to dependencies if you know what they do.
    'alsa-lib'
    'atk'
    'cairo'
    'ffmpeg'
    'fontconfig'
    'gdk-pixbuf2'
    'glib2'
    'glu'
    'gmime'
    'gmp'
    'gtk2'
    'harfbuzz'
    'intel-tbb'
    'java-environment'
    'java-runtime'
    'leptonica'
    'libbson'
    'libffi'
    'libmongoc'
    'libogg'
    'libpng12'
    'libselinux'
    'libsm'
    'libssh2'
    'libutil-linux'
    'libx11'
    'libxcomposite'
    'libxml2'
    'libxrandr'
    'libxslt'
    'libxss'
    'libxtst'
    'libxxf86vm'
    'mesa-demos: for improved graphics output'
    'ncurses'
    'nvidia-utils'
    'openssl-1.0'
    'pango'
    'pixman'
    'portaudio'
    'postgresql-libs'
    'python'
    'qt5-declarative'
    'qt5-multimedia'
    'qt5-webengine'
    'qt5-xmlpatterns'
    'r'
    'tesseract'
    'zlib'
)
_source_url=$(
    curl -s 'https://www.wolfram.com/download-center/' \
    | grep 'account.wolfram.com/dl/WolframApp' \
    | grep "version=${_pkgver}" \
    | grep 'platform=Linux' \
    | grep 'includesDocumentation=false' \
    | sed -E 's/.*href="([^"]+)".*/\1/' \
    | uniq
)
source=(
    "Wolfram_${pkgver}_LIN.sh::${_source_url}"
    "remove-xdg-scripts.patch"
)
sha256sums=('3c2a63c2a03a342fa2c2f63175d601966179faf97beabf8ca086002fdd56167b'
            '20ba959296d418c8b00381da5abd87dc935633d44134a35e7961356bfef6a5f0')
options=(!strip !debug)

## To build this package you might need to place the mathematica-installer into
## your startdir If you don't own the installer you can download a trial version
## at http://www.wolfram.com/mathematica/trial

## Here you can change the installation directory. The default is '/opt/Mathematica'.
_installdir='/opt/Mathematica'

prepare() {
    if [ "$(echo "${srcdir}" | wc -w)" -ne 1 ]; then
        msg2 "ERROR: The Mathematica installer doesn't support directory names with spaces."
        msg2 "Current build directory: ${srcdir}"
        exit 1
    fi

    msg2 'Extracting Mathematica installer...'
    bash "${srcdir}/Wolfram_${pkgver}_LIN.sh" \
      --keep \
      --target "${srcdir}/bundle" \
      -- \
      -help >/dev/null

    patch -p1 -d "${srcdir}"/bundle < "${srcdir}"/remove-xdg-scripts.patch
}

package() {
    installdir="$(realpath -m "${pkgdir}/${_installdir}")"

    msg2 'Running Mathematica installer'
    # https://reference.wolfram.com/language/tutorial/InstallingWolfram.html#650929293
    bash "${srcdir}/bundle/Unix/Installer/WolframInstaller" \
        -execdir="${pkgdir}/usr/bin" \
        -targetdir="${installdir}" \
        -auto

    if [ -s "${installdir}"/InstallErrors ]; then
        msg2 "Review installation errors:"
        cat "${installdir}"/InstallErrors
    fi
    rm -f "${installdir}"/InstallErrors

    msg2 'Fixing symbolic links'
    rm "${pkgdir}"/usr/bin/*
    ln -sf '../SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript' "${installdir}/Executables/"
    relative_installdir="$(realpath --relative-to="${pkgdir}/usr/bin" "${installdir}")"
    ln -s "${relative_installdir}"/Executables/math "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/Executables/MathKernel "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/Executables/mcc "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/Executables/wolfram "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/Executables/wolframnb "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/Executables/WolframKernel "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/Executables/WolframNB "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/SystemFiles/Kernel/Binaries/Linux-x86-64/ELProver "${pkgdir}"/usr/bin/
    ln -s "${relative_installdir}"/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript "${pkgdir}"/usr/bin/

    msg2 'Setting up WolframScript'
    mkdir -p "${srcdir}"/WolframScript
    mkdir -p "${pkgdir}"/usr/share
    mkdir -p "${pkgdir}"/tmp/WolframScript
    bsdtar -xf "${installdir}"/SystemFiles/Installation/wolframscript_*_amd64.deb -C "${pkgdir}"/tmp/WolframScript data.tar.xz
    tar -xf "${pkgdir}"/tmp/WolframScript/data.tar.xz -C "${pkgdir}" ./usr/share/
    rm -rf "${pkgdir}"/tmp

    msg2 'Copying menu and mimetype information'
    mkdir -p \
          "${pkgdir}"/usr/share/applications \
          "${pkgdir}"/usr/share/desktop-directories \
          "${pkgdir}"/usr/share/mime/packages
    desktopFile="com.wolfram.Wolfram.${_pkgver}.desktop"
    sed -Ei 's|^(\s*TryExec=).*$|\1/usr/bin/WolframNB|g' "${installdir}/SystemFiles/Installation/$desktopFile"
    sed -Ei "s|^(\s*Exec=).*$|\1/usr/bin/WolframNB --name com.wolfram.Wolfram.${_pkgver} %F|g" "${installdir}/SystemFiles/Installation/$desktopFile"
    echo 'Categories=Science;Education;Languages;ArtificialIntelligence;Astronomy;Biology;Chemistry;ComputerScience;DataVisualization;Geography;ImageProcessing;Math;NumericalAnalysis;MedicalSoftware;Physics;ParallelComputer;' >> "${installdir}/SystemFiles/Installation/$desktopFile"
    cp "${installdir}/SystemFiles/Installation/$desktopFile" "${pkgdir}"/usr/share/applications/
    cp "${installdir}"/SystemFiles/Installation/*.directory "${pkgdir}"/usr/share/desktop-directories/
    cp "${installdir}"/SystemFiles/Installation/*.xml "${pkgdir}"/usr/share/mime/packages/

    msg2 'Copying icons'
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/{32x32,64x64,128x128}/{apps,mimetypes}
    cd "${installdir}"/SystemFiles/FrontEnd/SystemResources/X || exit 1
    for i in 32 64 128; do
        cp App-${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-wolfram.png
        for mimetype in $(find . -name 'vnd.*' | cut -d '-' -f1 | uniq); do
            mimetype="$(basename "$mimetype")"
            cp "${mimetype}-${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-${mimetype}.png"
        done
    done

    msg2 'Copying man pages'
    mkdir -p "${pkgdir}"/usr/share/man/man1
    cp "${installdir}"/SystemFiles/SystemDocumentation/Unix/*.1 "${pkgdir}"/usr/share/man/man1

    msg2 'Copying license'
    mkdir -p "${pkgdir}"/usr/share/licenses/Mathematica
    cp "${installdir}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/Mathematica/LICENSE.txt

    msg2 'Fixing file permissions'
    chmod go-w -R "${pkgdir}"/*
}
