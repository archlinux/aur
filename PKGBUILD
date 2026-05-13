# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=kicad-library-cern
pkgname="${_pkgname}-git"
pkgver=r40.20260513.980670f
pkgrel=1
pkgdesc="Electronics component libraries used at CERN for electronics design using KiCad, regularly converted from the original Altium
Designer source libraries at CERN's Electronics Design Office."
arch=('any')
url="https://gitlab.com/ohwr/cern-kicad-libs"
license=('CERN-OHL-P-2.0')
makedepends=('git')
optdepends=(
  'kicad>=9: To use this electronics component library.'
  "sh: To run helper script 'kicad-cern-register'."
)
options+=('!strip') # Otherwise, needlessly runs 'strip' which takes a lot of time.
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${_pkgname}.install"
source=(
  "${_pkgname}::git+${url}.git"
  "kicad-cern-register"
)
sha256sums=(
  'SKIP' # Upstream git source
  '4b77adb0da3b726fc89a04c63663f514dd6a4aa8901b792ed6007e9323c5943a' # kicad-cern-register
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "git commint count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  if [ ! -e sym-lib-table.bak ]; then
    printf '%s\n' "   > creating backup 'sym-lib-table' -> 'sym-lib-table.bak' ..."
    cp sym-lib-table sym-lib-table.bak
  fi
  if [ ! -e fp-lib-table.bak ]; then
    printf '%s\n' "   > creating backup 'fp-lib-table' -> 'fp-lib-table.bak' ..."
    cp fp-lib-table fp-lib-table.bak
  fi
  if [ ! -e CERN_Linux.kicad_dbl.bak ]; then
    printf '%s\n' "   > creating backup 'CERN_Linux.kicad_dbl' -> 'CERN_Linux.kicad_dbl.bak' ..."
    cp CERN_Linux.kicad_dbl CERN_Linux.kicad_dbl.bak
  fi

  printf '%s\n' "   > replacing '\${CERN_LIB_DIR}' -> '/usr/share/kicad/cern' in 'sym-lib-table' ..."
  sed -i -e 's|${CERN_LIB_DIR}|/usr/share/kicad/cern|g' -e 's|$CERN_LIB_DIR|/usr/share/kicad/cern|g' sym-lib-table

  printf '%s\n' "   > replacing '\${CERN_LIB_DIR}' -> '/usr/share/kicad/cern' in 'fp-lib-table' ..."
  sed -i -e 's|${CERN_LIB_DIR}|/usr/share/kicad/cern|g' -e 's|$CERN_LIB_DIR|/usr/share/kicad/cern|g' fp-lib-table

  printf '%s\n' "   > replacing '\${CWD}' -> '/usr/share/kicad/cern' in 'CERN_Linux.kicad_dbl' ..."
  sed -i -e 's|${CWD}|/usr/share/kicad/cern|g' -e 's|$CWD|/usr/share/kicad/cern|g' CERN_Linux.kicad_dbl

  printf '%s\n' "   > Removing '(hidden)' in 'sym-lib-table' ..."
  sed -i -E -e 's|\([[:space:]]*hidden[[:space:]]*\)||g' sym-lib-table

  printf '%s\n' "   > Removing '(hidden)' in 'fp-lib-table' ..."
  sed -i -E -e 's|\([[:space:]]*hidden[[:space:]]*\)||g' fp-lib-table
}

package() {
  cd "${srcdir}/${_pkgname}"

  local dest_base="${pkgdir}/usr/share/kicad/cern"

  install -Dvm644 CERN_Linux.kicad_dbl "${dest_base}"/CERN.kicad_dbl
  install -Dvm644 CERN.sqlite          "${dest_base}"/CERN.sqlite

  # Symbols
  install -dvm755 "${dest_base}"
  printf '%s\n' "> Copying 'SchLib' -> '${dest_base}/' ..."
  cp -r SchLib "${dest_base}"/
  install -Dvm644 -t "${dest_base}" sym-lib-table

  # Footprints (.pretty)
  install -dvm755 "${dest_base}"
  printf '%s\n' "> Copying 'PcbLib' -> '${dest_base}/' ..."
  cp -r PcbLib "${dest_base}"/
  install -Dvm644 -t "${dest_base}" fp-lib-table

  ## 3D models (.3dshapes)
  #install -dvm755 "${dest_base}"
  #printf '%s\n' "> Copying '3DLib' -> '${dest_base}/' ..."
  #cp -rv 3DLib "$dest_base"/
  #install -Dvm644 -t "${dest_base}" 3d-lib-table

  # Helper script
  install -Dvm755 -t "${pkgdir}/usr/bin" "${srcdir}/kicad-cern-register"

  # Documentation and license
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSES/*
}

