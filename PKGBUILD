# Maintainer: ccat3z <c0ldcat3z@gmail.com>
# Contributor: bruceutut <zttt183525594@gmail.com>

# 方法参考
# https://github.com/dragonation/wechat-devtools
# https://github.com/cytle/wechat_web_devtools

_wechat_devtools_ver="1.03.2006090"
_wechat_devtools_url="https://dldir1.qq.com/WechatWebDev/nightly/p-ae42ee2cde4d42ee80ac60b35f183a99/wechat_devtools_1.03.2006090_x64.exe"
_wechat_devtools_md5="50de8cfaa7067be07248510123b7b409"

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
        "fix-cli.sh"
        "fix-menu.sh"
        "rebuild-modules.sh"
        "logo.svg")
md5sums=(cd439b0ff868e40c9664105cd0948bc3
         "${_wechat_devtools_md5}"
         1415f0460ade665a8beeb9e08ff2ee13
         "SKIP"
         "SKIP"
         "SKIP"
         88e0efe5d58444b3d39695d4fb16d61b)
options=('!strip')

prepare() {
    7z x -owechat_devtools ${_wechat_devtools_exe}
}

_log() {
    echo -e "\e[1;34m$@\e[0m"
}

build() {
    # prepare node
    _log "prepare node ${_node_version}"
    unset npm_config_prefix
    source /usr/share/nvm/init-nvm.sh
    nvm ls ${_node_version} || nvm install ${_node_version}
    nvm use ${_node_version}

    # prepare nw-gyp
    _log "prepare nw-gyp"
    npm install nw-gyp -g

    # node bin
    _log "copy node exectuable"
    cp "$(which node)" "${srcdir}/node.${_node_version}"

    # prepare python2
    # fix https://github.com/nwjs/nw-gyp/issues/122
    ln -sf $(which python2) ${srcdir}/python 
    export PATH=${srcdir}:$PATH

    # run fix scripts
    export NW_PACKAGE_DIR="${srcdir}/wechat_devtools/code/package.nw"
    export NW_VERSION=$_nwjs_ver
    for script in fix-cli.sh fix-menu.sh rebuild-modules.sh; do
        _log "run ${script}"
        "${srcdir}/${script}"
    done

    # cleanup
    nvm deactivate
    _log "done"
}

package() {
    mkdir -p "${pkgdir}${_install_dir}"
    cd "${pkgdir}${_install_dir}"

    cp -r "${srcdir}/nwjs-sdk-v${_nwjs_ver}-linux-x64/"* ./
    cp -r "${srcdir}/wechat_devtools/code/package.nw" ./package.nw
    find ./package.nw -type d | xargs -I {} chmod -R a+rx {}

    cp ${srcdir}/node.${_node_version} node
    ln -s node node.exe

    install -Dm644 "${srcdir}/wechat-devtools.desktop" "${pkgdir}/usr/share/applications/wechat-devtools.desktop"
    install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg"
}
