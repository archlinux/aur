# Maintainer: Joshua Ellis <josh@jpellis.me>
# Contributor: Tiago "marmis" de Paula <tiagodepalves@gmail.com>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: kjslag <kjslag at gmail dot com>
# Contributor: teratomata <teratomat@gmail.com>
# Contributor: Maxim Mikityanskiy <maxtram95@gmail.com>

pkgname=mathematica
pkgver=14.2.1
_pkgver=${pkgver%.[0-9]}
pkgrel=1
pkgdesc="Computational software for mathematics, science, and engineering, with offline documentation included."
arch=('x86_64')
url="http://www.wolfram.com/mathematica/"
license=(LicenseRef-WolframMathematicaLicenseAgreement) # https://www.wolfram.com/legal/agreements/wolfram-mathematica/
makedepends=('chrpath' 'curl' 'rsync' 'inetutils')
depends=('openmp')
optdepends=(
    'ttf-dejavu: correct fonts for Greek characters and inline TeX'
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
    | grep -v 'includesDocumentation=false' \
    | sed -E 's/.*href="([^"]+)".*/\1/' \
    | uniq
)
source=(
    "Wolfram_${pkgver}_LIN_Bndl.sh::${_source_url}"
    "remove-xdg-scripts.patch"
    "insecure-runpath.list"
)
sha256sums=('0dc65b7adaf9c0ede2fc391c860a6c5b74461df6b53ec940e1f2be6d143af018'
            '20ba959296d418c8b00381da5abd87dc935633d44134a35e7961356bfef6a5f0'
            '8f808af5ee778bad8a78b4544bbda9854a06159b65f3368d508ebcaabf4bbadd')
options=(!strip !debug)

## To build this package you might need to place the mathematica-installer into
## your startdir If you don't own the installer you can download a trial version
## at http://www.wolfram.com/mathematica/trial

## The documentation takes up the majority of the disk space.  If you do not wish
## to keep it, uncomment the relevant lines at the bottom of this PKGBUILD, or
## install https://aur.archlinux.org/packages/mathematica-light.

## The final package can be very large (especially if documentation is kept) and
## compression can be quite slow.  In most cases, the package is installed
## straight away and the package need not be kept, so compression can be disabled.
# PKGEXT='.pkg.tar'

## Here you can change the installation directory. The default is '/opt/Mathematica'.
_installdir='/opt/Mathematica'

prepare() {
    warning "Building Mathematica takes around 24GiB of space for 'makepkg'."
    warning 'Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work.'

    if [ "$(echo "${srcdir}" | wc -w)" -ne 1 ]; then
        msg2 "ERROR: The Mathematica installer doesn't support directory names with spaces."
        msg2 "Current build directory: ${srcdir}"
        exit 1
    fi

    msg2 'Extracting Mathematica installer...'
    bash "${srcdir}/Wolfram_${pkgver}_LIN_Bndl.sh" \
      --keep \
      --target "${srcdir}/bundle" \
      -- \
      -noexec

    patch -p1 -d "${srcdir}"/bundle < "${srcdir}"/remove-xdg-scripts.patch
}

package() {
    export installdir="$(realpath -m "${pkgdir}/${_installdir}")"

    msg2 'Running Mathematica installer'
    # https://reference.wolfram.com/language/tutorial/InstallingWolfram.html#650929293
    bash "${srcdir}/bundle/Unix/Installer/WolframInstaller" \
        -execdir="${pkgdir}/usr/bin" \
        -targetdir="${installdir}" \
        -auto

    # Install documentation
    bash "${srcdir}"/bundle/Unix/.bundle/Unix/Installer/MathInstaller \
        -targetdir="${pkgdir}/tmp" \
        -auto
    rsync -a --remove-source-files "${pkgdir}"/tmp/Documentation/English "${installdir}"/Documentation/
    rm -rf "${pkgdir}"/tmp

    if [ -s "${installdir}"/InstallErrors ]; then
        msg2 "Review installation errors:"
        cat "${installdir}"/InstallErrors
    fi
    rm -f "${installdir}"/InstallErrors

    msg2 'Setting up WolframScript'
    install -d "${srcdir}"/WolframScript "${pkgdir}"/usr/share
    bsdtar -xf "${installdir}"/SystemFiles/Installation/wolframscript_*_amd64.deb \
        -O data.tar.xz | tar -xJ -C "${pkgdir}" ./usr/share/

    msg2 'Copying menu and mimetype information'

    install -d "${pkgdir}"/usr/share/applications
    desktop_file="com.wolfram.Wolfram.${_pkgver}.desktop"
    _fix_dekstop_file "${installdir}/SystemFiles/Installation/$desktop_file"
    cp "${installdir}/SystemFiles/Installation/$desktop_file" "${pkgdir}"/usr/share/applications/

    install -d "${pkgdir}"/usr/share/desktop-directories
    cp "${installdir}"/SystemFiles/Installation/*.directory "${pkgdir}"/usr/share/desktop-directories/

    install -d "${pkgdir}"/usr/share/mime/packages
    cp "${installdir}"/SystemFiles/Installation/*.xml "${pkgdir}"/usr/share/mime/packages/

    msg2 'Copying icons'
    install -d "${pkgdir}"/usr/share/icons/hicolor/{32x32,64x64,128x128}/{apps,mimetypes}
    for i in 32 64 128; do
        cp "${installdir}/SystemFiles/FrontEnd/SystemResources/X/App-${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-wolfram-${_pkgver}.png"

        for mimetype in $(find . -name 'vnd.*' | cut -d '-' -f1 | uniq); do
            mimetype="$(basename "$mimetype")"
            cp "${installdir}/SystemFiles/FrontEnd/SystemResources/X/${mimetype}-${i}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-${mimetype}.png"
        done
    done

    msg2 'Copying man pages'
    install -d "${pkgdir}"/usr/share/man/man1
    cp "${installdir}"/SystemFiles/SystemDocumentation/Unix/*.1 "${pkgdir}"/usr/share/man/man1

    msg2 'Copying license'
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${installdir}"/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    _fix_binary_symlinks # namcap rule: symlink
    _fix_insecure_runpath # namcap rule: rpath, runpath
    _fix_permissions # namcap rule: permissions
}

_fix_dekstop_file() {
    # invalid version
    sed -Ei 's|Version=2.0|Version=1.5|g' "$1"
    # wrong path
    sed -Ei 's|^(\s*TryExec=).*$|\1/usr/bin/WolframNB|g' "$1"
    sed -Ei "s|^(\s*Exec=).*$|\1/usr/bin/WolframNB --name com.wolfram.Wolfram.${_pkgver} %F|g" "$1"
    # missing sections
    cat >> "$1" <<EOF
GenericName=Mathematical Software
Keywords=Wolfram;Mathematica;Symbolic;Computation;Programming;Simulation;Data Analysis;Visualization;Algebra;Calculus;Graphing;
Categories=Science;Education;Languages;ArtificialIntelligence;Astronomy;Biology;Chemistry;ComputerScience;DataVisualization;Geography;ImageProcessing;Math;NumericalAnalysis;MedicalSoftware;Physics;ParallelComputer;
EOF
}

_fix_binary_symlinks() {
    msg2 'Fixing symbolic links'
    relative_installdir="$(realpath --relative-to="${pkgdir}/usr/bin" "${installdir}")"

    ln -sf '../SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript' "${installdir}/Executables/"
    ln -sf "${relative_installdir}"/Executables/math "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/Executables/MathKernel "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/Executables/mcc "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/Executables/wolfram "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/Executables/wolframnb "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/Executables/WolframKernel "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/Executables/WolframNB "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/SystemFiles/Kernel/Binaries/Linux-x86-64/ELProver "${pkgdir}"/usr/bin/
    ln -sf "${relative_installdir}"/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript "${pkgdir}"/usr/bin/
}

_fix_insecure_runpath() {
    msg2 'Fixing insecure RPATH and RUNPATH on ELF files'

    cat "${srcdir}/insecure-runpath.list" | while read elffile; do
        # remove all RPATHs and RUNPATHs that aren't realtive to $ORIGIN
        safe_runpath="$(chrpath -l "${installdir}/${elffile}" |\
            sed -E 's/.*\bR(UN)?PATH=(.*)/\2/g' |\
            tr ':' '\n' | grep -E '^\$ORIGIN' | paste -sd ':')"

        if [ -z "$safe_runpath" ]; then
            chrpath -d "${installdir}/${elffile}"
        else
            chrpath -r "$safe_runpath" "${installdir}/${elffile}"
        fi
    done
}

_fix_permissions() {
    msg2 'Fixing file permissions'
    chmod go-w -R "${pkgdir}"/*
}
