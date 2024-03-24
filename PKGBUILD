#!/bin/bash
# Above shabeng-line for automatic switch-on of syntax highlighing in some editors.

# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)


### Details of the build are controlled by environment variables.
# 
# The environment variables controlling the build are by now (2014-08-24):
# 
# _BUILD_DOC # Build documentation
# _WITH_PLAUT04 # Build plaut04
# _PLAUT04_WITH_QT # Build plaut04 with Qt (functionality is the same)
# _AUTO_DEBUG # Compile with debug options
# _WITH_OPENMP # Compile with OpenMPI
# _WITH_MPI # Compile with MPI
# 
# For using the environment variables controlling the build, also have a look at the sample script 'makepkg.sh' conbtained in the package.
# 
###

### Set defaults if not specified in the environment:

[ -n "${_BUILD_DOC}" ] || { # Building documentation can be controlled by environment variable.
  _BUILD_DOC=yes # Controls if we want to build the documentation. Set to 'yes' to build it (requires some LaTeX-tools to be installed).
}
[ -n "${_WITH_PLAUT04}" ] || { # Building plaut04 can be controlled by environment variable.
  _WITH_PLAUT04=yes # Controls if we want to build plaut04. This is here since on my machine it fails even with 'coin' and 'soqt' installed, so I can explicitly disable it (default is disabled). Set to 'yes' to enable.
}
[ -n "${_PLAUT04_WITH_QT}" ] || { # Controls if plaut04 (if built) is built using qt-libs ('soqt', in that case), or not ('soxt', then).
  _PLAUT04_WITH_QT=yes
}
[ -n "${_AUTO_DEBUG}" ] || { # Building with debugging options can be controlled by environment variable.
  _AUTO_DEBUG=no # Controls if we want to build with debugging information. It will affect both the precompiled AUTO-libraries as well as the runtime-compilation of AUTO-input-files when running AUTO. Set to 'yes' to enable.
}
[ -n "${_WITH_OPENMP}" ] || { # Control the built of openmp-support.
  _WITH_OPENMP=yes
}
[ -n "${_WITH_MPI}" ] || { # Control the build of MPI-support.
  _WITH_MPI=yes
}


_pkgname="auto-07p"
pkgname="${_pkgname}-git"
_debianmainver=0.9.2
_debiandfsgver=3
_debianver="${_debianmainver}+dfsg-${_debiandfsgver}"
_pkgver=latest
pkgver=0.9.3+52.r.20240307.8ce569a
pkgrel=1
pkgdesc="Software for continuation and bifurcation problems in ordinary differential equations. Version 07p, latest git checkout. Environment variables can control the build (see PKGBUILD)."
arch=(
  'aarch64'
  'armv7h'
  'armv8h'
  'i686'
  'x86_64'
)
url='http://cmvl.cs.concordia.ca/auto/'
# url='https://github.com/auto-07p/auto-07p'
options=(
  'libtool'
  'staticlibs'
)
depends=(
  'bash'
  'gcc-fortran'
  # 'gcc6-fortran'
  # 'g95' # Use 'g95' (Fortran compiler from GCC 4.0.3) instead of 'gcc-fortran'.
  'gcc'
  'gcc-libs'
  'glibc'
  'libice'
  'libsm'
  'libxt'
  'libx11'
  'openmotif'
  'xterm' # For PLAUT plotting interface.
) # NOTE: A fortran compiler is needed during runtime for compilation of input files. 'gcc' is also needed, if the input files are C-files.
makedepends=(
  'git'
  'perl'
)
checkdepends=(
  "python3"
) # `make check` takes long and might fail.
optdepends=(
  "ipython: For python interface."
  "python3: For python interface."
  "python-matplotlib: For python interface."
  'python-numpy: For python interface.'
  "python-traitlets: For python interface."
)
conflicts=(
  "${_pkgname}"
)
replaces=()
provides=(
  "${_pkgname}=${pkgver}"
)
license=(
  'BSD'
  'LGPL2.1'
  'GPL2'
)
source=(
  "auto-07p::git+https://github.com/auto-07p/auto-07p.git"
  "auto-07p_${_debianver}.debian.tar.xz::https://deb.debian.org/debian/pool/main/a/auto-07p/auto-07p_${_debianver}.debian.tar.xz" # Debian patches.
  "auto-07p-session.bash"
  "xpdf-dummy"
  "makepkg.sh" # Just a dummy script for reference purposes. It is _not_ run with this PKGBUILD, but it can be used to build this package with makepkg.
)

sha256sums=(
  'SKIP'
  'a5193041895eb79912f4932d8de234d1d7ba7d7b8eb0acb7ccc0c6c0e2cf25a5'
  '14d272315859abb260208cfc0a437ff41d66b22960180cfa9c80161e7dded3f4'
  'cc83e032003bd9b79eaaee2bd91f77767caf55741ce02e9556dd49142ee1e911'
  '73bef420fdebb6b86b358bcd0f3d86e86f6963e76c7ae281391ec76a940c7644'
)

if [ "y${_BUILD_DOC}" == "yyes" ]; then
  makedepends+=(
    "texlive-bin" # For compiling the manual.
    "transfig"    # For compiling the manual."
  )
fi
if [ "y${_WITH_PLAUT04}" == "yyes" ]; then
  depends+=(
    "coin"  # For plaut04 plotting interface.
  )
  if [ "y${_PLAUT04_WITH_QT}" == "yyes" ]; then
    depends+=(
      "soqt" # For PLAUT04 plotting interface.
    )
  else
    depends+=(
      "soxt" # For PLAUT04 plotting interface.
    )
  fi
fi
if [ "y${_WITH_OPENMP}" == "yyes" ]; then
  depends+=(
    "openmp" # For parallel computation with OpenMP
  )
fi
if [ "y${_WITH_MPI}" == "yyes" ]; then
  depends+=(
    "openmpi" # For MPI message passing (parallel computation).
  )
fi
if [ "y${_AUTO_DEBUG}" == "yyes" ]; then
  options+=('!lto' 'debug' '!strip')
  export CFLAGS="-Og -ggdb3 -g3 ${DEBUG_CFLAGS}"
  export CXXFLAGS="-Og -ggdb3 -g3 ${DEBUG_CXXFLAGS}"
  export FFLAGS="-ggdb3"
  export _OPT_FLAGS="-Og -g3 -ggdb3"
else
  export _OPT_FLAGS="-O3"
fi

export CFLAGS="${CFLAGS} -Wno-error=unused-result"
export CXXFLAGS="${CXXFLAGS} -Wno-error=unused-result"
# export FFLAGS="${FFLAGS} -std=legacy" # '-std=legacy': See https://sourceforge.net/p/auto-07p/bugs/9/ # This is for 'new' gfortran.

# set the fortran compiler to use.
export FC='gfortran'
# export FC='gfortran-6'
# export FC='g95'
export MPIFC='mpifort'
# export MPIFC='mpif90'


prepare() {
  cd "${srcdir}"
  mkdir -pv 'auto'
  mv -v 'auto-07p' 'auto/07p'

  _extractdir="${srcdir}/auto/07p"
  _debianpatchdir="${srcdir}/debian/patches"
  cd "${_extractdir}"

  git log > git.log

  for _deb_patch in '02_env.patch'; do
    msg2 ">> Applying debian patch ${_deb_patch} ..."
    patch --follow-symlinks -N -p2 -i "${_debianpatchdir}/${_deb_patch}"
  done

  ### Since building the documentation opens the finished pdf with xpdf, we have a dummy xpdf-executable that does nothing. Set it up here to use it.
  cd "${srcdir}"
  if ! [ -e xpdf ]; then
    ln -s xpdf-dummy xpdf
  fi
  chmod a+x xpdf-dummy xpdf
  export _OLDPATH="${PATH}"
  export PATH="${srcdir}:${PATH}"
}

pkgver() {
  _extractdir="${srcdir}/auto/07p"
  cd "${_extractdir}"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' | tr '-' '+')"
  #_ver="$(grep -E '[^#]+' CHANGELOG | head -n 1 | tr -d '[[:space:]]:')"
  _commit_count="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git log -n 1 --format=%h)"

  if [ -z "${_ver}" ]; then
    echo "Error: Could not determine version. Aborting." > /dev/stderr
    return 1
  fi
  if [ -z "${_commit_count}" ]; then
    echo "Error: Could not determine commit count. Aborting." > /dev/stderr
    return 1
  fi

  printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
}

_build_documentation() {
  msg2 ">> Building documentation for '${pkgname}', version '${pkgver}'. >>"

  _docdir="${_extractdir}/doc"
  cd "${_docdir}"

  make all

  msg2 "<< Finished building documentation for '${pkgname}', version '${pkgver}'. <<"
}

build() {
  _extractdir="${srcdir}/auto/07p"
  _docdir="${_extractdir}/doc"
  _plaut04docdir="${_extractdir}/plaut04/doc"

  _install_location="/opt/auto/07p" # Since AUTO does not provide it's own installation procedure we have to take care of it. And since AUTO wants to have it's files somewhat under one place, we can not just install binaries to '/usr/bin', libraries to '/usr/lib', documentation to '/usr/share/doc' and custom commands somewhere else. To keep everything together, we install into '/opt/auto/07p', and have a shell script which starts a shell session with correctly set environment variables, which we place in '/usr/bin'.

  _install_dir="${pkgdir}/${_install_location}"
  _doc_install_dir="${_install_dir}/doc"
  _plaut04_doc_install_dir="${_install_dir}/plaut04/doc"

  AUTO_DIR="${_extractdir}" # Auto uses this, at least when building the documentation. So we need to set this variable.
  export AUTO_DIR


  msg2 ">>> Building '${pkgname}', version '${pkgver}'. >>>"

  cd "${_extractdir}"

  if [ "y${_WITH_PLAUT04}" == "yyes" ]; then
    if [ "y${_PLAUT04_WITH_QT}" == "yyes" ]; then
      _plaut04_qt_config="--enable-plaut04-qt" # Use 'soqt'.
    else
      _plaut04_qt_config="--disable-plaut04-qt" # Use 'soxt'.
    fi
    _plaut04_config="--enable-plaut04 ${_plaut04_qt_config}"
  else
    _plaut04_config="--disable-plaut04 --disable-plaut04-qt"
  fi

  if [ "y${_WITH_OPENMP}" == "yyes" ]; then
    _openmp_config="--with-openmp"
  else
    _openmp_config="--without-openmp"
  fi

  if [ "y${_WITH_MPI}" == "yyes" ]; then
    _mpi_config="--with-mpi"
  else
    _mpi_config="--without-mpi"
  fi

  msg2 ">> Running 'configure'-script for '${pkgname}', version '${pkgver}'. >>"

  ./configure \
    --enable-plaut \
    ${_plaut04_config} \
    ${_openmp_config} \
    ${_mpi_config} \
    --enable-gui \
    --with-x \
    --with-optimization-flags="${_OPT_FLAGS}" \
    --prefix="${_install_location}" \
    FC="${FC}" \
    MPIFC="${MPIFC}" \
    FFLAGS="${FFLAGS}" \
    CFLAGS="${CFLAGS}" \
    CXXFLAGS="${CXXFLAGS}"
  ### Remakrs for './configure' script:
  # * '--prefix' seems to be obsolete since there is no 'make install'. Specified anyway, since I do not know if it gets configured somewhere where it is used later.
  ### /Remarks for 'configure'-script. ###

  msg2 "<< Finished running 'configure'-script for '${pkgname}', version '${pkgver}'. <<"

  msg2 ">> Running 'make'-script for '${pkgname}', version '${pkgver}'. >>"

  make

  msg2 "<< Finished running 'make'-script for '${pkgname}', version '${pkgver}'. <<"

  if [ "y${_BUILD_DOC}" == "yyes" ]; then
    _build_documentation # IMPORTANT!, build documentation _after_ main build, otherwise there will no main build happen.
  fi

  msg2 "<<< Finished building '${pkgname}', version '${pkgver}'. <<<"
}

check() {
  cd "${_extractdir}"
  make check # `make check` takes long and might fail.
}

package() {
  _extractdir="${srcdir}/auto/07p"
  _docdir="${_extractdir}/doc"
  _plaut04docdir="${_extractdir}/plaut04/doc"

  _install_location="/opt/auto/07p" # Now AUTO does provide it's own installation procedure, but this `PKGBUILD` has not yet been adapted to it. And since AUTO wants to have it's files somewhat unter one place, we can not just install binaries to '/usr/bin', libraries to '/usr/lib', documentation to '/usr/share/doc' and custom commands somewhere else. To keep everything together, we install into '/opt/auto/07p', and have a shell script which starts a shell session with correctly set environment variables, which we place in '/usr/bin'.

  _install_dir="${pkgdir}/${_install_location}"
  _doc_install_dir="${_install_dir}/doc"
  _plaut04_doc_install_dir="${_install_dir}/plaut04/doc"

  AUTO_DIR="${_extractdir}" # Auto uses this, at least when building the documentation. So we need to set this variable.
  export AUTO_DIR

  msg2 ">>> Installing '${pkgname}', version '${pkgver}', into package dir '${pkgdir}'. >>>"
  cd "${_extractdir}"

  install -dvm755 "${_install_dir}"

  ls -A1 "${_extractdir}"/ | while read _content; do # Copy everything, including files starting with ".", but not the special directory entries "." and "..". We do _not_ use an extra argument to "cp" to solve this in order to avoid error messages if there are no dotfiles.
    cp -a -t "${_install_dir}" "${_content}"
  done
  rm -Rf "${_install_dir}"/{.git,.gitignore,.github}

  install -dvm755 "${pkgdir}/usr/bin"
  cp -aL "${srcdir}/auto-07p-session.bash" "${pkgdir}/usr/bin/"

  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  for _docfile in git.log CHANGELOG README; do
    ln -svr "${_install_dir}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  ln -svr "${_doc_install_dir}" "${pkgdir}/usr/share/doc/${_pkgname}/auto-doc"
  ln -svr "${_plaut04_doc_install_dir}" "${pkgdir}/usr/share/doc/${_pkgname}/plaut04-doc"

  rm -f "${_install_dir}/plaut"/*.o "${_install_dir}/plaut"/*.mod "${_install_dir}/plaut04"/*.mod "${_install_dir}/plaut04"/*.mod "${_install_dir}/gui"/*.o "${_install_dir}/tek2ps"/*.o "${_install_dir}/install-sh" "${_install_dir}/config.status" "${_install_dir}/cmds/auto.env" "${_install_dir}/cmds/auto.env.sh" # Remove files we don't want to have.

  chown -R root:root "${pkgdir}"

  msg2 "<<< Finished installing '${pkgname}', version '${pkgver}', into package dir '${pkgdir}'. <<<"
}
