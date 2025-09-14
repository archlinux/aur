# Maintainer: Aeonik Chaos
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Scott Tincman <sctincman at gmail dot com>

_pkgname=nwchem
pkgname="${_pkgname}-git"
pkgver=r30696.39ce3184b2
pkgrel=1
pkgdesc="Ab initio computational chemistry software (NWChem 7.2 hotfix branch)"
arch=('x86_64')
url="https://nwchemgit.github.io/"
license=('custom:ECL')
depends=('openmpi' 'openblas' 'python')        # use system OpenBLAS (LP64)
makedepends=('git' 'gcc' 'gcc-fortran' 'bash') # subversion not needed now
conflicts=("${_pkgname}" "${_pkgname}-data")
provides=("${_pkgname}")
install=nwchem.install

source=(
  "nwchem-7.2.3t::git+https://github.com/nwchemgit/nwchem.git#branch=hotfix/release-7-2-0"
  "config.sh"
  "nwchemrc"
)
sha256sums=('SKIP'
  '200ccb7c39c55cb3fa04b17063b31138d3f434b424f712983892ddce046bb1bc'
  'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f')

_srcdir="nwchem-7.2.3t"

pkgver() {
  cd "${srcdir}/${_srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcdir}"

  # NWChem env
  export NWCHEM_TOP="${PWD}"
  export NWCHEM_TARGET=LINUX64
  export NWCHEM_MODULES="all python"

  # MPI
  export USE_MPI=y
  export USE_MPIF=y
  export USE_MPIF4=y
  export ARMCI_NETWORK=MPI-PR # good default with OpenMPI

  # Python (Arch is usually 3.12+; NWChem wants MAJOR.MINOR)
  export PYTHONVERSION="$(python -c 'import sys;print(f"{sys.version_info[0]}.{sys.version_info[1]}")')"

  # BLAS/LAPACK (LP64) — system OpenBLAS, 64->32 shim
  export USE_64TO32=y
  export BLAS_SIZE=4
  export BLASOPT="-lopenblas"
  export LAPACK_LIB="${BLASOPT}"

  # Honor any user overrides in config.sh (optional)
  [[ -f "${srcdir}/config.sh" ]] && source "${srcdir}/config.sh"

  # Configure & build
  cd src
  make nwchem_config
  make 64_to_32
  make
}

package() {
  cd "${srcdir}/${_srcdir}"
  local TARGET=LINUX64

  install -d -m 755 "${pkgdir}/usr/bin"
  install -m 755 "bin/${TARGET}/nwchem" "${pkgdir}/usr/bin/"

  install -d -m 755 "${pkgdir}/usr/share/nwchem/"
  cp -r src/basis/libraries "${pkgdir}/usr/share/nwchem/"
  cp -r src/data "${pkgdir}/usr/share/nwchem/"

  install -d -m 755 "${pkgdir}/usr/share/nwchem/libraryps"
  cp -r src/nwpw/libraryps/{development_psps,HGH_LDA,library1,library2,ofpw_default,paw_default,pspw_default,pspw_new,pspw_old,Spin_Orbit,TETER,TM} \
    "${pkgdir}/usr/share/nwchem/libraryps"

  chmod -R go=rX "${pkgdir}/usr/share/nwchem/"
  chmod -R u=wrX "${pkgdir}/usr/share/nwchem/"

  install -d -m 755 "${pkgdir}/etc/skel/"
  install -m 644 "${srcdir}/nwchemrc" "${pkgdir}/etc/skel/.nwchemrc"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m 0644 "LICENSE.TXT" "${pkgdir}/usr/share/licenses/${_pkgname}/"
}

check() {
  cd "${srcdir}/${_srcdir}"
  export NWCHEM_TARGET=LINUX64
  [[ -d QA ]] && (cd QA && bash doqmtests_bash || true)
}
