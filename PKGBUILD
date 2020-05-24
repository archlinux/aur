# Maintainer: ccat3 <c0ldcat3z@gmail.com>
# Contributor: bruceutut <zttt183525594@gmail.com>

# 方法参考
# https://github.com/dragonation/wechat-devtools
# https://github.com/cytle/wechat_web_devtools

_wechat_devtools_ver="1.02.2004020"
_wechat_devtools_url="https://dldir1.qq.com/WechatWebDev/nightly/p-ae42ee2cde4d42ee80ac60b35f183a99/wechat_devtools_1.02.2004020_x64.exe"

_wechat_devtools_exe="wechat_devtools_${_wechat_devtools_ver}_x64.exe"
_nwjs_ver="0.39.3"
_install_dir="/opt/wechat-devtools"
_node_version="v12.6.0"

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
source=("nwjs-v${_nwjs_ver}.tar.gz::https://npm.taobao.org/mirrors/nwjs/v${_nwjs_ver}/nwjs-sdk-v${_nwjs_ver}-linux-x64.tar.gz"
        "${_wechat_devtools_exe}::${_wechat_devtools_url}"
        "wechat-devtools.desktop"
        "wechat-devtools-menu.patch"
        "logo.svg")
md5sums=(cd439b0ff868e40c9664105cd0948bc3
         861d4f8c2a61922e3e675e8fd80ebf32
         1415f0460ade665a8beeb9e08ff2ee13
         2004852a5b1e63bda7752493c8fa38c8
         88e0efe5d58444b3d39695d4fb16d61b)
options=('!strip')

prepare() {
    7z x -owechat_devtools ${_wechat_devtools_exe}
}

_log() {
    echo -e "\e[1;34m$@\e[0m"
}

_rebuild_modules() {
    node_modules="${srcdir}/wechat_devtools/\$APPDATA/Tencent/微信开发者工具/package.nw/node_modules"

    for mod in spdlog-node oniguruma-node native-keymap native-watchdog
    do
        _log "rebuild $mod"
        cd ${node_modules}/${mod}
        npm install
    done

    for mod in spdlog oniguruma
    do
        _log "rebuild $mod"
        cd ${node_modules}/${mod}
        nw-gyp rebuild --target=${_nwjs_ver}
    done

    _log "rebuild vscode-ripgrep"
    cd ${node_modules}/vscode-ripgrep
    rm -rf bin
    npm install

    _log "rebuild nodegit"
    cd ${node_modules}/nodegit
    mkdir lib
    npm install
    npm run recompile

    _log "remove useless modules"
    rm -rf ${node_modules}/vscode-windows-ca-certs
}

build() {
    # prepare build env
    _log "prepare node ${_node_version}"
    unset npm_config_prefix
    source /usr/share/nvm/init-nvm.sh
    nvm ls ${_node_version} || nvm install ${_node_version}
    nvm use ${_node_version}

    # prepare nw-gyp
    _log "prepare nw-gyp"
    npm install nw-gyp -g

    ## link python2
    ## fix https://github.com/nwjs/nw-gyp/issues/122
    ln -s $(which python2) ${srcdir}/python 
    export PATH=${srcdir}:$PATH

    # fix modules
    _rebuild_modules

    # node bin
    _log "copy node exectuable"
    cp $(which node) ${srcdir}/node.${_node_version}
    
    # apply patchs
    _log "apply patchs"
    cd ${srcdir}/wechat_devtools
    patch -p1 < ${srcdir}/wechat-devtools-menu.patch

    # fix cli
    _log "fix cli"
    cd ${srcdir}/wechat_devtools/\$APPDATA/Tencent/微信开发者工具/package.nw
    sed -i 's#AppData/Local/\${global.userDirName}/User Data/Default#.config/\${global.userDirName}/Default#g' ./js/common/cli/index.js
    sed -i 's#USERPROFILE#HOME#g' ./js/common/cli/index.js

    # cleanup
    nvm deactivate
    _log "done"
}

package() {
    mkdir -p ${pkgdir}${_install_dir}
    cd ${pkgdir}${_install_dir}

    cp -r ${srcdir}/nwjs-sdk-v${_nwjs_ver}-linux-x64/* ./
    cp -r ${srcdir}/wechat_devtools/\$APPDATA/Tencent/微信开发者工具/package.nw ./package.nw
    find ./package.nw -type d | xargs -I {} chmod -R a+rx {}

    mkdir -p Tencent/微信开发者工具
    ln -s ../../package.nw Tencent/微信开发者工具/package.nw

    cp ${srcdir}/node.${_node_version} node
    ln -s node node.exe

    install -Dm644 "${srcdir}/wechat-devtools.desktop" "${pkgdir}/usr/share/applications/wechat-devtools.desktop"
    install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg"
}
