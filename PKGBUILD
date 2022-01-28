# Maintainer: Camille 'DrasLorus' Monière <draslorus at draslorus dot fr>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ivelin Velkov <ivelin dot velkov at gmail dot com>

pkgname=teams-for-linux-git
pkgver=1.0.24.r0.g0b66032
pkgrel=1
pkgdesc="Unofficial Microsoft Teams client for Linux using Electron (develop branch)."
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/IsmaelMartinez/${pkgname%-git}"
license=("GPL3")
conflicts=("teams-for-linux")
provides=("teams-for-linux")
depends=("gtk3" "libxss" "nss" "electron13")
makedepends=("git" "nodejs-lts-fermium" "node-gyp" "python2" "yarn" "npm" "sed")
source=(
  "${pkgname%-git}::git+https://github.com/IsmaelMartinez/${pkgname%-git}#branch=develop"
  "${pkgname%-git}.desktop"
)
sha256sums=('SKIP'
            '9e9ea701b445953383b70133cb52ac6a6ec2872bba419b079a7d0ca13e50dac2')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_electronDist=/usr/lib/electron13
_electronVer="$(tail /usr/lib/electron13/version)"

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  sed -i "s/\"electron\": \".*\"/\"electron\": \"$_electronVer\"/g;s/\"yarn\": \".*\"/\"yarn\": \"$(yarn -v)\"/g" package.json
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  ELECTRON_SKIP_BINARY_DOWNLOAD=1 yarn install --non-interactive --pure-lockfile --cache-folder "${srcdir}/yarn-cache"
  if [[ ${CARCH} == "aarch64" ]]; then
    yarn electron-builder build --arm64 --linux -c.electronDist=$_electronDist -c.electronVersion=$_electronVer --dir
  elif [[ ${CARCH} == "armv7h" ]]; then
    yarn electron-builder build --armv7l --linux -c.electronDist=$_electronDist -c.electronVersion=$_electronVer --dir
  elif [[ ${CARCH} == "i686" ]]; then
    yarn electron-builder build --ia32 --linux -c.electronDist=$_electronDist -c.electronVersion=$_electronVer --dir
  elif [[ ${CARCH} == "x86_64" ]]; then
    yarn electron-builder build --x64 --linux -c.electronDist=$_electronDist -c.electronVersion=$_electronVer --dir
  fi
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin"

  if [[ ${CARCH} == "aarch64" ]]; then
    _unpacked_dirname="linux-arm64-unpacked"
  elif [[ ${CARCH} == "armv7h" ]]; then
    _unpacked_dirname="linux-armv7l-unpacked"
  elif [[ ${CARCH} == "i686" ]]; then
    _unpacked_dirname="linux-ia32-unpacked"
  elif [[ ${CARCH} == "x86_64" ]]; then
    _unpacked_dirname="linux-unpacked"
  fi

  cp -r --preserve=mode "${srcdir}/${pkgname%-git}/dist/${_unpacked_dirname}" "${pkgdir}/opt/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  for _file in "${srcdir}/${pkgname%-git}/build/icons/"*.png
  do
    _filename="$(basename ${_file})"
    install -Dm644 "${_file}" "${pkgdir}/usr/share/icons/hicolor/${_filename%.png}/apps/${pkgname%-git}.png"
  done
  ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
