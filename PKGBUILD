#!/bin/bash
# Above shabeng-line for automatic switch-on of syntax highlighing in some editors.

# Maintainer: Felix Becker <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.


### Details of the build are controlled by environment variables.
# 
# The environment variables controlling the build are by now (2014-08-24):
# 
# _BUILD_DOC # Build documentation (Default: 'no')
# _WITH_PLAUT04 # Build plaut04 (Default: 'no')
# _PLAUT04_WITH_QT # Build plaut04 with Qt (functionality is the same) (Default: 'no')
# _AUTO_DEBUG # Compile with debug options (Default: 'no')
# _WITH_OPENMP # Compile with OpenMPI (default: 'no')
# _WITH_MPI # Compile with MPI (default: 'no')
# 
# For using the environment variables controlling the build, also have a look at the sample script 'makepkg.sh' conbtained in the package.
# 
###

_pkgname="auto-07p"
pkgname="${_pkgname}-git"
_debianmainver=0.9.2
_debiandfsgver=3
_debianver="${_debianmainver}+dfsg-${_debiandfsgver}"
_pkgver=latest
pkgver=0.9.2+r1856
pkgrel=3
pkgdesc="Software for continuation and bifurcation problems in ordinary differential equations. Release 07P. Environment variables controlling build (default to 'no', see PKGBUILD): _BUILD_DOC, _WITH_PLAUT04, _PLAUT04_WITH_QT, AUTO_DEBUG, _WITH_OPENMP, _WITH_MPI."
arch=('i686' 'x86_64')
url='http://cmvl.cs.concordia.ca/auto/'
options=('libtool' 'staticlibs')
depends=(
         'bash'
         # 'gcc-fortran' # May fail to build with gcc8 (see http://sourceforge.net/p/auto-07p/bugs/9/).
         'g95' # Use 'g95' (Fortran compiler from GCC 4.0.3) instead of 'gcc-fortran'.
         'gcc'
         'python2'
        ) # A fortran compiler is needed during runtime for compilation of input files. 'gcc' is also needed, if the input files are C-files.
makedepends=(
             # 'gcc-fortran' # May fail to build with gcc8 (see http://sourceforge.net/p/auto-07p/bugs/9/).
             'g95' # Use 'g95' (Fortran compiler from GCC 4.0.3) instead of 'gcc-fortran'.
             'gcc'
             'git'
            )
optdepends=(
            "python2-matplotlib: For python interface."
            "ipython2: For python interface."
            "lesstif: For GUI94 and PLAUT04."
            "openmotif: For GUI94 and PLAUT04. ('openmotif' can be used instead of 'lesstif')"
            "xterm: For PLAUT plotting interface."
            "soxt: For PLAUT04 plotting interface (enable compilation of 'plaut04' by setting the environment variable '_WITH_PLAUT04' to 'yes')."
            "soqt: For PLAUT04 plotting interface (enable compilation of 'plaut04' by setting the environment variable '_WITH_PLAUT04' to 'yes'). ('soqt' can be used instead of 'soxt'. If using 'soqt', set '_PLAUT04_WITH_QT' to 'yes'.)" 
            "coin: For plaut04 plotting interface (enable compilation of 'plaut04' by setting the environment variable '_WITH_PLAUT04' to 'yes')."
            "inventor: For plaut04 plotting interface (enable compilation of 'plaut04' by setting the environment variable '_WITH_PLAUT04' to 'yes'). ('inventor' can be used instead of 'coin', but 'coin' (Coin3D) is recommended (see AUTO documentation).)"
            "openmpi: For MPI message passing (parallel computation). To build, set the environment variable '_WITH_OPENMP' to 'yes'."
            "texlive-bin: For compiling the manual (enable compilation of documentation by setting the environment variable '_BUILD_DOC' to 'yes')."
            "transfig: For compiling the manual (enable manual compiling in PKGBUILD (enable compilation of documentation by setting the environment variable '_BUILD_DOC' to 'yes'))."
            ) ### Note: Some of these are optional at build time, but once a feature is build in (by './configure' automatically detecting the corresponding libraries), the packages are required to actual run AUTO, so they are _no_ optdepends for the binary package, just for the source.
conflicts=("${_pkgname}")
replaces=("${_pkgname}<=${pkgver}")
provides=("${_pkgname}=${pkgver}")
license=(
         'BSD'
         'LGPL2.1'
         'GPL2'
        )
source=(
        # "auto-07p::http://http.debian.net/debian/pool/main/a/auto-07p/auto-07p_${_debianmainver}+dfsg.orig.tar.gz"
        # "auto-07p::git+http://salsa.debian.org/science-team/auto-07p.git"
        # "auto-07p::git+git://github.com/andram/auto-07p.git#branch=python3fixes"
        "auto-07p::git+git://github.com/auto-07p/auto-07p.git"
        "auto-07p_debian.tar.xz::http://http.debian.net/debian/pool/main/a/auto-07p/auto-07p_${_debianver}.debian.tar.xz" # Debian patches.
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

[ -n "${_BUILD_DOC}" ] || { # Building documentation can be controlled by environment variable.
  _BUILD_DOC=no # Controls if we want to build the documentation. Set to 'yes' to build it (requires some LaTeX-tools to be installed).
}

[ -n "${_WITH_PLAUT04}" ] || { # Building plaut04 can be controlled by environment variable.
  _WITH_PLAUT04=no # Controls if we want to build plaut04. This is here since on my machine it fails even with 'coin' and 'soqt' installed, so I can explicitly disable it (default is disabled). Set to 'yes' to enable.
}

[ -n "${_PLAUT04_WITH_QT}" ] || { # Controls if plaut04 (if built) is built using qt-libs ('soqt', in that case), or not ('soxt', then).
  _PLAUT04_WITH_QT=no
}

[ -n "${_AUTO_DEBUG}" ] || { # Building with debugging options can be controlled by environment variable.
  _AUTO_DEBUG=no # Controls if we want to build with debugging information. It will affect both the precompiled AUTO-libraries as well as the runtime-compilation of AUTO-input-files when running AUTO. Set to 'yes' to enable.
}

[ -n "${_WITH_OPENMP}" ] || { # Control the built of openmp-support.
  _WITH_OPENMP=no
}

[ -n "${_WITH_MPI}" ] || { # Control the build of MPI-support.
  _WITH_MPI=no
}

# set the fortran compiler to use.
FC='gfortran' # May Fail to build with gcc8 (see http://sourceforge.net/p/auto-07p/bugs/9/).
# FC='gfortran-6'
# FC='g95'
export FC

if [ "${_AUTO_DEBUG}x" == "yesx" ]; then
  # _FDEBUG_FLAGS="-ggdb -g -fbacktrace -fcheck=array-temps -fcheck=do -fcheck=mem -fcheck=pointer -fcheck=recursion" # Those are for 'new' gfortran.
  _FDEBUG_FLAGS="-ggdb -g" # Those are for g95.
  # -fcheck=bounds does NOT work, since AUTO itself violates bounds ... a bug in AUTO with sideeffects, without sideeffects, or even needed??
  _CDEBUG_FLAGS="-ggdb -g"
  _CXXDEBUG_FLAGS="-ggdb -g"
  _OPT_FLAGS="-O0"
  options+=('!strip')
else
  _FDEBUG_FLAGS="-g0"
  _CDEBUG_FLAGS="-g0"
  _CXXDEBUG_FLAGS="-g0"
  _OPT_FLAGS="-O3"
fi

# FFLAGS+=" ${_FDEBUG_FLAGS} -std=legacy" # '-std=legacy': See https://sourceforge.net/p/auto-07p/bugs/9/ # This is for 'new' gfortran.
FFLAGS+=" ${_FDEBUG_FLAGS}" # This is for g95.
CFLAGS+=" ${_CDEBUG_FLAGS}"
CXXFLAGS+=" ${_CXXDEBUG_FLAGS}"

export FFLAGS
export CFLAGS
export CXXFLAGS


prepare()
{
  cd "${srcdir}"
  mkdir -pv 'auto'
  mv -v 'auto-07p' 'auto/07p'

  _extractdir="${srcdir}/auto/07p"
  _debianpatchdir="${srcdir}/debian/patches"
  cd "${_extractdir}"

  for _deb_patch in '02_env.patch'; do
    msg2 ">> Applying debian patch ${_deb_patch} ..."
    patch --follow-symlinks -N -p2 -i "${_debianpatchdir}/${_deb_patch}"
  done
}

pkgver()
{
  _extractdir="${srcdir}/auto/07p"
  cd "${_extractdir}"
  _ver="$(grep -E '[^#]+' CHANGELOG | head -n 1 | tr -d '[[:space:]]:')"
  _hash="$(git log -n 1 --format=%h)"
  _commit_count="$(git rev-list --count HEAD)"

  if [ -z "${_ver}" ]; then
    echo "Error: Could not determine version. Aborting." > /dev/stderr
    return 1
  fi
  if [ -z "${_commit_count}" ]; then
    echo "Error: Could not determine commit count. Aborting." > /dev/stderr
    return 1
  fi

  echo "${_ver}+r${_commit_count}"
}

_build_documentation()
{
  msg2 ">> Building documentation for '${pkgname}', version '${pkgver}'. >>"

  ### Since building the documentation opens the finished pdf with xpdf, we have a dummy xpdf-executable that does nothing. Set it up here to use it.
  cd "${srcdir}"
  ln -s xpdf-dummy xpdf
  chmod a+x xpdf-dummy xpdf
  _OLDPATH="${PATH}"
  PATH="${srcdir}:${PATH}"
  export PATH

  ### Now, we are ready to build the documentation without the annoying xpdf-startup.
  cd "${_docdir}" || exit 201

  make all || exit "$?"
  
  ### Reset the PATH to the value it had before.
  PATH="${_OLDPATH}"
  export PATH

  msg2 "<< Finished building documentation for '${pkgname}', version '${pkgver}'. <<"
}

_install_documentation()
{
  ### Documentation gets already installed by the normal install procedure, since everything is copied anyway. So, do nothing here. ###
  true

#   msg2 ">> Packaging documentation for '${pkgname}', version '${pkgver}'. >>"
# 
# 
#   mkdir -p "${_doc_install_dir}" || exit 301
#   mkdir -p "${_plaut04_doc_install_dir}" || exit 302
#
#   if [ -e "${_docdir}/auto.pdf" ]; then
#     cp -a "${_docdir}/auto.pdf" "${_doc_install_dir}/" || exit "$?"
#   fi
#   if [ -e "${_plaut04docdir}/userguide.pdf" ]; then
#     cp -a "${_plaut04docdir}/userguide.pdf" "${_plaut04_doc_install_dir}/" || exit "$?"
#   fi
#
#   msg2 "<< Finished packaging documentation for '${pkgname}', version '${pkgver}'. <<"
}

build()
{
  _extractdir="${srcdir}/auto/07p"
  _docdir="${_extractdir}/doc"
  _plaut04docdir="${_extractdir}/plaut04/doc"

  _install_location="/opt/auto/07p" # Since AUTO does not provide it's own installation procedure we have to take care of it. And since AUTO wants to have it's files somewhat unter one place, we can not just install binaries to '/usr/bin', libraries to '/usr/lib', documentation to '/usr/share/doc' and custom commands somewhere else. To keep everything together, we install into '/opt/auto/07p', and have a shell script which starts a shell session with correctly set environment variables, which we place in '/usr/bin'.

  _install_dir="${pkgdir}/${_install_location}"
  _doc_install_dir="${_install_dir}/doc"
  _plaut04_doc_install_dir="${_install_dir}/plaut04/doc"

  AUTO_DIR="${_extractdir}" # Auto uses this, at least when building the documentation. So we need to set this variable.
  export AUTO_DIR



  msg2 ">>> Building '${pkgname}', version '${pkgver}'. >>>"

  cd "${_extractdir}" || exit 11

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
  
  ./configure --enable-plaut ${_plaut04_config} ${_openmp_config} ${_mpi_config} --enable-gui --enable-tek2ps --with-x --with-optimization-flags="${_OPT_FLAGS}" --prefix="${_install_location}" FC="${FC}" FFLAGS="${FFLAGS}" CFLAGS="${CFLAGS}" || exit "$?"
  ### Remakrs for 'copenmotif: For GUI94. ('openmotif' can be used instead of 'lesstif'nfigure'-script: ###
  # * '--prefix' seems to be obsolete since there is no 'make install'. Specified anyway, since I do not know if it gets configured somewhere where it is used later.
  # * For some reason, enabling plaut04 breaks build (installed packages on my machine: 'coin' and 'soqt' and 'simage', although 'simage' is, according to the AUTO-documentation, not necessary for 'soqt' version >= 1.5.0.)
  ### /Remarks for 'configure'-script. ###

  msg2 "<< Finished running 'configure'-script for '${pkgname}', version '${pkgver}'. <<"


  msg2 ">> Running 'make'-script for '${pkgname}', version '${pkgver}'. >>"

  make || exit "$?"

  msg2 "<< Finished running 'make'-script for '${pkgname}', version '${pkgver}'. <<"

  if [ "y${_BUILD_DOC}" == "yyes" ]; then
    _build_documentation || exit "$?" # IMPORTANT!, build documentation _after_ main build, otherwise there will no main build happen.
  fi

  msg2 "<<< Finished building '${pkgname}', version '${pkgver}'. <<<"
}

package()
{
  _extractdir="${srcdir}/auto/07p"
  _docdir="${_extractdir}/doc"
  _plaut04docdir="${_extractdir}/plaut04/doc"

  _install_location="/opt/auto/07p" # Since AUTO does not provide it's own installation procedure we have to take care of it. And since AUTO wants to have it's files somewhat unter one place, we can not just install binaries to '/usr/bin', libraries to '/usr/lib', documentation to '/usr/share/doc' and custom commands somewhere else. To keep everything together, we install into '/opt/auto/07p', and have a shell script which starts a shell session with correctly set environment variables, which we place in '/usr/bin'.

  _install_dir="${pkgdir}/${_install_location}"
  _doc_install_dir="${_install_dir}/doc"
  _plaut04_doc_install_dir="${_install_dir}/plaut04/doc"

  AUTO_DIR="${_extractdir}" # Auto uses this, at least when building the documentation. So we need to set this variable.
  export AUTO_DIR

  msg2 ">>> Installing '${pkgname}', version '${pkgver}', into package dir '${pkgdir}'. >>>"
  cd "${_extractdir}" || exit 101

  mkdir -p "${_install_dir}" || exit "$?"

  ls -A1 "${_extractdir}"/ | while read _content; do # Copy everything, including files starting with ".", but not the special directory entries "." and "..". We do _not_ use an extra argument to "cp" to solve this in order to avoid error messages if there are no dotfiles.
    cp -a -t "${_install_dir}" "${_content}" || exit "$?"
  done || exit "$?"

  mkdir -p "${pkgdir}/usr/bin" || exit "$?"
  cp -aL "${srcdir}/auto-07p-session.bash" "${pkgdir}/usr/bin/" || exit "$?"

  if [ "y${_BUILD_DOC}" == y"yes" ]; then
    _install_documentation || exit "$?"
  fi

  rm -f "${_install_dir}/plaut"/*.o "${_install_dir}/plaut"/*.mod "${_install_dir}/plaut04"/*.mod "${_install_dir}/plaut04"/*.mod "${_install_dir}/gui"/*.o "${_install_dir}/tek2ps"/*.o "${_install_dir}/install-sh" "${_install_dir}/config.status" "${_install_dir}/cmds/auto.env" "${_install_dir}/cmds/auto.env.sh" || exit "$?" # Remove files we don't want to have.

  chown -R root:root "${pkgdir}" || exit "$?"

  msg2 "<<< Finished installing '${pkgname}', version '${pkgver}', into package dir '${pkgdir}'. <<<"

#   msg2 ">>> patching shabeng-lines of python scripts from 'python' to 'python2'. >>>"
#   
#   cd "${_install_dir}"
#   ### The "grep" just filters out the files which _may_ be needed to patch (note, that it also matches non-first lines but we only want to patch the first line).
#   ### Then, the "sed"-command takes care of just patching the first line.
#   ### We could omit the "grep" and simply run "sed" over all files, but that would be too much (and more prone for programming errors becoming effective).
#   grep -rlE '^\#\!.*python\>' "${_install_dir}"/* | while read _file; do
#     sed -i '1s|python\(\>\)|python2\1|g' "${_file}"
#   done
# 
#   msg2 "<<< Finished patching shabeng-lines of python scripts from 'python' to 'python2'. <<<"
# 
#   msg2 ">>> patching 'exec python' to 'exec python2'. >>>"
# 
#   ### The "grep" just filters out the files which _may_ be needed to patch.
#   ### Then, the "sed"-command takes care of patching.
#   ### Indeed, the grep could be omitted, but it's another step of security to not mis-patch.
#   ### (Actually, bin/autox is the only file which gets patched at all.)
#   grep -rwlE 'exec[[:space:]]+python' "${_install_dir}"/* | while read _file; do
#     sed -ri 's|\<exec[[:space:]]+python\>|exec python2|g' "${_file}"
#   done
# 
#   msg2 "Finished patching 'exec python' to 'exec python2'. <<<"
}
