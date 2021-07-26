# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.27.1
pkgrel=2
_jslibcommit='dbd92194ee4536d87bed5d89f39078e68c59a06c'
_nodeversion='14.17.3'
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
        "jslib-angular-package.json.patch"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('de2c476581cac6a8a875d3d6ff11e67cd74f4b1c5dcf00a98df4541b38b848382901dca1284940e4006fbb234bb43a69c24e3c945f73e71f0a448795c41136bf'
            '86eb6d0de6efb6f0e2d18c94787f3a4b881234c998407d03cc2ce6c1f5ae56033552e873dfa80d2357405ca2b772fbcfb3085196d7f83deadb02e2d7fe351ea3'
            'd884221c615db95d6fd0da2d3470fb7514b6a5d2a2b3b20c8353ebb4a938dc39f93783fe7ef2b9f69f034db8f26abfa479616f9fd1c1b241af605da837fba20e'
            '558abb27aa08c0838a4c49e1e8b2527eadc25c159c9ad677294d5278220ae25c850afaf0ceac9fb66993ea7fa0d18181735e9b20272cda06d5f3cf164b873d91'
            '32c29a7baed80351acf5753d35df404a818d5c88cc85f3bbed2daa5351aaf0dba20fd03cbedbcb407324f305d4556adb476ecc9ccd07bac0511ca4a943020ea4'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  # Link jslib
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  cd "${srcdir}/desktop-${pkgver}"

  # Apply package.json patches
  patch --strip=1 "${srcdir}/desktop-${pkgver}/package.json" ${srcdir}/package.json.patch
  # TODO(libertylocked): See https://github.com/bitwarden/jslib/issues/440
  patch --strip=1 "${srcdir}/jslib-${_jslibcommit}/angular/package.json" \
    ${srcdir}/jslib-angular-package.json.patch

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
