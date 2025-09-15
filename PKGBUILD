set -u

# Get latest version function
_get_latest_version() {
  # Method 1: Try GitHub releases API
  local latest=$(curl -s "https://api.github.com/repos/Trepan-Debuggers/bashdb/releases/latest" 2>/dev/null | \
                 grep '"tag_name"' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/' 2>/dev/null)
  
  # Method 2: Get latest git tag if API failed
  if [ "${latest:-null}" = "null" ] || [ "${latest:-}" = "" ]; then
    latest=$(git ls-remote --tags https://github.com/Trepan-Debuggers/bashdb.git 2>/dev/null | \
             grep -o 'refs/tags/[^/{}]*$' | sed 's/refs\/tags\///' | \
             grep -E '^[0-9]+\.[0-9]+' | sort -V | tail -1 2>/dev/null)
  fi
  
  echo "${latest}"
}

# Get version for build
_ver=$(_get_latest_version)

# Package definition
pkgname='bashdb-github-latest'
pkgver="${_ver//-/_}"
pkgrel='1'
pkgdesc='A debugger for Bash scripts (latest GitHub release)'
arch=('any')
url='https://github.com/Trepan-Debuggers/bashdb'
license=('GPL')
depends=("bash>=${_ver%%-*}" 'python-pygments')
makedepends=('texi2html' 'git')
provides=('bashdb')
conflicts=('bashdb' 'bashdb-git')

# Source setup
_srcdir="bashdb-${_ver}"
source=("bashdb-${_ver}.tar.gz::https://github.com/Trepan-Debuggers/bashdb/archive/refs/tags/${_ver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  set -u
  cd "${_srcdir}"
  
  echo "Building ${pkgname} with bashdb version: ${_ver}"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  
  echo "Current Bash version: $BASH_VERSION"
  
  # Generate configure if missing
  if [ ! -f configure ] && [ -f configure.ac ]; then
    autoreconf -fiv
  fi
  
  # IMPORTANT: Patch configure AFTER autoreconf (which regenerates it)
  if [ -f configure ]; then
    echo "Patching configure for newer Bash versions..."
    sed -i \
      -e "s/'5\.2' | '5\.0' | '5\.1'/'5.0' | '5.1' | '5.2' | '5.3' | '5.4' | '5.5'/g" \
      -e 's/Bash 5\.0 or 5\.1/Bash 5.0 or newer/g' \
      -e 's/This package is only known to work with Bash 5\.0 or 5\.1/This package works with Bash 5.0 and newer/g' \
      configure
    
    # Verify the patch worked
    if grep -q "5\.3.*5\.4" configure; then
      echo "✓ Version check successfully patched"
    else
      echo "⚠ Version patch may not have worked"
    fi
  fi
  
  if [ ! -s Makefile ]; then
    # Try normal configure first
    ./configure --prefix='/usr' --disable-static || {
      echo "Configure failed, trying with forced Bash version..."
      # Force configure to think we have Bash 5.1
      BASH_VERSION=5.1.0 ./configure --prefix='/usr' --disable-static
    }
  fi
  
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/info/dir"
  
  # Add version info file
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/doc/bashdb/VERSION" <<EOF
Package: ${pkgname}
Upstream Version: ${_ver}
Source: https://github.com/Trepan-Debuggers/bashdb
Built: $(date)
EOF
  set +u
}
set +u