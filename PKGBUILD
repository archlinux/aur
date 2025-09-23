# Maintainer: harrietobrien <harrietobrien@protonmail.com>
pkgname=vmd-bin-alpha
pkgver=2.0.0a7
pkgrel=2
pkgdesc="VMD 2.0.0 alpha (prebuilt binary) – Visual Molecular Dynamics"
arch=('x86_64')
url="https://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
provides=('vmd')
conflicts=('vmd')
depends=(
  'glibc'
  'gcc-libs'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxinerama'
  'libxfixes'
  'libglvnd'
  'glu'
  'fltk'
  'tcl'
  'tk'
  'zlib'
  'libjpeg-turbo'
)
source=(
  "vmd-${pkgver}.tar.gz::https://www.ks.uiuc.edu/Research/vmd/alpha/${provides}-${pkgver}.bin.LINUXAMD64.tar.gz"
)
sha256sums=('50cd6ff97ad69d2c9a33e07e44e6bd78687fd5d2016afeb45bffc19e631ee078')

# install under /opt to keep bundled libs/plugins intact
_vmddir="vmd-${pkgver}"

package() {
  cd "${srcdir}"

  # find extracted top-level dir (VMD archives may/may not include)
  shopt -s nullglob dotglob
  local roots=(*/)
  local srcroot="."
  if (( ${#roots[@]} == 1 )); then
    srcroot="${roots[0]%/}"
  fi

  install -d "${pkgdir}/opt/${_vmddir}"
  # copy everything exactly as shipped
  cp -a "${srcroot}/." "${pkgdir}/opt/${_vmddir}/"

  # determine where the vmd launcher lives
  local bindir="/opt/${_vmddir}"
  if [[ -x "${pkgdir}/opt/${_vmddir}/bin/vmd" ]]; then
    bindir="/opt/${_vmddir}/bin"
  elif [[ ! -x "${pkgdir}/opt/${_vmddir}/vmd" ]]; then
    # Heuristic fallback
    local cand
    cand="$(find "${pkgdir}/opt/${_vmddir}" -maxdepth 2 -type f -name vmd -perm -111 | head -n1 || true)"
    if [[ -n "$cand" ]]; then
      bindir="${cand#"${pkgdir}"}"
      bindir="$(dirname "$bindir")"
    fi
  fi

  # wrapper so VMD runs with its own directory as CWD
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/vmd" <<EOF
#!/usr/bin/env bash
set -euo pipefail
cd "${bindir}"
exec ./vmd "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/vmd"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/vmd.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=VMD (alpha)
GenericName=Visual Molecular Dynamics
Comment=View and analyze molecular systems in 3D
Exec=vmd
Terminal=false
Categories=Science;Education;Chemistry;Graphics;3DGraphics;
EOF

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  for f in LICENSE License LICENSE.txt doc/License doc/license.txt README*; do
    if [[ -f "${pkgdir}/opt/${_vmddir}/${f}" ]]; then
      install -m644 "${pkgdir}/opt/${_vmddir}/${f}" "${pkgdir}/usr/share/licenses/${pkgname}/"
      break
    fi
  done

  # ensure executables have exec perms (some archives ship correctly, but just in case)
  find "${pkgdir}/opt/${_vmddir}" -type f -name 'vmd' -exec chmod 755 {} +
  find "${pkgdir}/opt/${_vmddir}" -type f -name '*.so' -exec chmod 755 {} + 2>/dev/null || true
}

