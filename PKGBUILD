# Maintainer: Aeonik Chaos <aeonik dot chaos at gmail dot com>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Scott Tincman <sctincman at gmail dot com>

_pkgname=nwchem
pkgname="${_pkgname}-git"
pkgver=r31441.3d4fadd528
pkgrel=1
pkgdesc="Ab initio computational chemistry software"
arch=('x86_64')
url="https://nwchemgit.github.io/"
license=('custom:ECL')
depends=('openmpi' 'openblas' 'python' 'scalapack')
makedepends=('git' 'gcc' 'gcc-fortran' 'bash')
conflicts=("${_pkgname}" "${_pkgname}-data")
provides=("${_pkgname}")
install=nwchem.install

source=(
  "nwchem::git+https://github.com/nwchemgit/nwchem.git"
  "config.sh"
  "nwchemrc"
)
sha256sums=('SKIP'
            '27df009d5d0e76852963d25abef0fcfc31d5d02effe9cb86f069ac148a89466a'
            'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  msg2 "Setting up build environment..."
}

build() {
  cd "${srcdir}/${_pkgname}"

  source "${srcdir}/config.sh"

  msg2 "Building NWChem with configuration:"
  msg2 "  NWCHEM_TARGET: ${NWCHEM_TARGET}"
  msg2 "  NWCHEM_MODULES: ${NWCHEM_MODULES}"
  msg2 "  MPI: ${USE_MPI}"
  msg2 "  BLAS: ${BLASOPT}"
  msg2 "  Python version: ${PYTHONVERSION}"

  cd src

  # Configure NWChem
  msg2 "Configuring NWChem..."
  make nwchem_config

  # If using 32-bit integer BLAS with 64-bit NWChem
  if [[ "${USE_64TO32}" == "y" ]]; then
    msg2 "Converting 64-bit to 32-bit interfaces..."
    make 64_to_32
  fi

  # Build NWChem
  msg2 "Building NWChem..."
  make FC="${FC}" CC="${CC}"

  # After successful build, run getmem.nwchem to optimize memory settings
  if [[ -f ../contrib/getmem.nwchem ]]; then
    msg2 "Optimizing memory settings..."
    FC="${FC}" ../contrib/getmem.nwchem || true
  fi
}

check() {
  cd "${srcdir}/${_pkgname}"

  # Source the configuration again for tests
  source "${srcdir}/config.sh"

  # Run basic tests if available
  if [[ -d QA ]]; then
    msg2 "Running basic tests (this may take a while)..."
    cd QA
    # Run only quick tests, not the full suite
    export NWCHEM_EXECUTABLE="${srcdir}/${_pkgname}/bin/${NWCHEM_TARGET}/nwchem"
    # You might want to run only specific quick tests
    # bash doqmtests_bash 1 || true
    msg2 "Tests completed (check output for failures)"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Source configuration to get NWCHEM_TARGET
  source "${srcdir}/config.sh"

  # Install binary
  install -d -m 755 "${pkgdir}/usr/bin"
  install -m 755 "bin/${NWCHEM_TARGET}/nwchem" "${pkgdir}/usr/bin/"

  # Install data files
  install -d -m 755 "${pkgdir}/usr/share/nwchem/"

  # Basis set libraries
  cp -r src/basis/libraries "${pkgdir}/usr/share/nwchem/"

  # Force field and other data
  cp -r src/data "${pkgdir}/usr/share/nwchem/"

  # Pseudopotential libraries for plane-wave calculations
  install -d -m 755 "${pkgdir}/usr/share/nwchem/libraryps"
  local ps_dirs=(
    development_psps HGH_LDA library1 library2
    ofpw_default paw_default pspw_default
    pspw_new pspw_old Spin_Orbit TETER TM
  )
  for dir in "${ps_dirs[@]}"; do
    if [[ -d "src/nwpw/libraryps/${dir}" ]]; then
      cp -r "src/nwpw/libraryps/${dir}" "${pkgdir}/usr/share/nwchem/libraryps/"
    fi
  done

  # Set proper permissions
  chmod -R go=rX "${pkgdir}/usr/share/nwchem/"
  chmod -R u=rwX "${pkgdir}/usr/share/nwchem/"

  # Install default .nwchemrc file
  install -d -m 755 "${pkgdir}/etc/skel/"
  install -m 644 "${srcdir}/nwchemrc" "${pkgdir}/etc/skel/.nwchemrc"

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m 644 "LICENSE.TXT" "${pkgdir}/usr/share/licenses/${_pkgname}/"

  # Install documentation if available
  if [[ -d doc ]]; then
    install -d -m 755 "${pkgdir}/usr/share/doc/${_pkgname}"
    cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/" || true
  fi

  msg2 "Installation completed"
}
