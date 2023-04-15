# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: matthiakl <t-m · 42 _strange_curved_character_ mailpost · spdns · org>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Gabriel Margiani (gamag) <gabriel _strange_curved_character_ margiani · ch>
# Contributor: matthiaskrgr <matthias · krueger _strange_curved_character_ famsike · de>

_pkgname=widelands
pkgname="${_pkgname}-debug-git"
epoch=0
_pkgver=latest
pkgver=1.2.r26106.20230414.167ae86
pkgrel=2
pkgdesc="An elaborate realtime multiplayer strategy game with emphasis on economy and transport - development version. In the spirit of BlueByte's 'Siedler II/ Settlers 2'. Debug build, with in-game debug console, debugging symbols, and source code documentation."
url="http://widelands.org/"
arch=(
  'armv7h'
  'aarch64'
  'i686'
  'pentium4'
  'x86_64'
)
license=('GPL2')
depends=(
  'asio'
  'gettext'
  # 'glew'
  'glbinding'
  'hicolor-icon-theme'
  'libpng'
  'minizip'
  'sdl2_image'
  'sdl2_mixer'
  'sdl2_ttf'
  'zlib'
)
makedepends=(
  'cmake'          # For configuring the build
  'coreutils'      # For `nproc`.
  'doxygen'        # To build documentation
  'git'            # For getting the source
  'python'         # For revision detection, and to build documentation
  'python-sphinx'  # To build the documentation
)
optdepends=(
  "widelands-maps-rttr: To play the maps from the game 'Return to the Roots' in Widelands."
  "widelands-maps-siedler2: To play the maps from the game 'Settlers II' in Widelands."
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-debug=${pkgver}"
  "${_pkgname}-debugconsole=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-data=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bzr"
  "${_pkgname}-data"
)
replaces=(
  "${_pkgname}-debug-bzr" # Previously, the development code was hosted a another location in a bazaar repository.
)
source=(
  "${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git"
)
sha256sums=(
  'SKIP'
)
options=('debug' 'emptydirs' '!strip')


# The following variable controls if `ccache` should be used for the build -- it switches some variables, also in build().
_ccache=false # true|false

# Check `$USE_CCACHE` environment variable if we should use `ccache`
case "${USE_CCACHE}" in
  [yY]|[yY][eE][sS]|[tR][rR][uU][eE]|[oO][nN])
    _ccache=true
  ;;
esac

if "${_ccache}"; then
  makedepends+=('ccache')
  options+=('ccache')
fi

# Temporary file in "${srcdir}" the git log should be written to -- it will become part of the installed documentation.
_gitlog="_widelands.git.log"

### The following is deactivated, since the corresponding section in package() is commented out.
# # Keep the following translations, remove all other.
# _keep_translations=('en_US' 'en_GB' 'de')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  _get_build_ver() {
    cat NEXT_STABLE_VERSION
  }
  _get_git_commit_count() {
    git rev-list --count HEAD
  }
  _get_git_latest_commit_date() {
    git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-'
  }
  _get_git_hash() {
    git rev-parse --short=7 HEAD
  }

  _ver="$(_get_build_ver)"
  _rev="$(_get_git_commit_count)"
  _date="$(_get_git_latest_commit_date)"
  _hash="$(_get_git_hash)"

  if [ -z ${_ver} ]; then
    error "Failed to determine build version. Aborting."
    return 11
  fi
  if [ -z ${_rev} ]; then
    error "Failed to determine commit count. Aborting."
    return 12
  fi
  if [ -z ${_date} ]; then
    error "Failed to determine latest commit date. Aborting."
    return 13
  fi
  if [ -z ${_hash} ]; then
    error "Failed to determine git hash. Aborting."
    return 14
  fi

  printf "%s" "${_ver}.r${_rev}.${_date}.${_hash}"
}


prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Creating git log: Executing 'git log' ..."
  git log > "${srcdir}/${_gitlog}"

  msg2 "Creating directories 'build' and 'build/locale' ..."
  test -d build/locale || mkdir -p build/locale
  msg2 "Symlinking 'build/locale/' to the main source base directory ..."
  test -e locale || ln -s build/locale .
}


build() {
  cd "${srcdir}/${_pkgname}/build"

  # If we want to compile with ccache, modify $CC/ $CXX accordingly:
  if "${_ccache}"; then
    msg2 'Build with `ccache` requested. Setting `$CC` and `$CXX` environment variables accordingly ...'
    # If $CC/ $CXX is empty, set a default compiler:
    if [ -z $CC ]; then
      CC=gcc
    fi
    if [ -z $CXX ]; then
      CXX=g++
    fi
    # Only append 'ccache' if it is not already part of $CC/ $CXX:
    if ! grep -wq ccache <(printf '%s' "${CC}"); then
      CC="ccache ${CC}"
    fi
    if ! grep -wq ccache <(printf '%s' "${CXX}"); then
      CXX="ccache ${CXX}"
    fi
    export CC
    export CXX
  fi

  msg2 'Running `cmake` ...'
  # If this failes on an existing build because of an mismatch of src and build cmake files, just delete build and try again.
  cmake \
    -DBUILD_TESTING=ON \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_CXX_FLAGS="" \
    -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} -Wno-error -Wno-error=stringop-overflow -Wno-error=use-after-free -DNDEBUG" \
    -DCMAKE_CXX_FLAGS_DEBUG="${DEBUG_CXXFLAGS} -Wno-error -Wno-error=stringop-overflow -Wno-error=use-after-free" \
    -DCMAKE_C_FLAGS="" \
    -DCMAKE_C_FLAGS_RELEASE="${CFLAGS} -Wno-error -Wno-error=stringop-overflow -Wno-error=use-after-free -DNDEBUG" \
    -DCMAKE_C_FLAGS_DEBUG="${DEBUG_CFLAGS} -Wno-error -Wno-error=stringop-overflow -Wno-error=use-after-free" \
    -DCMAKE_EXE_LINKER_FLAGS="" \
    -DCMAKE_EXE_LINKER_FLAGS_RELEASE="${LDFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS_DEBUG="${LDFLAGS}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_MODULE_LINKER_FLAGS_RELEASE="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_DEBUG="${DEBUG_LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_RELEASE="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_DEBUG="${DEBUG_LDFLAGS}" \
    -DCMAKE_STATIC_LINKER_FLAGS="" \
    -DGETTEXT_MSGFMT_EXECUTABLE=/usr/bin/msgfmt \
    -DGETTEXT_MSGMERGE_EXECUTABLE=/usr/bin/msgmerge \
    -DOPTION_ASAN=OFF \
    -DOPTION_BUILD_CODECHECK=OFF \
    -DOPTION_BUILD_TESTS=ON \
    -DOPTION_BUILD_TRANSLATIONS=ON \
    -DOPTION_BUILD_WEBSITE_TOOLS=ON \
    -DOPTION_BUILD_WINSTATIC=OFF \
    -DOPTION_FORCE_EMBEDDED_MINIZIP=OFF \
    -DOPTION_GLEW_STATIC=OFF \
    -DOPTION_TSAN=OFF \
    -DOPTION_USE_GLBINDING=ON \
    -DUSE_XDG=OFF \
    -DWL_INSTALL_BASEDIR=/usr/share/doc/${_pkgname} \
    -DWL_INSTALL_DATADIR=/usr/share/widelands \
    -DWL_INSTALL_BINDIR=/usr/bin \
    ..

  msg2 'Running `make` ...'
  make -j1 # Uses several GiB of RAM during linking, so restrict to one parallel process.

  # msg2 'Running `make lang` ...'
  # make lang ## Seems not to be needed; seems to be done already with the general `make`-call.

  msg2 'Running `make doc` ...'
  make -j "$(nproc)" doc
}


check() {
  cd "${srcdir}/${_pkgname}/build"
  msg2 'Running `make test` ...'
  make test
}


package() {
  cd  "${srcdir}/${_pkgname}/build"

  msg2 'Running `make install` ...'
  make DESTDIR="${pkgdir}" install

  msg2 'Installing additional documentation files ...'
  install -d -v -m644 "${pkgdir}/usr/share/doc/${_pkgname}/doc"
  cp -rv doc/sourcecode "${pkgdir}/usr/share/doc/${_pkgname}/doc/sourcecode"
  install -D -v -m644 "VERSION" "${pkgdir}/usr/share/doc/${_pkgname}/VERSION"

  cd "${srcdir}/${_pkgname}"
  for _docfile in CONTRIBUTING.md COPYING CREDITS NEXT_STABLE_VERSION README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  install -D -v -m644 "${srcdir}/${_gitlog}" "${pkgdir}/usr/share/doc/${_pkgname}/git-log.txt"

  msg2 'Installing license file ...'
  install -d -v -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/doc/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

### When re-activating the following, also uncomment the line which sets ${_keep_translations[]}!
#   msg2 'Removing translations we do not want ...'
#   ls -1d "${pkgdir}/usr/share/widelands/locale"/* | grep -vE $(printf ' -e /%s$' "${_keep_translations[@]}") | while read _line; do
#     rm -R "${_line}"
#   done
}
