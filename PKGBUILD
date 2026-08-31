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
pkgver=15.0.1
IFS=. read -r _major _minor _patch <<< "${pkgver}"
_minor=${_minor:-0}
pkgrel=1
url='https://www.wolfram.com/mathematica/'
arch=(x86_64)
license=('LicenseRef-Wolfram-Mathematica-License-Agreement') # https://www.wolfram.com/legal/agreements/wolfram-mathematica/
makedepends=('curl' 'inetutils')
optdepends=(
  'qt6-wayland: full Wayland support'
  'openssl-1.1: MQTTLink and Kerberos integration'
  'libxinerama: required by FFmpegTools'
  'ffmpeg4.4: alternative FFmpegTools backend'
  'libxtst: X11 backend for Java AWT libraries'
  'ttf-dejavu: correct fonts for Greek characters and inline TeX'
  'libcups: printer support'
)
_source_url='https://account.wolfram.com/dl/WolframApp'
# Source URL has a dynamic signature parameter that allows downloads without logging in. You can
# skip fetching this value if you already have the installer by setting SKIP_DYNAMIC_SIGNATURE=1.
# Signatures are updated hourly, so we hide them by default in .SCRINFO and the AUR page.
if [[ ${SKIP_DYNAMIC_SIGNATURE:-${PRINTSRCINFO}} != 1 ]]; then
  _dynamic_signature=$(
    set -o pipefail
    curl -fsSL https://www.wolfram.com/download-center/ \
      | grep -oP "\bhref=\"${_source_url/./\.}\?[^\"]+\K&signature=[a-zA-Z0-9]+(?=\"|&)" \
      | uniq
  )
fi
source=("Wolfram_${pkgver}.sh::${_source_url}?version=${_major}.${_minor}${_patch/#?/.&}&platform=Linux&downloadManager=false${_dynamic_signature}"
        'wolfram-remove-xdg-scripts.patch')
sha256sums=('5732bc0ae3a1938b0e3b908be33deb7e9639eb7d45d9137a7340e1f1c13179e8'
            '33e38c84a47588bf05cee713c9cd5bb3534c0866a73f48c277cfa178da3aa535')
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
## at https://www.wolfram.com/mathematica/trial

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
  local available_space
  available_space=$(df --output=avail -BG .)
  available_space=$(tail -n 1 <<< "${available_space}")

  if [[ ${available_space/%G/} -lt 32 ]]; then
    warning "Mathematica takes around 29 GiB of space with 'makepkg'."
    warning 'Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work.'
  fi

  if [[ ${PWD} =~ [[:space:]] ]]; then
    error "ERROR: The Mathematica installer doesn't support directory names with spaces."
    warning "Current build directory: ${PWD}"
    exit 1
  fi

  msg2 'Extracting Mathematica installer...'
  bash "Wolfram_${pkgver}.sh" --keep --target bundle -- -noexec

  patch -t -d bundle/ -Np1 < wolfram-remove-xdg-scripts.patch
}

package() {
  depends=(
    'alsa-lib'
    'bash'
    'fontconfig'
    'freetype2'
    'glibc'
    'hicolor-icon-theme'
    'libquadmath'
    'libstdc++'
    'libx11'
    'libxkbcommon'
    'nss'
    'qt6-base'
    'zstd'
  )

  local installdir
  installdir=$(realpath -m "${pkgdir}/${_installdir}")

  msg2 'Running Mathematica installer'
  # https://reference.wolfram.com/language/tutorial/InstallingWolfram.html#650929293
  bash bundle/Unix/Installer/WolframInstaller \
    -execdir="${pkgdir}/usr/bin" \
    -targetdir="${installdir}" \
    -auto
  rm bundle/Unix/Installer/WolframInstaller

  # Install documentation
  bash bundle/Unix/.bundle/Unix/Installer/MathInstaller \
    -targetdir=tmp \
    -auto
  rm -rf bundle

  cd tmp
  find Documentation/English -type d -exec mkdir -p -m755 "${installdir}/{}" \;
  find Documentation/English -type f -exec mv -f --no-copy {} -T "${installdir}/{}" \;

  cd "${installdir}"
  if [[ -s InstallErrors ]]; then
    warning 'Review installation errors:'
    cat InstallErrors
  fi
  rm -vf InstallErrors

  msg2 'Setting up WolframScript'
  # shellcheck disable=SC2312
  ar -p SystemFiles/Installation/wolframscript_*_amd64.deb \
    -O data.tar.xz | tar -xvJ -C "${pkgdir}" ./usr/share/

  msg2 'Copying menu and MIME type information'

  install -vD -t "${pkgdir}/usr/share/applications/" \
    -m644 "SystemFiles/Installation/com.wolfram.Wolfram.${_major}.${_minor}.desktop"
  install -vD -t "${pkgdir}/usr/share/desktop-directories/" \
    -m644 SystemFiles/Installation/wolfram-wolfram.directory
  install -vD -t "${pkgdir}/usr/share/mime/packages/" \
    -m644 SystemFiles/Installation/*.xml
  rm -vr SystemFiles/Installation/

  _fix_desktop_file "${pkgdir}/usr/share/applications/com.wolfram.Wolfram.${_major}.${_minor}.desktop"
  _fix_desktop_file "${pkgdir}/usr/share/desktop-directories/wolfram-wolfram.directory"

  msg2 'Copying icons'

  # Read MIME types from XML declarations: <mime-type ... type="...">
  local -a mimetypes
  mapfile -t mimetypes < <(
    # shellcheck disable=SC2312
    sed -nE '/<mime-type\b/,/>/ s/.*\btype="([^"]+)".*/\1/ p' \
      "${pkgdir}/usr/share/mime/packages/"*.xml
  )

  local i mimetype icon
  for i in 32 64 128; do
    install -vD -m644 "SystemFiles/FrontEnd/SystemResources/X/App-${i}.png" \
      -T "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-wolfram-${_major}.${_minor}.png"

    for mimetype in "${mimetypes[@]}"; do
      icon="SystemFiles/FrontEnd/SystemResources/X/$(basename "${mimetype}")-${i}.png"
      if [[ -f ${icon} ]]; then
        install -vD -m644 "${icon}" \
          -T "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/${mimetype//\//-}.png"
      fi
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
  sed -i -E "
    # Wolfram declares an invalid 'Version=2.0'. Most DEs just ignore it, but best to remove it.
    /^Version=/ d
    # encoding is outdated
    /^Encoding=/ d
    # executable path contains BUILDDIR
    /^TryExec=/ s|=.*|=/usr/bin/WolframNB|
    /^Exec=/ s|=.*|=/usr/bin/WolframNB --name com.wolfram.Wolfram.${_major}.${_minor} %F|
    # optional sections for desktop entry: https://specifications.freedesktop.org/desktop-entry/latest/recognized-keys.html
    /^Type=Application\$/,\$ {
      /^Comment=/ a GenericName=Mathematical Software
      \$ a Keywords=Wolfram;Mathematica;Symbolic;Computation;Programming;Simulation;Data Analysis;Visualization;Algebra;Calculus;Graphing;
      \$ a Categories=Science;Math;ComputerScience;DataVisualization;NumericalAnalysis;ArtificialIntelligence;Physics;ParallelComputing;
    }
    # checked with desktop-file-validate
  " "$1"
}

_fix_binary_symlinks() {
  msg2 'Fixing symbolic links'

  ln -v -ft Executables/ -sr SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript
  ln -v -ft "${pkgdir}/usr/bin/" -sr \
    Executables/math \
    Executables/MathKernel \
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
