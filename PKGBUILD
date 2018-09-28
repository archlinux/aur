# Maintainer: ccat3 <c0ldcat3z@gmail.com>
# Contributor: bruceutut <zttt183525594@gmail.com>

# 方法来自https://github.com/cytle/wechat_web_devtools重新打包

_wechat_devtools_release_date="201809260"
_wechat_devtools_ver="1.02.1809260"
_nwjs_ver="0.24.4"
_arch="x64"
_install_dir="/opt/wechat-devtools"
_node_version="v8.11.3"

pkgname=wechat-devtools
pkgver=${_wechat_devtools_ver}
pkgrel=1
epoch=2
pkgdesc="WeChat Devtools Linux version."
arch=("x86_64")
url="https://mp.weixin.qq.com/debug/wxadoc/dev/devtools/devtools.html"
license=('unknown')
depends=('wine')
makedepends=('p7zip' 'nvm')
source=("nwjs.tar.gz::https://npm.taobao.org/mirrors/nwjs/v${_nwjs_ver}/nwjs-sdk-v${_nwjs_ver}-linux-${_arch}.tar.gz"
        "wechat_devtools.exe::https://dldir1.qq.com/WechatWebDev/1.0.0/${_wechat_devtools_release_date}/wechat_devtools_${_wechat_devtools_ver}_x64.exe"
        "wechat-devtools.desktop"
        "logo.svg")
md5sums=(82f20fe9081201db81652eb066c29f9b
         6d06313c3bdd517467528588ae1a0817
         8ce0ac4c3dd29535290970145cd919ae
         de6f2f282e6d813100474d75d8abfeb9)
options=('!strip')

prepare() {
    7z x -owechat_devtools wechat_devtools.exe
}

build() {
  unset npm_config_prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install ${_node_version}
  nvm use ${_node_version}

  cp $(which node) node

  cd ${srcdir}/wechat_devtools/\$APPDATA/Tencent/微信web开发者工具/package.nw
  sed -ri -e 's/f\.isMac\?"node-sync-ipc":"node-sync-ipc-nwjs"/"node-sync-ipc"/g' ./js/*.js
  sed -i 's#-load-extension=\./js#-load-extension=./package.nw/js#' package.json

  # rebuild node-sync-ipc
  cd ./node_modules/node-sync-ipc
  npm run install

  nvm deactivate
}

package() {
    mkdir -p ${pkgdir}${_install_dir}
    cd ${pkgdir}${_install_dir}
    cp -r ${srcdir}/nwjs-sdk-v${_nwjs_ver}-linux-${_arch}/* ./
    cp -r ${srcdir}/wechat_devtools/\$APPDATA/Tencent/微信web开发者工具/package.nw ./package.nw
    find ./package.nw -type d | xargs chmod -R a+rx
    cp ${srcdir}/node node
    ln -s node node.exe

    install -Dm644 "${srcdir}/wechat-devtools.desktop" "${pkgdir}/usr/share/applications/wechat-devtools.desktop"
    install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg"
}
