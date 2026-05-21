# Maintainer: jesus <jesusaiyan@gmail.com>
pkgname=lostorm-git
pkgver=7.2.3
pkgrel=1
pkgdesc="Privacy-enhanced Firestorm Second Life viewer (hardware ID spoofing per account)"
arch=('x86_64')
url="https://git.allthefallen.moe/lostorm/lostorm"
license=('LGPL2.1')
provides=('lostorm')
conflicts=('lostorm')
depends=(
  'libpulse'
  'mesa'
  'libxinerama'
  'libxrandr'
  'fontconfig'
  'freetype2'
  'openssl'
  'dbus'
  'gtk3'
  'nss'
  'at-spi2-atk'
  'libxss'
  'libxtst'
  'libxkbcommon'
  'alsa-lib'
)
makedepends=(
  'git'
  'cmake'
  'gcc11'
  'python-pip'
  'python-virtualenv'
  'base-devel'
  'glu'
)
options=('!strip' '!buildflags')

# Primary source + mirrors (tried in order if primary fails)
_sources=(
  "https://git.allthefallen.moe/lostorm/lostorm.git"
  "https://codeberg.org/lostorm/lostorm.git"
  "https://gitlab.com/lostorm/lostorm.git"
)

source=("fs-build-variables::git+https://github.com/FirestormViewer/fs-build-variables.git")
sha256sums=('SKIP')

_clone_lostorm() {
  if [ -d "$srcdir/lostorm/.git" ]; then
    echo "==> Updating existing lostorm clone..."
    git -C "$srcdir/lostorm" pull --depth=1
    return
  fi
  for _url in "${_sources[@]}"; do
    echo "==> Cloning lostorm from $_url ..."
    git clone --depth=1 "$_url" "$srcdir/lostorm" && return
    rm -rf "$srcdir/lostorm"
  done
  echo "ERROR: All lostorm mirrors failed"
  return 1
}

pkgver() {
  _clone_lostorm >/dev/null 2>&1
  local _ver
  _ver=$(cat "$srcdir/lostorm/indra/newview/VIEWER_VERSION.txt" | tr -d '[:space:]')
  local _rev
  _rev=$(git -C "$srcdir/lostorm" rev-list --count HEAD)
  local _hash
  _hash=$(git -C "$srcdir/lostorm" rev-parse --short HEAD)
  echo "${_ver}.r${_rev}.${_hash}"
}

prepare() {
  _clone_lostorm
  python -m venv "$srcdir/.venv"
  # shellcheck disable=SC1091
  source "$srcdir/.venv/bin/activate"
  pip install --upgrade pip --quiet
  pip install -r "$srcdir/lostorm/requirements.txt" --quiet
}

build() {
  # shellcheck disable=SC1091
  source "$srcdir/.venv/bin/activate"
  export AUTOBUILD_VARIABLES_FILE="$srcdir/fs-build-variables/variables"
  export CC=gcc-11
  export CXX=g++-11

  cd "$srcdir/lostorm"
  autobuild configure -A 64 -c ReleaseFS_open -- -DLL_TESTS:BOOL=FALSE
  autobuild build -A 64 -c ReleaseFS_open -- -DLL_TESTS:BOOL=FALSE --package
}

package() {
  local _built="$srcdir/lostorm/build-linux-x86_64/newview/packaged"

  install -d "$pkgdir/opt/lostorm"
  cp -r "$_built"/. "$pkgdir/opt/lostorm/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/lostorm/firestorm "$pkgdir/usr/bin/lostorm"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/lostorm.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=LOstorm
Exec=/opt/lostorm/firestorm
Comment=Privacy-enhanced Second Life viewer
Icon=/opt/lostorm/firestorm_icon.png
Categories=Network;
Terminal=false
EOF

  chmod -R a-x,a+X "$pkgdir/opt/lostorm/"
  chmod +x "$pkgdir/opt/lostorm/firestorm"
  find "$pkgdir/opt/lostorm/" -name "*.so*" -exec chmod +x {} \;
  find "$pkgdir/opt/lostorm/bin" -type f -exec chmod +x {} \; 2>/dev/null || true
}
