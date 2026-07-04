# Maintainer: Joshua Ellis <josh@jpellis.me>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: kjslag <kjslag at gmail dot com>
# Contributor: teratomata <teratomat@gmail.com>
# Contributor: Maxim Mikityanskiy <maxtram95@gmail.com>

pkgname=mathematica-light
pkgver=15
IFS=. read -r _major _minor _patch <<< "${pkgver}"
_pkgver=${_major}.${_minor:-0}
pkgrel=1
pkgdesc='Computational software for mathematics, science, and engineering, with online-only documentation.'
provides=('mathematica')
conflicts=('mathematica')
arch=('x86_64')
url='http://www.wolfram.com/mathematica/'
license=('LicenseRef-Wolfram-Mathematica-License-Agreement') # https://www.wolfram.com/legal/agreements/wolfram-mathematica/
makedepends=('curl' 'inetutils')
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
# E.g.: <a href="https://account.wolfram.com/dl/WolframApp?version=14.3&platform=Linux&downloadManager=false&includesDocumentation=false&signature=09d7f5...">
_source_url="$(
  # shellcheck disable=SC2312
  curl -s 'https://www.wolfram.com/download-center/' \
    | grep 'account.wolfram.com/dl/WolframApp' \
    | grep -E "version=${_pkgver}\b" \
    | grep 'platform=Linux' \
    | grep 'includesDocumentation=false' \
    | sed -E 's/.*href="([^"]+)".*/\1/' \
    | uniq
)"
source=("Wolfram_${pkgver}_LIN.sh::${_source_url}"
        'wolfram-remove-xdg-scripts.patch')
sha256sums=('df11164827b883cbad26b7bb87aa6bdee00387456b0cdfa087861eede444c8bc'
            '1ea85d8df27e875e8073832ff3a25c7594eeacc7d83add6b8fa8c4462e38a5fe')
## Symbol searching and stripping takes a long time, so they are disabled by default.
## Also, `debug` won't be of too much help here, since this is a binary distribution.
## Here's a quick comparison on my machine:
## | Build options   | Build time | Package Size (Zstd) | Uncompressed Size |
## | :-------------- | ---------: | ------------------: | ----------------: |
## | (!strip !debug) |    58.30 s |            2977 MiB |          8754 MiB |
## | (!strip debug)  |   167.46 s |            2977 MiB |          8754 MiB |
## | (strip !debug)  |   414.44 s |            2740 MiB |          7811 MiB |
options=(!strip !debug)

## To build this package you might need to place the mathematica-installer into
## your startdir If you don't own the installer you can download a trial version
## at http://www.wolfram.com/mathematica/trial

## Here you can change the installation directory. The default is '/opt/Mathematica'.
_installdir='/opt/Mathematica'

prepare() {
  warning "Mathematica (Light) takes around 11 GiB of space with 'makepkg'."
  warning 'Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work.'

  if [[ $(echo "${srcdir}" | wc -w || true) -ne 1 ]]; then
    error "ERROR: The Mathematica installer doesn't support directory names with spaces."
    warning "Current build directory: ${srcdir}"
    exit 1
  fi

  msg2 'Extracting Mathematica installer...'
  bash "${srcdir}/Wolfram_${pkgver}_LIN.sh" \
    --keep \
    --target "${srcdir}/bundle" \
    -- \
    -noexec

  patch -p1 -d "${srcdir}"/bundle < "${srcdir}"/wolfram-remove-xdg-scripts.patch
}

package() {
  local installdir desktop_file i mimetype
  installdir="$(realpath -m "${pkgdir}/${_installdir}")"

  msg2 'Running Mathematica installer'
  # https://reference.wolfram.com/language/tutorial/InstallingWolfram.html#650929293
  bash "${srcdir}/bundle/Unix/Installer/WolframInstaller" \
    -execdir="${pkgdir}/usr/bin" \
    -targetdir="${installdir}" \
    -auto

  if [[ -s "${installdir}"/InstallErrors ]]; then
    warning 'Review installation errors:'
    cat "${installdir}"/InstallErrors
  fi
  rm -f "${installdir}"/InstallErrors

  msg2 'Setting up WolframScript'
  # shellcheck disable=SC2312
  ar -p "${installdir}"/SystemFiles/Installation/wolframscript_*_amd64.deb \
    -O data.tar.xz | tar -xJ -C "${pkgdir}" ./usr/share/

  msg2 'Copying menu and MIME type information'

  desktop_file="com.wolfram.Wolfram.${_pkgver}.desktop"
  install -D -m644 "${installdir}/SystemFiles/Installation/${desktop_file}" -t "${pkgdir}"/usr/share/applications/
  install -D -m644 "${installdir}"/SystemFiles/Installation/wolfram-wolfram.directory -t "${pkgdir}"/usr/share/desktop-directories
  install -D -m644 "${installdir}"/SystemFiles/Installation/*.xml -t "${pkgdir}"/usr/share/mime/packages
  rm -r "${installdir}"/SystemFiles/Installation

  _fix_desktop_file "${pkgdir}/usr/share/applications/${desktop_file}"
  _fix_desktop_file "${pkgdir}"/usr/share/desktop-directories/wolfram-wolfram.directory

  msg2 'Copying icons'
  for i in 32 64 128; do
    install -D -m644 "${installdir}/SystemFiles/FrontEnd/SystemResources/X/App-${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-wolfram-${_pkgver}.png"

    # shellcheck disable=SC2312
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

_fix_desktop_file() {
  # Wolfram declares an invalid "Version=2.0". Most DEs just ignore it, but best to remove it.
  sed -E -i '/^\s*Version\s*=.*$/d' "$1"
  # encoding is outdated
  sed -E -i '/^\s*Encoding\s*=.*$/d' "$1"
  # executable path contains BUILDDIR
  sed -E -i 's|^\s*TryExec\s*=.*$|TryExec=/usr/bin/WolframNB|g' "$1"
  sed -E -i "s|^\s*Exec\s*=.*$|Exec=/usr/bin/WolframNB --name com.wolfram.Wolfram.${_pkgver} %F|g" "$1"
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
  local relative_installdir
  relative_installdir="$(realpath --relative-to="${pkgdir}/usr/bin" "${installdir}")"

  ln -sf ../SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript "${installdir}/Executables/"
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
