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

pkgname="auto-07p"
pkgver="0.9.1"
pkgrel="41"
pkgdesc="Software for continuation and bifurcation problems in ordinary differential equations. Release 07P. Environment variables controlling build (default to 'no', see PKGBUILD): _BUILD_DOC, _WITH_PLAUT04, _PLAUT04_WITH_QT, AUTO_DEBUG, _WITH_OPENMP, _WITH_MPI."
arch=('i686' 'x86_64')
url='http://cmvl.cs.concordia.ca/auto/'
options=('libtool' 'staticlibs')
depends=(
         'bash'
         'gcc-fortran'
         'gcc'
         'python2'
        ) # 'gcc-fortran' is needed in the runtime for compilation. 'gcc' is also needed, if the input files are C-files.
makedepends=(
             'gcc-fortran'
             'gcc'
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
            "inventor: For plaut04 plotting interface (enable compilation of 'plaut04' by setting the environment variable '_WITH_PLAUT04' to 'yes'). ('inventor' can be used instead of 'coin', but 'coin' (Coin3D) is recommended due to rendering issues (see AUTO documentation).)"
            "openmpi: For MPI message passing (parallel computation). To build, set the environment variable '_WITH_OPENMP' to 'yes'."
            "texlive-bin: For compiling the manual (enable compilation of documentation by setting the environment variable '_BUILD_DOC' to 'yes')."
            "transfig: For compiling the manual (enable manual compiling in PKGBUILD (enable compilation of documentation by setting the environment variable '_BUILD_DOC' to 'yes'))."
            )  ### Note: Some of these are optional at build time, but once a feature is build in (by './configure' automatically detecting the corresponding libraries), the packages are required to actual run AUTO, so they are _no_ optdepends for the binary package, just for the source.
license=(
         'BSD'
         'LGPL2'
         'GPL2'
        )
source=(
        "http://sourceforge.net/projects/auto-07p/files/auto07p/0.9/auto07p-${pkgver}.tar.gz"
        "auto-07p-session.bash"
        "xpdf-dummy"
        "makepkg.sh" # Just a dummy script for reference purposes. It is _not_ run with this PKGBUILD, but it can be used to build this package with makepkg.
       )

sha512sums=(
            '838c5e816778ee9d9c391691d1aa1f940aa4b177f36e7530df202774ce9830ebf47a04a390420bdd43da35580612d683c7a11c99088e6364bc808e4e66b3f289'
            '1c4ec2d2487530f407a12a6529d441ebcdf0832b59504bcd370f95162bbaa085475109db3f11f93c891da76dcc57205c4736242512375d81aaa73b56f86103de'
            'fe1dde2720afe62722a45dd359b67dfabeffe14bfd053efc0d1b8b30ace49a4b634b199c70d4b86ae117b7c69cc009eb600c17680161b1653a7ab9e86e6c6dd9'
            '0622ed7124575a450dd292710bed12285551590e5b7f6242dbd87b83062553a86ac7b3af286ade5899a21c739ec17fdf49a94392f93bc185929824db252d5b99'
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

_FFLAGS=""
_CFLAGS=""

if [ "${_AUTO_DEBUG}x" == "yesx" ]; then
  _FDEBUG_FLAGS="-ggdb -g -fbacktrace -fcheck=array-temps -fcheck=do -fcheck=mem -fcheck=pointer -fcheck=recursion"
  # -fcheck=bounds does NOT work, since AUTO itself violates bounds ... a bug in AUTO with sideeffects, without sideeffects, or even needed?? 
  _CDEBUG_FLAGS="-ggdb -g"
  _OPT_FLAGS="-O0"
  options+=('!strip')
else
  _FDEBUG_FLAGS="-g0"
  _CDEBUG_FLAGS="-g0"
  _OPT_FLAGS="-O3"
fi

_FFLAGS="${_FFLAGS} ${_FDEBUG_FLAGS}"
_CFLAGS="${_CFLAGS} ${_CDEBUG_FLAGS}"



_build_documentation()
{
  echo ""
  echo ">> Building documentation for '${pkgname}', version '${pkgver}'. >>"
  echo ""

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

  
  echo ""
  echo "<< Finished building documentation for '${pkgname}', version '${pkgver}'. <<"
  echo ""
}

_install_documentation()
{
  ### Documentation gets already installed by the normal install procedure, since everything is copied anyway. So, do nothing here. ###
  true

#   echo ""
#   echo ">> Packaging documentation for '${pkgname}', version '${pkgver}'. >>"
#   echo ""
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
#   echo ""
#   echo "<< Finished packaging documentation for '${pkgname}', version '${pkgver}'. <<"
#   echo ""
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



  echo ""
  echo ">>> Building '${pkgname}', version '${pkgver}'. >>>"
  echo ""

  cd "${_extractdir}" || exit 11

  if [ "y${_WITH_PLAUT04}" == "yyes" ]; then
    if ["y${_PLAUT04_WITH_QT}" == "yyes" ]; then
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

  echo ""
  echo ">> Running 'configure'-script for '${pkgname}', version '${pkgver}'. >>"
  echo ""
  
  ./configure --enable-plaut ${_plaut04_config} ${_openmp_config} ${_mpi_config} --enable-gui --enable-tek2ps --with-x --with-optimization-flags="${_OPT_FLAGS}" --prefix="${_install_location}" FFLAGS="${_FFLAGS}" CFLAGS="${_CFLAGS}" || exit "$?"
  ### Remakrs for 'copenmotif: For GUI94. ('openmotif' can be used instead of 'lesstif'nfigure'-script: ###
  # * '--prefix' seems to be obsolete since there is no 'make install'. Specified anyway, since I do not know if it gets configured somewhere where it is used later.
  # * For some reason, enabling plaut04 breaks build (installed packages on my machine: 'coin' and 'soqt' and 'simage', although 'simage' is, according to the AUTO-documentation, not necessary for 'soqt' version >= 1.5.0.)
  ### /Remarks for 'configure'-script. ###
  
  echo ""
  echo "<< Finished running 'configure'-script for '${pkgname}', version '${pkgver}'. <<"
  echo ""
  
  
  echo ""
  echo ">> Running 'make'-script for '${pkgname}', version '${pkgver}'. >>"
  echo ""
  
  make || exit "$?"

  echo ""
  echo "<< Finished running 'make'-script for '${pkgname}', version '${pkgver}'. <<"
  echo ""
  
  if [ "y${_BUILD_DOC}" == "yyes" ]; then
    _build_documentation || exit "$?" # IMPORTANT!, build documentation _after_ main build, otherwise there will no main build happen.
  fi

  echo ""
  echo "<<< Finished building '${pkgname}', version '${pkgver}'. <<<"
  echo ""
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

  echo ""
  echo ">>> Installing '${pkgname}', version '${pkgver}', into package dir '${pkgdir}'. >>>"
  echo ""
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

  echo ""
  echo "<<< Finished installing '${pkgname}', version '${pkgver}', into package dir '${pkgdir}'. <<<"
  echo ""
  
  echo ""
  echo ">>> patching shabeng-lines of python scripts from 'python' to 'python2'. >>>"
  echo ""
  
  cd "${_install_dir}"
  ### The "grep" just filters out the files which _may_ be needed to patch (note, that it also matches non-first lines but we only want to patch the first line).
  ### Then, the "sed"-command takes care of just patching the first line.
  ### We could omit the "grep" and simply run "sed" over all files, but that would be too much (and more prone for programming errors becoming effective).
  grep -rlE '^\#\!.*python\>' "${_install_dir}"/* | while read _file; do
    sed -i '1s|python\(\>\)|python2\1|g' "${_file}"
  done

  echo ""
  echo "<<< Finished patching shabeng-lines of python scripts from 'python' to 'python2'. <<<"
  echo ""
  
  echo ""
  echo ">>> patching 'exec python' to 'exec python2'. >>>"
  echo ""
  
  ### The "grep" just filters out the files which _may_ be needed to patch.
  ### Then, the "sed"-command takes care of patching.
  ### Indeed, the grep could be omitted, but it's another step of security to not mis-patch.
  ### (Actually, bin/autox is the only file which gets patched at all.)
  grep -rwlE 'exec[[:space:]]+python' "${_install_dir}"/* | while read _file; do
    sed -ri 's|\<exec[[:space:]]+python\>|exec python2|g' "${_file}"
  done
  
  echo ""
  echo "Finished patching 'exec python' to 'exec python2'. <<<"
  echo ""
}
