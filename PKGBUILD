# Maintainer: ccat3 <c0ldcat3z@gmail.com>
# Contributor: bruceutut <zttt183525594@gmail.com>

# 方法来自https://github.com/cytle/wechat_web_devtools重新打包

_wechat_devtools_ver="1.02.1911180"
_wechat_devtools_url="https://dldir1.qq.com/WechatWebDev/nightly/p-ae42ee2cde4d42ee80ac60b35f183a99/wechat_devtools_1.02.1911180_x64.exe"

_wechat_devtools_exe="wechat_devtools_${_wechat_devtools_ver}_x64.exe"
_nwjs_ver="0.38.0"
_install_dir="/opt/wechat-devtools"
_node_version="v11.14.0"

pkgname=wechat-devtools
pkgver=${_wechat_devtools_ver}
pkgrel=1
epoch=2
pkgdesc="WeChat Devtools Linux version."
arch=("x86_64")
url="https://mp.weixin.qq.com/debug/wxadoc/dev/devtools/devtools.html"
license=('unknown')
depends=('wine' 'gconf')
makedepends=('p7zip' 'nvm' 'python2')
source=("nwjs.tar.gz::https://npm.taobao.org/mirrors/nwjs/v${_nwjs_ver}/nwjs-sdk-v${_nwjs_ver}-linux-x64.tar.gz"
        "${_wechat_devtools_exe}::${_wechat_devtools_url}"
        "wechat-devtools.desktop"
        "logo.svg")
md5sums=(3ad6fb08c23f1880b5779fe88bbd8eaa
         0d63deb617d89aed0415a3ff48b6d1c9
         1415f0460ade665a8beeb9e08ff2ee13
         88e0efe5d58444b3d39695d4fb16d61b)
options=('!strip')

prepare() {
    7z x -owechat_devtools ${_wechat_devtools_exe}
}

build() {
    unset npm_config_prefix
    source /usr/share/nvm/init-nvm.sh
    nvm install ${_node_version}
    nvm use ${_node_version}

    # node bin
    cp $(which node) node

    # fix cli
    cd ${srcdir}/wechat_devtools/\$APPDATA/Tencent/微信开发者工具/package.nw
    sed -i 's#AppData/Local/\${global.userDirName}/User Data/Default#.config/\${global.userDirName}/Default#g' ./js/common/cli/index.js
    sed -i 's#USERPROFILE#HOME#g' ./js/common/cli/index.js
}

package() {
    mkdir -p ${pkgdir}${_install_dir}
    cd ${pkgdir}${_install_dir}
    cp -r ${srcdir}/nwjs-sdk-v${_nwjs_ver}-linux-x64/* ./
    cp -r ${srcdir}/wechat_devtools/\$APPDATA/Tencent/微信开发者工具/package.nw ./package.nw
    mkdir -p Tencent/微信开发者工具
    ln -s ../../package.nw Tencent/微信开发者工具/package.nw
    find ./package.nw -type d | xargs chmod -R a+rx
    cp ${srcdir}/node node
    ln -s node node.exe

    install -Dm644 "${srcdir}/wechat-devtools.desktop" "${pkgdir}/usr/share/applications/wechat-devtools.desktop"
    install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg"
}
