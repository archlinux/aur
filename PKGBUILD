# Maintainer: TurboPunk <turbopunk@telenet.be>
# Contributor: José San Juan <josesj@gmail.com>
pkgname=snapmaker-luban
pkgver=4.7.3
pkgrel=1
pkgdesc="Snapmaker Luban is an easy-to-use 3-in-1 software tailor-made for Snapmaker machines."
url="https://github.com/Snapmaker/Luban"
license=('AGPL v3')
arch=('x86_64')
makedepends=('npm' 'nvm' 'jq' 'yq' 'moreutils' 'fontconfig' 'ruby' 'libxcrypt-compat')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}


prepare() {
  cd ${srcdir}/Luban
  git checkout tags/v${pkgver}
  sed -i -e 's/:/\//g' .gitmodules
  sed -i -e 's/git@/https:\/\//g' .gitmodules
  git submodule sync --recursive
  git submodule update --init --recursive
  _ensure_local_nvm
  nvm install 16
  cd ${srcdir}/Luban
  jq '.scripts."build:linux-x64"="bash -c '\''build/electron-builder.sh --linux --x64 --config electron-builder.yml'\''"' package.json | sponge package.json
  yq '.linux.target="pacman"' electron-builder.yml | sponge electron-builder.yml
}

build() {
  _ensure_local_nvm
  export PATH=$PATH:node_modules/.bin
  cd ${srcdir}/Luban
  nvm use 16
  npm install --cache "${srcdir}/npm-cache" -g npm@latest
  npm install --cache "${srcdir}/npm-cache"
  npm run build
  #npm run electron-builder
  npm run build:linux-x64
}

package() {
  mv ${srcdir}/Luban/output/${pkgname}-${pkgver}-linux-x64.pacman ${srcdir}/Luban/output/${pkgname}-${pkgver}.tar.xz
  tar xf ${srcdir}/Luban/output/${pkgname}-${pkgver}.tar.xz --exclude='.*' -C ${pkgdir}
  chown -R root:root "${pkgdir}"
}
