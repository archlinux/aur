# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.28.1
pkgrel=1
_jslibcommit='61618d5e4c15db49f5d8dee2c2acc4e8c0f14b65'
_nodeversion='14.17.5'
pkgdesc='Bitwarden Desktop Application'
arch=('x86_64' 'aarch64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
makedepends=('git' 'npm' 'python2' 'nvm' 'jq' 'patch' 'pkgconf' 'make' 'gcc')
depends=('electron11' 'libnotify' 'libsecret' 'libxtst')
conflicts=('bitwarden-git' 'bitwarden-bin')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/desktop/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        "package.json.patch"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('3faf37602a7261d5a92aee69b94c99e13c3182b207699520204afe69bc52d4637e88d0f88e8ce699596adab8c0dcb06405ea7a8363a391f90b62d562bee42230'
            '7d9818e6cd1c8379439051912c52206436e8cd6a709415b08c222fc4b5ca125771b2157a943cd4ff12285a036a21bdfe495225162630fba9a626c01037d1caed'
            'd884221c615db95d6fd0da2d3470fb7514b6a5d2a2b3b20c8353ebb4a938dc39f93783fe7ef2b9f69f034db8f26abfa479616f9fd1c1b241af605da837fba20e'
            '32c29a7baed80351acf5753d35df404a818d5c88cc85f3bbed2daa5351aaf0dba20fd03cbedbcb407324f305d4556adb476ecc9ccd07bac0511ca4a943020ea4'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  # Link jslib
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  cd "${srcdir}/desktop-${pkgver}"

  # Apply package.json patches
  patch --strip=1 "${srcdir}/desktop-${pkgver}/package.json" ${srcdir}/package.json.patch

  # Patch build to make it work with system electron
  local system_electron_version=$(pacman -Q electron11 | cut -d' ' -f2 | cut -d'-' -f1)
  jq < package.json --arg ver $system_electron_version\
  '.build["electronVersion"]=$ver | .build["electronDist"]="/usr/lib/electron11"'\
  > package.json.patched
  mv package.json.patched package.json
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  local npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install ${_nodeversion} && nvm use ${_nodeversion}

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  cd "${srcdir}/desktop-${pkgver}/jslib"
  npm install
  cd "${srcdir}/desktop-${pkgver}/jslib/common"
  npm install --only=dev
  cd "${srcdir}/desktop-${pkgver}/jslib/angular"
  npm install
  cd "${srcdir}/desktop-${pkgver}"
  npm install
  npm run build
  npm run clean:dist
  npx electron-builder build --dir

  # Restore node config from nvm
  npm config set prefix "${npm_prefix}"
  nvm unalias default
}

package() {
  cd "${srcdir}/desktop-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"

  if [ $CARCH == "aarch64" ]; then
    cp -r dist/linux-arm64-unpacked/resources "${pkgdir}/usr/lib/${pkgname}/"
  else
    cp -r dist/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}/"
  fi
  
  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  for i in 16 32 48 64 128 256 512; do
    install -Dm644 resources/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dm644 resources/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/bitwarden-desktop"

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
