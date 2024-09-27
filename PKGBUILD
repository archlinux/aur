# Maintainer:
# Contributor: Artem Klevtsov <a.a.klevtso@gmail.com>
# Contributor: Stephen Martin <hwkiller@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

## links
# https://posit.co/products/open-source/rstudio/
# https://github.com/rstudio/rstudio

## options
: ${_nodeversion:=22}
: ${_pandocver:=current}
: ${_sociver:=4.0.3}
: ${_quarto_branch:=release/rstudio-cranberry-hibiscus}
: ${_quarto:=false}

## basic info
_pkgname="rstudio-desktop"
pkgname="$_pkgname-git"
pkgver=2024.09.0.r181.g37e8dd3
pkgrel=1
pkgdesc="A powerful and productive integrated development environment (IDE) for R programming language"
url="https://github.com/rstudio/rstudio"
license=('AGPL-3.0-only')
arch=('x86_64')

depends=(
  'hunspell-en_US'
  'mathjax2'
  'pandoc'
  'r'
)
makedepends=(
  'apache-ant'
  'boost'
  'cmake'
  'git'
  'jdk11-openjdk'
  'libcups'
  'ninja'
  'nvm' # AUR
  'openssl'
  'pam'
  'python'
  'python-setuptools'
  'wget'
  'yarn'
)
optdepends=(
  'git: for git support'
  'subversion: for subversion support'
  'openssh-askpass: for a git ssh access'
  'quarto: for Quarto projects support'
)

if [[ "${_quarto::1}" == "t" ]]; then
  makedepends+=(
    'quarto' # AUR
  )
fi

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!emptydirs' '!debug')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/rstudio/rstudio.git"
  "quarto"::"git+https://github.com/quarto-dev/quarto.git#branch=${_quarto_branch}"
  "soci-$_sociver.tar.gz"::"https://github.com/SOCI/soci/archive/refs/tags/v${_sociver}.tar.gz"
  '0003-fix_boost_186.patch'
)

sha256sums=(
  'SKIP'
  'SKIP'
  '4b1ff9c8545c5d802fbe06ee6cd2886630e5c03bf740e269bb625b45cf934928'
  '7b3384fc7349a69e866ef0db21f196a2cafa3a9e2fb7f1edaead773b991dac72'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/\+[0-9]+-/-/;s/([^-]*-g)/r\1/;s/[-+]/./g'
}

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion

  _npm_path="$(which npm | sed -E 's&/[^/]+$&&')"
  export RSTUDIO_NODE_VERSION=$(echo "$_npm_path" | sed -E 's&^\S+/v([0-9\.]+)/\S+$&\1&')
}

prepare() (
  _nvm_env
  npm install yarn

  cd "$_pkgsrc"
  # Do not use outdated version name of pandoc
  sed -i '/PANDOC_VERSION/s/2.18/current/' "cmake/globals.cmake"

  # Suppress _FORTIFY_SOURCE mismatch warnings
  sed -i 's/D_FORTIFY_SOURCE=2/D_FORTIFY_SOURCE=3/' "src/cpp/CMakeLists.txt"

  # fix npm/node paths
  install -dm755 "$srcdir/$_pkgsrc/dependencies/common/node"
  ln -sfT "$NVM_DIR/versions/node/v$RSTUDIO_NODE_VERSION" "$srcdir/$_pkgsrc/dependencies/common/node/${RSTUDIO_NODE_VERSION}-patched"

  sed -E -e 's&PATHS "/opt/rstudio-tools/dependencies/common/node/\$\{RSTUDIO_NODE_VERSION\}"&PATHS "'"${_npm_path}"'"&' \
    -i src/node/CMakeNodeTools.txt

  sed -E -e 's&(common/node)/([0-9\.]+)-(patched)&\1/'"${RSTUDIO_NODE_VERSION}"'-\3&' \
    -i src/cpp/conf/rsession-dev.conf src/cpp/session/SessionOptions.cpp

  sed -E -e '/"node\.version"/s&value="[0-9\.]+"&value="'"${RSTUDIO_NODE_VERSION}"'"&' \
    -i src/gwt/build.xml

  sed -E -e 's&set\(RSTUDIO_NODE_VERSION "[0-9\.]+"\)&set(RSTUDIO_NODE_VERSION "'"${RSTUDIO_NODE_VERSION}"'")&' \
    -i src/node/CMakeNodeTools.txt

  # fix os-release path
  sed -E 's&(STRINGS) "/etc/os-release" (OS_RELEASE)&\1 "/usr/lib/os-release" \2&' \
    -i cmake/modules/OsRelease.cmake

  # fix boost 1.86 incompatibility
  patch -p1 -i "$srcdir/0003-fix_boost_186.patch"

  cd "$srcdir/$_pkgsrc/dependencies/common"
  install -d pandoc/${_pandocver}

  ln -sfT /usr/share/myspell/dicts dictionaries
  ln -sfT /usr/share/mathjax2 mathjax-27
  ln -sfT /usr/bin/pandoc pandoc/${_pandocver}/pandoc

  # Fix links for src/cpp/session/CMakeLists.txt
  cd "$srcdir/$_pkgsrc/dependencies"
  ln -sfT /usr/share/myspell/dicts dictionaries
  ln -sfT /usr/share/mathjax2 mathjax-27

  # Bundled SOCI libs
  ln -sfT "${srcdir}/soci-${_sociver}" "soci-${_sociver}"

  # Panmirror is picked up now from Quarto repo
  ln -sfT "${srcdir}/quarto" "$srcdir/$_pkgsrc/src/gwt/lib/quarto"
)

_build_soci() {
  echo "Building SOCI libs..."

  local _opts_soci=(
    -B "soci-${_sociver}/build"
    -S "soci-${_sociver}"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DSOCI_TESTS=OFF
    -DSOCI_CXX11=ON
    -DSOCI_EMPTY=OFF
    -DWITH_BOOST=ON
    -DWITH_POSTGRESQL=ON
    -DWITH_SQLITE3=ON
    -DWITH_DB2=OFF
    -DWITH_MYSQL=OFF
    -DWITH_ORACLE=OFF
    -DWITH_FIREBIRD=OFF
    -DWITH_ODBC=OFF
    -Wno-dev
  )

  cmake "${_opts_soci[@]}"
  cmake --build "soci-${_sociver}/build"
}

build() (
  _nvm_env
  # Quarto set up
  if (pacman -Q quarto > /dev/null 2> /dev/null); then
    _quarto="ON"
    echo "Quarto is installed, linking for build"
    cd "$srcdir/$_pkgsrc/dependencies"
    install -d quarto/bin/tools
    ln -sfT /usr/bin/quarto quarto/bin/quarto
    ln -sfT /usr/bin/pandoc quarto/bin/tools/pandoc
  else
    _quarto="OFF"
    echo "Quarto is not installed, using Pandoc"
    cd "$srcdir/$_pkgsrc/dependencies"
    install -d pandoc/${_pandocver}/bin/tools
    ln -sfT /usr/bin/pandoc pandoc/${_pandocver}/bin/tools/pandoc
  fi

  _build_soci

  export LDFLAGS+=" -L$srcdir/$_pkgsrc/dependencies/soci-${_sociver}/build/lib"

  cd "${srcdir}"
  echo "Downloading and installing R packages..."
  export R_LIBS_USER="${srcdir}/${_srcname}/dependencies/R"
  _JOBS="$(grep -oP -- "-j\s*\K[0-9]+" <<< "${MAKEFLAGS}")" || _JOBS="1"
  mkdir -p "${R_LIBS_USER}"
  local RPACKAGES=(
    digest
    purrr
    rmarkdown
    testthat
    xml2
    yaml
  )
  for RPKG in ${RPACKAGES[*]}; do
    RINSTALLCMD="if("'!'"require($RPKG, quietly = TRUE)) { options(Ncpus = ${_JOBS} ); install.packages('$RPKG', lib='$R_LIBS_USER', repos='https://cran.rstudio.com/') }"
    echo "> $RINSTALLCMD"
    Rscript -e "$RINSTALLCMD"
  done

  export PATH="/usr/lib/jvm/java-11-openjdk/jre/bin/:${PATH}"
  export RSTUDIO_TOOLS_ROOT="$srcdir/$_pkgsrc/dependencies"
  export RSTUDIO_NODE_PATH=/usr/
  export RSTUDIO_VERSION_MAJOR=$(cut -d'.' -f1 <<< "$pkgver")
  export RSTUDIO_VERSION_MINOR=$(cut -d'.' -f2 <<< "$pkgver")
  export RSTUDIO_VERSION_PATCH=$(cut -d'.' -f3 <<< "$pkgver")
  export RSTUDIO_VERSION_SUFFIX="+$(cut -d'.' -f4 <<< "$pkgver")"
  export GIT_COMMIT=$(echo "$pkgver" | cut -d'.' -f6 | sed 's/^g//')
  export PACKAGE_OS=$(uname -om)

  # node-gyp or node have a bug that prevents building with "text file busy"
  # if the kernel is too fast, so we have to disable IO_URING support. This
  # is cleary a hack and needs to be removed as soon as possible
  # nodejs/node#48444 is the necro bumped thread
  # originally from docker
  # https://github.com/nodejs/node/issues/48444
  export UV_USE_IO_URING=0

  # -DCMAKE_INSTALL_PREFIX seems ignored for sub-dependencies,
  # which results as empty '/usr/local/bin' in package
  # Following override works for cmake >3.29
  export CMAKE_INSTALL_PREFIX=/usr/lib/rstudio

  local _opts_rstudio=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DRSTUDIO_TARGET=Electron
    -DRSTUDIO_USE_SYSTEM_BOOST=YES
    -DRSTUDIO_USE_SYSTEM_SOCI=NO
    -DRSTUDIO_USE_SYSTEM_NODE=YES
    -DRSTUDIO_NODE_VERSION="$RSTUDIO_NODE_VERSION"
    -DRSTUDIO_INSTALLED_NODE_VERSION="$RSTUDIO_NODE_VERSION"
    -DQUARTO_ENABLED=${_quarto}
    -DBUILD_TESTING=OFF
    -Wno-dev
  )
  cmake "${_opts_rstudio[@]}"
  cmake --build build
)

package() {
  # Install the program
  DESTDIR="${pkgdir}" cmake --install build

  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/rstudio/rstudio" "$pkgdir/usr/bin/rstudio"
}
