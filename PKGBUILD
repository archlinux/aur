# Partially based on the package `arangodb', from which Christoph Grabo <asaaki at mannaz dot cc> is the maintainer
# Maintainer: helq <linuxero789 \at/ gmail \./ com>

# allow to download a shallow copy of the repository, if not it delegates the
# download to makepkg which downloads the whole repository (slow)
# comment to disable
_shallow_git_copy=true

# enable clang as compiler
# comment to disable
_clang=true

# make build special opts
_make_opts="-j4"

# repository location, name and branch
_pkgname=arangodb
_branch=master
_git="git://github.com/$_pkgname/$_pkgname"

#
pkgname=${_pkgname}-git
pkgver=3.0.3.d20160717_0823.31c6b72
pkgrel=1

pkgdesc="A distributed open-source database with a flexible data model for documents, graphs, and key-values."
arch=("i686" "x86_64")
url="https://www.arangodb.com/"
license=('Apache')

depends=('openssl' 'readline' 'systemd' 'icu')
makedepends=('git' 'go' 'python2' 'cmake')
if [ $_clang ] ; then
    makedepends+=('clang')
fi

provides=("arangodb")
conflicts=("arangodb")

install=arangodb.install
source=(arangodb.service)
sha1sums=('bc2830bd209c7659a7cde5ab8e7f860b62db74c4')
if [ ! $_shallow_git_copy ] ; then
    makedepends+=("$_git:$_branch")
    sha1sums+=('SKIP')
fi

pkgver() {
  cd "$startdir/$_pkgname"

  cmakelists_arangodb=$(git ls-tree HEAD | grep CMakeLists.txt | sed 's/^\S* \S* \(\S*\)\s.*$/\1/')
  arangodb_revision=$(git cat-file blob $cmakelists_arangodb | grep ARANGODB_VERSION | head -n 3 | sed 's/^.*"\(.\)".*$/\1/' | tr '\n' '.')

  commit_date="$(date -d "$(git log -n1 --pretty='format:%ci')" --utc +%Y%m%d_%H%M)"
  commit="$(git rev-parse --short HEAD)"

  printf "%sd%s.%s" "$arangodb_revision" "$commit_date" "$commit"
}

if [ $_shallow_git_copy ] ; then
  # 'prepare' downloads a shallow copy of the repo. A shallow copy
  # only contains few commits of the original repo and not its entire history,
  # which reduces (in some cases, like this) the download's size/time
  prepare() {
    # downloading/updating local repo from $_git
    if [[ -d "$startdir/$_pkgname" ]]; then
      git --git-dir="$startdir/$_pkgname" \
        fetch origin refs/heads/${_branch}:refs/heads/${_branch}
    else
      git clone --mirror --single-branch --branch "$_branch" --depth 1 \
                "$_git" "$startdir/$_pkgname"
    fi
  
    cd "$srcdir"
    # copying/updating repo to $srcdir
    if [[ -d "$_pkgname" ]]; then
      cd "$_pkgname"
      git pull origin "$_branch"
    else
      git clone "$startdir/$_pkgname" "$_pkgname"
    fi
  }
fi

build() {
  cd "$srcdir/$_pkgname"

  # creating a relative link to python2 because v8 needs Python 2 but uses
  # `python' instead of `python2' everywhere
  mkdir -p "$srcdir/python2-path"
  ln -sf /usr/bin/python2 "$srcdir/python2-path/python"
  export PATH="$srcdir/python2-path:$PATH"

  # creating building directory
  mkdir -p build
  cd build

  if [ $_clang ] ; then
    export CC=clang
    export CXX=clang++
  else
    export CC=gcc
    export CXX=g++
  fi

  # configuring compilation and path
  cmake .. \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DETCDIR=/etc \
    -DVARDIR=/var \
    -DCMAKE_C_COMPILER=${CC} \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_COMPILER=${CXX} \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DCMAKE_SKIP_RPATH:BOOL=ON \
    -DCMAKE_BUILD_TYPE=Release

  # replacing all `sbin' instances for `bin'
  sed -i 's/sbin/bin/' arangod/cmake_install.cmake

  make $_make_opts
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install

  # deleting init script
  rm -r "$pkgdir/etc/init.d"

  # installing systemd arango service
  install -Dm644 "$srcdir/arangodb.service" \
                 "$pkgdir/usr/lib/systemd/system/arangodb.service"
}

# vim:set ts=2 sw=2 et:
