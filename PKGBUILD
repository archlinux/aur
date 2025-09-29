# Maintainer: Joshua Ellis <josh@jpellis.me>
# Contributor: Tiago "marmis" de Paula <tiagodepalves@gmail.com>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: kjslag <kjslag at gmail dot com>
# Contributor: teratomata <teratomat@gmail.com>
# Contributor: Maxim Mikityanskiy <maxtram95@gmail.com>

pkgname=mathematica-light
pkgver=14.3.0
_pkgver=${pkgver%.[0-9]}
pkgrel=1
pkgdesc="Computational software for mathematics, science, and engineering, with online-only documentation."
provides=('mathematica')
conflicts=('mathematica')
arch=('x86_64')
url="http://www.wolfram.com/mathematica/"
license=(LicenseRef-WolframMathematicaLicenseAgreement) # https://www.wolfram.com/legal/agreements/wolfram-mathematica/
makedepends=('curl' 'inetutils')
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
    # shellcheck disable=SC2312 # a failure will be visible in `source`
    curl -s 'https://www.wolfram.com/download-center/' \
    | grep 'account.wolfram.com/dl/WolframApp' \
    | grep -E "version=${_pkgver}\b" \
    | grep 'platform=Linux' \
    | grep 'includesDocumentation=false' \
    | sed -E 's/.*href="([^"]+)".*/\1/' \
    | uniq
)
source=(
    "Wolfram_${pkgver}_LIN.sh::${_source_url}"
    "remove-xdg-scripts.patch"
)
sha256sums=('178465e31cf7beca3e37ffd4cfb657be1e42accea7b0a310c6b451d75a3f68d0'
            '20ba959296d418c8b00381da5abd87dc935633d44134a35e7961356bfef6a5f0')
## Symbol searching and stripping takes a long time, so they are disabled by default.
## Also, `debug` won't find any source files here, since this is a binary distribution.
## Here's a quick comparison on my machine:
## | Build options   | Build time | Package Size (Zstd) | Uncompressed Size |
## | :-------------- | ---------: | ------------------: | ----------------: |
## | (!strip !debug) |    45.12 s |            2853 MiB |          8855 MiB |
## | (!strip debug)  |   169.80 s |            2853 MiB |          8855 MiB |
## | (strip !debug)  |   200.99 s |            2628 MiB |          7955 MiB |
options=(!strip !debug)

## To build this package you might need to place the mathematica-installer into
## your startdir If you don't own the installer you can download a trial version
## at http://www.wolfram.com/mathematica/trial

## Here you can change the installation directory. The default is '/opt/Mathematica'.
_installdir='/opt/Mathematica'

prepare() {
    warning "Building Mathematica (Light) takes around 10GiB of space for 'makepkg'."
    warning 'Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work.'

    # shellcheck disable=SC2312 # echo won't trigger errors
    if [[ "$(echo "${srcdir}" | wc -w)" -ne 1 ]]; then
        msg2 "ERROR: The Mathematica installer doesn't support directory names with spaces."
        msg2 "Current build directory: ${srcdir}"
        exit 1
    fi

    msg2 'Extracting Mathematica installer...'
    bash "${srcdir}/Wolfram_${pkgver}_LIN.sh" \
      --keep \
      --target "${srcdir}/bundle" \
      -- \
      -noexec

    patch -p1 -d "${srcdir}"/bundle < "${srcdir}"/remove-xdg-scripts.patch
}

package() {
    installdir="$(realpath -m "${pkgdir}/${_installdir}")"
    export installdir

    msg2 'Running Mathematica installer'
    # https://reference.wolfram.com/language/tutorial/InstallingWolfram.html#650929293
    bash "${srcdir}/bundle/Unix/Installer/WolframInstaller" \
        -execdir="${pkgdir}/usr/bin" \
        -targetdir="${installdir}" \
        -auto

    if [[ -s "${installdir}"/InstallErrors ]]; then
        msg2 "Review installation errors:"
        cat "${installdir}"/InstallErrors
    fi
    rm -f "${installdir}"/InstallErrors

    msg2 'Setting up WolframScript'
    install -d "${srcdir}"/WolframScript "${pkgdir}"/usr/share
    # shellcheck disable=SC2312 # a pipe here allows more efficient disk usage
    bsdtar -xf "${installdir}"/SystemFiles/Installation/wolframscript_*_amd64.deb \
        -O data.tar.xz | tar -xJ -C "${pkgdir}" ./usr/share/

    msg2 'Copying menu and mimetype information'

    install -d "${pkgdir}"/usr/share/applications
    desktop_file="com.wolfram.Wolfram.${_pkgver}.desktop"
    _fix_dekstop_file "${installdir}/SystemFiles/Installation/${desktop_file}"

    install -D -m644 "${installdir}/SystemFiles/Installation/${desktop_file}" -t "${pkgdir}"/usr/share/applications/
    install -D -m644 "${installdir}"/SystemFiles/Installation/*.directory -t "${pkgdir}"/usr/share/desktop-directories
    install -D -m644 "${installdir}"/SystemFiles/Installation/*.xml -t "${pkgdir}"/usr/share/mime/packages

    msg2 'Copying icons'
    for i in 32 64 128; do
        install -D -m644 "${installdir}/SystemFiles/FrontEnd/SystemResources/X/App-${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-wolfram-${_pkgver}.png"

        # shellcheck disable=SC2312 # the pipe works better with '\n'
        for mimetype in $(find . -name 'vnd.*' | cut -d '-' -f1 | uniq); do
            mimetype="$(basename "${mimetype}")"
            install -D -m644 "${installdir}/SystemFiles/FrontEnd/SystemResources/X/${mimetype}-${i}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-${mimetype}.png"
        done
    done

    msg2 'Copying man pages'
    install -D -m644 "${installdir}"/SystemFiles/SystemDocumentation/Unix/*.1 -t "${pkgdir}"/usr/share/man/man1

    msg2 'Copying license'
    install -D -m644 "${installdir}"/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

    _fix_binary_symlinks # namcap rule: symlink
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

_fix_permissions() {
    msg2 'Fixing file permissions'
    chmod go-w -R "${pkgdir}"/*
}
