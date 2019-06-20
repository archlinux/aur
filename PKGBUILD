# Maintainer: Pierre Carru <aur at carru.fr>
# based on https://github.com/theia-ide/theia-apps/blob/master/theia-docker/Dockerfile#L8
# see also https://spectrum.chat/theia/general/how-to-package-the-browser-example-app~308c1998-2082-4063-ad99-0f1fd3b64d78

pkgname=theia-next
pkgver=20190620
pkgrel=2
arch=('any')
url='https://www.theia-ide.org/'
license=('EPL2')
depends=(nodejs)
makedepends=()

#_ms_python_version=2019.5.18875
#_ms_python_vsix="ms-python.python-${_ms_python_version}.vsix"

source=(
  "package.json"
)
#"${_ms_python_vsix}::https://github.com/microsoft/vscode-python/releases/download/${_ms_python_version}/ms-python-release.vsix"
sha1sums=('1e84fc34576beac0d376c9970af1d2403a6c731f')
#noextract=("${_ms_python_vsix}")
options=(!strip) #to speed up build

#prepare() {
  #mkdir -p plugins
  #mv ${_ms_python_vsix} plugins/
#}

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
  rm $pkgdir/opt/theia/yarn.lock
  rm $pkgdir/opt/theia/.yarnclean
  rm $pkgdir/opt/theia/package.json
}

