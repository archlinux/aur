# Maintainer: Afri 5chdn <aur@cach.co>

pkgname=mist-git
_pkgname=mist
pkgver=0.8.r1.g83b87bf
pkgrel=1
pkgdesc="Mist dapp browser and Ethereum wallet (git version)."
arch=('i686' 'x86_64')
depends=(
  'gmp'
  'leveldb'
  'qt5-base'
  'qt5-declarative'
  'qt5-quickcontrols'
  'qt5-webengine'
  'readline'
  'gconf'
  'libnotify'
)
makedepends=(
  'nodejs'
  'npm'
  'meteor-js'
  'meteor-build-client'
  'gulp'
)
provides=(
  'geth'
  'mist'
  'libnode'
)
conflicts=(
  'geth'
  'geth-git'
  'go-ethereum'
  'go-ethereum-git'
  'mist'
  'libnode'
  'libnode-git'
)
optdepends=(
  'ethereum: The cpp-ethereum commandline client.'
)
url="https://github.com/ethereum/mist"
license=('GPL')
source=(
  "${pkgname}::git+https://github.com/ethereum/mist"
  "mist.desktop"
  "icon.png"
  "mist-pathfix.patch"
)
sha256sums=(
  "SKIP"
  "d044844dd8ef1fef2ced861e5a86bf0d9af1b06ade6965dab1f12dbc612da207"
  "f9dfeddf9730ab693e3dc69d6dd0ad48525de1e40e1c8fb46ed081a3e7bd5f93"
  "3b5837e569b0d7b5b510a3084788c13faa51c7ff3777fcbea5dbee697a24ec74"
)

pkgver() {
  cd ${srcdir}/${pkgname}
  git checkout -q develop
  git pull -q
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Building Mist...'
  cd ${srcdir}/${pkgname}
  git checkout develop
  git pull
  git submodule update --init
  git apply "${srcdir}/mist-pathfix.patch"
  npm install meteor-build-client
  npm install gulp
  npm install
  gulp update-nodes
  gulp mist --platform linux
}

package() {
  _arch="32"
  if [ "${CARCH}" = "x86_64" ]; then
    _arch="64"
  fi

  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/mist"
  cp -a "${srcdir}/${pkgname}/dist_mist/Mist-linux${_arch}/." "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/mist"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/mist.desktop" "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/Mist" "${pkgdir}/usr/bin/mist"
  ln -s "/usr/share/${_pkgname}/resources/node/geth/geth" "${pkgdir}/usr/bin/geth"

  install -Dm644 "${pkgdir}/usr/share/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/${_pkgname}/LICENSE"

  msg2 'Installing Libnode...'
  install -d "${pkgdir}/usr/lib"
  ln -s "/usr/share/${_pkgname}/libnode.so" "${pkgdir}/usr/lib/libnode.so"

  ln -sf "/usr/lib/libgcrypt.so.11" "${pkgdir}/usr/share/${_pkgname}/libgcrypt.so.11"
  ln -sf "/usr/lib/libnotify.so.4" "${pkgdir}/usr/share/${_pkgname}/libnotify.so.4"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/${_pkgname}/Mist"
  chmod 755 "${pkgdir}/usr/share/${_pkgname}/libnode.so"
  chmod 755 "${pkgdir}/usr/share/${_pkgname}/resources/node/geth/geth"
}
