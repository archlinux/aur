# Maintainer: Pierre Carru <aur at carru.fr>
# based on https://github.com/theia-ide/theia-apps/blob/master/theia-docker/Dockerfile#L8
# see also https://spectrum.chat/theia/general/how-to-package-the-browser-example-app~308c1998-2082-4063-ad99-0f1fd3b64d78

pkgname=theia-next
pkgver=20191025
pkgrel=1
arch=('any')
url='https://www.theia-ide.org/'
license=('EPL2')
depends=(nodejs)
makedepends=()

_ms_python_version=2019.5.18875
_ms_python_vsix="ms-python.python-${_ms_python_version}.vsix"

_ms_go_version=0.11.0
_ms_go_vsix="Go-${_ms_go_version}.vsix"

source=(
  "theia"
  "package.json"
  "${_ms_python_vsix}::https://github.com/microsoft/vscode-python/releases/download/${_ms_python_version}/ms-python-release.vsix"
  "${_ms_go_vsix}::https://github.com/microsoft/vscode-go/releases/download/${_ms_go_version}/Go-${_ms_go_version}.vsix"
)
sha1sums=('1155980968a6c82fe8a77c29284761bb0de63785'
          '1e84fc34576beac0d376c9970af1d2403a6c731f'
          '2b0672378cbc96e5cfa778b19b8f0ae92f67686a'
          '5e8066e914792f8d2793e495ce386cd6b2df1afa')
noextract=("${_ms_python_vsix}")
options=(!strip) #to speed up build

prepare() {
  mkdir -p plugins
  mv ${_ms_python_vsix} plugins/
  mv ${_ms_go_vsix} plugins/
}

build() {
  mkdir -p node_modules

  npx yarn
  NODE_OPTIONS="--max_old_space_size=4096" npx yarn theia build

  npx yarn --production --offline
  npx yarn autoclean --init
  echo *.ts >> .yarnclean
  echo *.ts.map >> .yarnclean
  echo *.spec.* >> .yarnclean
  npx yarn autoclean --force
}

package() {
  mkdir -p $pkgdir/opt/
  cp -RL $PWD $pkgdir/opt/theia

  rm $pkgdir/opt/theia/webpack.config.js
  #rm $pkgdir/opt/theia/yarn.lock
  rm $pkgdir/opt/theia/.yarnclean
  #rm $pkgdir/opt/theia/package.json

  install -Dm755 theia "$pkgdir/usr/bin/theia"
}

