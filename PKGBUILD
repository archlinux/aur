# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ivelin Velkov <ivelin dot velkov at gmail dot com>

_pkgname=teams-for-linux
_pkgname_fork=teams-for-linux-koyu
pkgname=teams-for-linux-koyu-git
pkgver=0.0.9.r1.g1ae0cb1
pkgrel=1
pkgdesc="Unofficial Microsoft Teams client for Linux using Electron - koyu's fork (development version)"
arch=(aarch64 armv7h i686 x86_64)
url='https://git.koyu.space/koyu/teams-for-linux'
license=(GPL3)
depends=(gtk3 libxss nss)
makedepends=(node-gyp python2 yarn)
source=('git+https://git.koyu.space/koyu/teams-for-linux.git'
        "${_pkgname_fork}.desktop")
sha256sums=('SKIP'
            '5ec45dada00cb640e0fbf2c39f9a25aac40c706e1f96c7a5e54f27997e74bfe1')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./'
}

build() {
  cd "${srcdir}/${_pkgname}"
  yarn install --non-interactive --pure-lockfile --cache-folder "${srcdir}/yarn-cache"
  if [ "${CARCH}" = "aarch64" ]; then
    yarn build --arm64 --linux dir
  elif [ "${CARCH}" = "armv7h" ]; then
    yarn build --armv7l --linux dir
  elif [ "${CARCH}" = "i686" ]; then
    yarn build --ia32 --linux dir
  elif [ "${CARCH}" = "x86_64" ]; then
    yarn build --x64 --linux dir
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -r --preserve=mode "${srcdir}/${_pkgname}/dist/linux-unpacked" "${pkgdir}/opt/${_pkgname_fork}"
  install -Dm644 "${srcdir}/${_pkgname_fork}.desktop" "${pkgdir}/usr/share/applications/${_pkgname_fork}.desktop"
  _pkgver="$(git describe --abbrev=0 --tags | sed 's/^v//')"
  sed -i "s/%version%/${_pkgver}/" "${pkgdir}/usr/share/applications/${_pkgname_fork}.desktop"
  for _file in "${srcdir}/${_pkgname}/app/lib/assets/icons/"*.png; do
    _filename="$(basename ${_file})"
    install -Dm644 "${_file}" "${pkgdir}/usr/share/icons/hicolor/${_filename%.png}/apps/${_pkgname_fork}.png"
  done
  ln -sf "/opt/${_pkgname_fork}/teams" "${pkgdir}/usr/bin/${_pkgname_fork}"
}
