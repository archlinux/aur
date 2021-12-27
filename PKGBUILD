# Maintainer: lsf
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Steef Hegeman <mail@steefhegeman.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Julian Schacher <jspp@posteo.net>

_electron=electron13
pkgname=schildichat-desktop-git
_pkgname=schildichat-desktop
pkgver=1.9.7.sc.1.r1.8ada69c
pkgrel=1
pkgdesc="A Matrix client based on Element with a more traditional instant messaging experience"
arch=(x86_64)
url="https://schildi.chat"
license=(Apache)
conflicts=(schildichat-desktop schildichat-desktop-bin)
provides=(schildichat-desktop=${pkgver})
makedepends=(npm git yarn python rust sqlcipher ${_electron} nvm)
source=(git+https://github.com/SchildiChat/schildichat-desktop.git#branch=sc
        git+https://github.com/SchildiChat/matrix-js-sdk.git
        git+https://github.com/SchildiChat/matrix-react-sdk.git
        git+https://github.com/SchildiChat/element-web.git
        git+https://github.com/SchildiChat/element-desktop.git
        autolaunch.patch
        schildichat-desktop.desktop
        schildichat-desktop.sh)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e44bd0eec6693a08c368cbeb7707241221c77efa940d4100716c8cd1e1813724'
            '04610d85973c320d0fea5853c8a5fd55e701e9d31c0651bb9b698ed31546d3eb'
            'f928d6473446800cbbfea66945ffca5c953127a6c8b7d091fa32c31ef880905f')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/rc.\[0-9\]+-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${_pkgname}
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm install 14

  git submodule init
  git config submodule.matrix-js-sdk.url $srcdir/matrix-js-sdk
  git config submodule.matrix-react-sdk.url $srcdir/matrix-react-sdk
  git config submodule.element-web.url $srcdir/element-web
  git config submodule.element-desktop.url $srcdir/element-desktop
  git submodule update

  # Specify electron version in launcher
  sed -i "s|@ELECTRON@|${_electron}|" ../schildichat-desktop.sh

  _electron_dist=/usr/lib/${_electron}
  _electron_ver=$(cat ${_electron_dist}/version)

  cd element-desktop
  patch -p1 < ${srcdir}/autolaunch.patch
  sed -i 's|"target": "deb"|"target": "dir"|' package.json
  sed -i "s|\"electronVersion\": \"13.5.2\"|\"electronVersion\": \"${_electron_ver}\"|" package.json
  sed -i 's|"https://packages.element.io/desktop/update/"|null|' element.io/release/config.json
  cd ${srcdir}/${_pkgname}
  make setup
}

build() {
  cd ${srcdir}/${_pkgname}
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm use 14

  # yarn --cwd element-desktop run build:64 --linux -c.linux.target=dir -c.electronDist=${_electron_dist} -c.electronVersion=${_electron_ver}
  # let's use the ready-made build script instead - otherwise, we'd have to do a lot more work to get the webapp build etc.
  make pacman
}


package() {
  cd ${srcdir}/${_pkgname}

  install -d "${pkgdir}"/usr/lib/${_pkgname}

  cp -r element-desktop/dist/linux-unpacked/resources{,.pak} "${pkgdir}"/usr/lib/${_pkgname}/
  cp -r element-desktop/dist/linux-unpacked/locales "${pkgdir}"/usr/lib/${_pkgname}/

  # Required extras
  install -Dm644 ../schildichat-desktop.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm755 ../${_pkgname}.sh "${pkgdir}"/usr/bin/${_pkgname}

  # Icons
  install -Dm644 element-desktop/res/img/element.png "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/schildichat-desktop.png
  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 element-desktop/build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/schildichat-desktop.png
  done
}

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}
