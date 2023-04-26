# Maintainer: mynacol <dc07d (ät) mynacol (dót) xyz>
# Previous contributors of schildichat-desktop-git:
# Contributor: lsf <lsf (at) pfho (dot) net>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Steef Hegeman <mail@steefhegeman.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Julian Schacher <jspp@posteo.net>

_electron=electron21
pkgname=schildichat-desktop
pkgver=1.11.30.sc.1
pkgrel=1
pkgdesc="A Matrix client based on Element with a more traditional instant messaging experience"
arch=(x86_64)
url="https://schildi.chat"
license=(Apache)
makedepends=(npm git yarn python rust tcl nvm make libxcrypt-compat)
depends=(${_electron})
source=(git+https://github.com/SchildiChat/schildichat-desktop.git#tag=v${pkgver/.sc./-sc.}
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
            '20533d63ffadf03dbfd173e6d4f1f1048746a628db7b2a70f5bc02390e812302'
            '6450af411fea039cb76357ff4ea7f1ef336601315de4d27b848a75d7960cef17'
            'da41f71e000cd64f8da66725c0ff95bbf525d5d5f953a93f355ea8d9f5f6ef53')

prepare() {
  cd "${srcdir}/${pkgname}"
  export HOME="$srcdir/"
  _ensure_local_nvm
  nvm install 16

  git submodule init
  git config submodule.matrix-js-sdk.url "$srcdir/matrix-js-sdk"
  git config submodule.matrix-react-sdk.url "$srcdir/matrix-react-sdk"
  git config submodule.element-web.url "$srcdir/element-web"
  git config submodule.element-desktop.url "$srcdir/element-desktop"
  git -c protocol.file.allow=always submodule update

  # Specify electron version in launcher
  sed -i "s|@ELECTRON@|${_electron}|" ../schildichat-desktop.sh

  cd element-desktop
  patch -p1 < "${srcdir}/autolaunch.patch"
  cd "${srcdir}/${pkgname}"
  make setup
}

build() {
  cd "${srcdir}/${pkgname}"
  export HOME="$srcdir/"
  _ensure_local_nvm

  _electron_dist=/usr/lib/${_electron}
  _electron_ver=$(cat ${_electron_dist}/version)

  make desktop-common
  yarn --cwd element-desktop run build:64 --linux -c.linux.target=dir -c.electronDist=${_electron_dist} -c.electronVersion=${_electron_ver}
}


package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}"/usr/lib/${pkgname}

  cp -r element-desktop/dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/${pkgname}/

  # Required extras
  install -Dm644 ../schildichat-desktop.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm755 ../${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}

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
