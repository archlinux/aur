# Maintainer: Joshua Ellis <josh@jpellis.me>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: kjslag <kjslag at gmail dot com>
# Contributor: teratomata <teratomat@gmail.com>
# Contributor: Maxim Mikityanskiy <maxtram95@gmail.com>

pkgname=mathematica
pkgdesc='Computational software for mathematics, with offline documentation bundled'
pkgver=15
IFS=. read -r _major _minor _patch <<< "${pkgver}"
_pkgver=${_major}.${_minor:-0}
pkgrel=1
url='http://www.wolfram.com/mathematica/'
arch=(x86_64)
license=('LicenseRef-Wolfram-Mathematica-License-Agreement') # https://www.wolfram.com/legal/agreements/wolfram-mathematica/
makedepends=('curl' 'rsync' 'inetutils')
depends=(
  'alsa-lib'
  'bash'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxkbcommon'
  'nss'
  'qt6-base'
  'zstd'
)
optdepends=(
  'qt6-wayland: full Wayland support'
  'openssl-1.1: MQTTLink and Kerberos integration'
  'libxinerama: required by FFmpegTools'
  'ffmpeg4.4: alternative FFmpegTools backend'
  'libxtst: X11 backend for Java AWT libraries'
  'ttf-dejavu: correct fonts for Greek characters and inline TeX'
  'libcups: printer support'
)
# Source URL has an unstable signature parameter when not logged in, like with curl or wget.
# E.g.: <a href="https://account.wolfram.com/dl/WolframApp?version=14.3&platform=Linux&downloadManager=false&signature=09d7f5...">
_source_url="$(
  # shellcheck disable=SC2312
  curl -s https://www.wolfram.com/download-center/ \
    | grep 'account.wolfram.com/dl/WolframApp' \
    | grep -E "version=${_pkgver}\b" \
    | grep 'platform=Linux' \
    | grep -v 'includesDocumentation=false' \
    | sed -E 's/.*href="([^"]+)".*/\1/' \
    | uniq
)"
source=("Wolfram_${pkgver}_LIN_Bndl.sh::${_source_url}"
        'wolfram-remove-xdg-scripts.patch')
sha256sums=('e46ba53f714cee9fd104a26c915cf2c0f189312f7418d013a5ccdc71e2a650aa'
            '1ea85d8df27e875e8073832ff3a25c7594eeacc7d83add6b8fa8c4462e38a5fe')
## Symbol searching and stripping takes a long time, so they are disabled by default.
## Also, `debug` won't be of too much help here, since this is a binary distribution.
## Here's a quick comparison on my machine:
## | Build options   | Build time | Package Size (Zstd) | Uncompressed Size |
## | :-------------- | ---------: | ------------------: | ----------------: |
## | (!strip !debug) |   176.38 s |            8051 MiB |         20282 MiB |
## | (!strip debug)  |   324.13 s |            8051 MiB |         20282 MiB |
## | (strip !debug)  |   801.52 s |            7815 MiB |         19339 MiB |
options=(!strip !debug)

## To build this package you might need to place the mathematica-installer into
## your startdir If you don't own the installer you can download a trial version
## at http://www.wolfram.com/mathematica/trial

## The documentation takes up the majority of the disk space.  If you do not wish
## to keep it, uncomment the relevant lines at the bottom of this PKGBUILD, or
## install https://aur.archlinux.org/packages/mathematica-light.

## Package compression can be disabled if it won't be kept, but keep in mind that
## CPU operations are much faster than disk, so compressing with the default zstd
## options will probably be just as fast or faster than writing the whole .pkg.tar.
## Here's a comparison on my machine:
## | PKGEXT       | Build time | Package size |
## | :----------- | ---------: | -----------: |
## | .pkg.tar     |   173.78 s |    20341 MiB |
## | .pkg.tar.lz4 |   175.97 s |    12932 MiB |
## | .pkg.tar.zst |   173.85 s |     8052 MiB |
## | .pkg.tar.xz  |   507.60 s |     7091 MiB |
# PKGEXT='.pkg.tar'

## Here you can change the installation directory. The default is '/opt/Mathematica'.
_installdir='/opt/Mathematica'

prepare() {
  warning "Mathematica takes around 29 GiB of space with 'makepkg'."
  warning 'Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work.'

  if [[ ${PWD} =~ [[:space:]] ]]; then
    error "ERROR: The Mathematica installer doesn't support directory names with spaces."
    warning "Current build directory: ${PWD}"
    exit 1
  fi

  msg2 'Extracting Mathematica installer...'
  bash "Wolfram_${pkgver}_LIN_Bndl.sh" --keep --target bundle -- -noexec

  patch -t -d bundle/ -Np1 < wolfram-remove-xdg-scripts.patch
}

package() {
  local installdir desktop_file i mimetype
  installdir="$(realpath -m "${pkgdir}/${_installdir}")"

  msg2 'Running Mathematica installer'
  # https://reference.wolfram.com/language/tutorial/InstallingWolfram.html#650929293
  bash bundle/Unix/Installer/WolframInstaller \
    -execdir="${pkgdir}/usr/bin" \
    -targetdir="${installdir}" \
    -auto

  # Install documentation
  bash bundle/Unix/.bundle/Unix/Installer/MathInstaller \
    -targetdir="${pkgdir}/tmp" \
    -auto

  cd "${installdir}"
  rsync -a --remove-source-files "${pkgdir}/tmp/Documentation/English" Documentation/
  rm -rf "${pkgdir}/tmp/"

  if [[ -s InstallErrors ]]; then
    warning 'Review installation errors:'
    cat InstallErrors
  fi
  rm -f InstallErrors

  msg2 'Setting up WolframScript'
  # shellcheck disable=SC2312
  ar -p SystemFiles/Installation/wolframscript_*_amd64.deb \
    -O data.tar.xz | tar -xJ -C "${pkgdir}" ./usr/share/

  msg2 'Copying menu and MIME type information'

  desktop_file="com.wolfram.Wolfram.${_pkgver}.desktop"
  install -vD -t "${pkgdir}/usr/share/applications/" \
    -m644 "SystemFiles/Installation/${desktop_file}"
  install -vD -t "${pkgdir}/usr/share/desktop-directories/" \
    -m644 SystemFiles/Installation/wolfram-wolfram.directory
  install -vD -t "${pkgdir}/usr/share/mime/packages/" \
    -m644 SystemFiles/Installation/*.xml
  rm -r SystemFiles/Installation/

  _fix_desktop_file "${pkgdir}/usr/share/applications/${desktop_file}"
  _fix_desktop_file "${pkgdir}/usr/share/desktop-directories/wolfram-wolfram.directory"

  msg2 'Copying icons'
  for i in 32 64 128; do
    install -vD -m644 "SystemFiles/FrontEnd/SystemResources/X/App-${i}.png" \
      -T "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-wolfram-${_pkgver}.png"

    # shellcheck disable=SC2312
    for mimetype in $(find . -name 'vnd.*' | cut -d '-' -f1 | uniq); do
      mimetype="$(basename "${mimetype}")"
      install -vD -m644 "SystemFiles/FrontEnd/SystemResources/X/${mimetype}-${i}.png" \
        -T "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-${mimetype}.png"
    done
  done

  msg2 'Copying man pages'
  install -vD -t "${pkgdir}/usr/share/man/man1/" \
    -m644 SystemFiles/SystemDocumentation/Unix/*.1

  msg2 'Copying license'
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    -m644 LICENSE.txt

  _fix_binary_symlinks # namcap rule: symlink
  _fix_permissions # namcap rule: permissions
}

_fix_desktop_file() {
  # Wolfram declares an invalid "Version=2.0". Most DEs just ignore it, but best to remove it.
  sed -i -E '/^\s*Version\s*=.*$/d' "$1"
  # encoding is outdated
  sed -i -E '/^\s*Encoding\s*=.*$/d' "$1"
  # executable path contains BUILDDIR
  sed -i -E 's|^\s*TryExec\s*=.*$|TryExec=/usr/bin/WolframNB|g' "$1"
  sed -i -E "s|^\s*Exec\s*=.*$|Exec=/usr/bin/WolframNB --name com.wolfram.Wolfram.${_pkgver} %F|g" "$1"
  # optional sections for desktop entry: https://specifications.freedesktop.org/desktop-entry/latest/recognized-keys.html
  if [[ "$1" = *".desktop" ]]; then
    cat >> "$1" << EOF
GenericName=Mathematical Software
Keywords=Wolfram;Mathematica;Symbolic;Computation;Programming;Simulation;Data Analysis;Visualization;Algebra;Calculus;Graphing;
Categories=Science;Math;ComputerScience;DataVisualization;NumericalAnalysis;ArtificialIntelligence;Physics;ParallelComputing;
EOF
  fi
  # checked with desktop-file-validate
}

_fix_binary_symlinks() {
  msg2 'Fixing symbolic links'

  ln -v -ft Executables/ -sr SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript
  ln -v -ft "${pkgdir}/usr/bin/" -sr \
    Executables/math \
    Executables/MathKernel \
    Executables/mcc \
    Executables/wolfram \
    Executables/wolframnb \
    Executables/WolframKernel \
    Executables/WolframNB \
    SystemFiles/Kernel/Binaries/Linux-x86-64/ELProver \
    SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript
}

_fix_permissions() {
  msg2 'Fixing file permissions'
  chmod -c go-w -R "${pkgdir}"
}
