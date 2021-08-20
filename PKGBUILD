# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.28.0
pkgrel=1
_jslibcommit='0a2ff12bedd55f5982fb8fe9102c4f20522f72e1'
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
sha512sums=('4c769e7f8164abb8bc63dde761453c4e09370550f7377c015d450f6d944de9ab9d5af02304a9779ba7ad694d68ddb8dd8cd669b1cf0a98a9ceecb5873f63a667'
            '686489c2a5d3847dc6e8c25bd7fb878fc82243cd20b83489ba89f129358c4715b5007d6526cd392383a9ddb84c57910b19fc6a3773fe56694e194c990c05dbd1'
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
