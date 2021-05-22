# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.26.4
pkgrel=1
_jslibcommit='62beab8d8f5b85e2d960b6dc80ba8190d672aa72'
_nodeversion='14.17.0'
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
sha512sums=('03d15cc813349c64b52b3618743f7aa28fb949614194d166022c3508d151abffc8916734ffce0d2bc959ea52ccca356a28a787aa2ee7f21ac45f1bb6d9133bf1'
            'b95f94e6c358d491791785e558caad3f06808f205fc6b9ed1240ef280caedecb29bb8b101d801aaa41564fb86485df82cd0d5ab228fcccb34356f628d034b4b9'
            '9d5b67c534cca77c62c7965a26f44a447611f38d4c8d57fdc1689b606ad2c1e7bbb7db4a50f185db4023478aed97015497bfd9dcd4ab62c4e8370b74ae458ced'
            '32c29a7baed80351acf5753d35df404a818d5c88cc85f3bbed2daa5351aaf0dba20fd03cbedbcb407324f305d4556adb476ecc9ccd07bac0511ca4a943020ea4'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  # Link jslib
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  cd "${srcdir}/desktop-${pkgver}"

  # Patch out postinstall routines
  patch --strip=1 package.json ${srcdir}/package.json.patch

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
