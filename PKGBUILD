# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Paulequilibrio
# Contributor: JKA Network <contacto@jkanetwork.com>
# Contributor: Todor Imreorov for github <blurymind@gmail.com>

## useful links
# https://gdevelop.io/
# https://github.com/4ian/GDevelop

: ${_install_path:='opt/gdevelop'}
: ${_nodeversion:=18}

_pkgname="gdevelop"
pkgname="$_pkgname"
pkgver=5.3.201.wip
pkgrel=1
pkgdesc="Game engine designed to be used by everyone"
url="https://github.com/4ian/GDevelop"
license=('MIT')
arch=('x86_64' 'riscv64')

depends=(
  #'desktop-file-utils'
  #'gcc'
  #'glew'
  #'gtk-update-icon-cache'
  #'libjpeg-turbo'
  #'libsndfile'
  #'openal'
  #'p7zip'
  #'systemd'
  #'wxwidgets-gtk3'
)
makedepends=(
  #'curl'
  #'git'
  #'rsync'
  'cmake'
  'emscripten'
  'electron'

  # AUR
  'nvm'
)

_pkgver="${pkgver//\.[a-z]*/}"
_pkgsrc="GDevelop-$_pkgver"
_pkgext=tar.gz
source=(
  "$_pkgname-$_pkgver.$_pkgext"::"$url/archive/refs/tags/v$_pkgver.$_pkgext"
  'gdevelop.desktop'
)
sha256sums=(
  'a31694af1e15ceeeaffa1bff869910941a7e9d41f3cfb0e6f953729d5123971f'
  '92886c0d8227e72096b8fb9e053c26ecdeecef788e64c47afd4ee196b790f9c2'
)

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  export SYSTEM_ELECTRON_VERSION=$(< /usr/lib/electron/version)
  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

build() {
  _nvm_env

  # output folder
  mkdir -p "$_pkgsrc/Binaries/build"

  local _cmake_options=(
    -B "$_pkgsrc/Binaries/build"
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    #-DCMAKE_INSTALL_PREFIX='/usr'
    -DGD_INSTALL_PREFIX="$_install_path"
    -DBUILD_TESTS=FALSE
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  make -C "$_pkgsrc/Binaries/build"

  cd "$srcdir/$_pkgsrc/GDevelop.js"
  npm install --no-audit --no-fund --prefer-offline
  #npm run-script build

  cd "$srcdir/$_pkgsrc/newIDE/app"
  npm install --no-audit --no-fund --prefer-offline

  cd "$srcdir/$_pkgsrc/newIDE/electron-app"
  npm install --no-audit --no-fund --prefer-offline
  npm exec -c "electron-builder --linux --x64 --dir --publish never -c.electronDist='/usr/lib/electron' -c.electronVersion=${SYSTEM_ELECTRON_VERSION}"
}

package() {
  install -Dm755 "$_pkgsrc/Binaries/Output/Release_Linux/libGDCore.so" -t "$pkgdir/$_install_path/swiftshader"
  install -Dm755 "$_pkgsrc/Binaries/Output/Release_Linux/JsPlatform/libGDJS.so" -t "$pkgdir/$_install_path/swiftshader"

  cp --reflink=auto -r -a --no-preserve=ownership "$srcdir/$_pkgsrc"/newIDE/electron-app/dist/linux-unpacked/* "$pkgdir/$_install_path/"

  install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/$_pkgsrc/Core/docs/images/glogo.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
