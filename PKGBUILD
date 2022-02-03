# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>
# Contributor: bruceutut <zttt183525594@gmail.com>

# 方法参考
# https://github.com/jiyeme/wechat-devtools
# https://github.com/dragonation/wechat-devtools
# https://github.com/cytle/wechat_web_devtools

_wechat_devtools_ver="1.05.2201240"
_wechat_devtools_url="https://dldir1.qq.com/WechatWebDev/release/p-ae42ee2cde4d42ee80ac60b35f183a99/wechat_devtools_1.05.2201240_x64.exe"
_wechat_devtools_md5="85552bae33e98eb186c5068419efce03"

_wechat_devtools_exe="wechat_devtools_${_wechat_devtools_ver}_x64.exe"
_nwjs_ver="0.53.1"
_install_dir="/opt/wechat-devtools"
_node_version="v16.1.0"

pkgname=wechat-devtools
pkgver="${_wechat_devtools_ver}"  # 主版本号
pkgrel=5   # 次版本号release
epoch=2    # 大版本迭代强制更新（维护者变更，尽量不用）
pkgdesc="WeChat Devtools Linux version. "
arch=("x86_64")
url="https://github.com/msojocs/wechat-devtools-linux"
license=('unknown')
depends=('wine' 'gconf' 'libxkbfile')
makedepends=('p7zip' 'nvm' 'python2')
source=("nwjs-v${_nwjs_ver}.tar.gz::https://npm.taobao.org/mirrors/nwjs/v${_nwjs_ver}/nwjs-sdk-v${_nwjs_ver}-linux-x64.tar.gz"
        "${_wechat_devtools_exe}::${_wechat_devtools_url}"
        "wechat-devtools.desktop"
        "fix-cli.sh"
        "fix-menu.sh"
        "rebuild-modules.sh"
        "fix-package-name-node"
        "logo.svg"
        "compiler.tar.xz::https://download.fastgit.org/msojocs/wechat-devtools-linux/releases/download/v0.6/compiler.tar.xz")
md5sums=(b6f49803c51d0abacca2d1e566c7fe19
         "${_wechat_devtools_md5}"
         a4dd86296db9aa6b55b048b43182d74f
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         88e0efe5d58444b3d39695d4fb16d61b
         c638ccefe09941372903c08ce70420c3)
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
    npm uninstall node-gyp -g
    npm install nw-gyp node-gyp npm@latest -g

    # node bin
    _log "copy node exectuable"
    cp "$(which node)" "${srcdir}/node.${_node_version}"

    # run fix scripts
    export NW_PACKAGE_DIR="${srcdir}/wechat_devtools/code/package.nw"
    export NW_VERSION=$_nwjs_ver
    export srcdir=$srcdir
    chmod 777 "${srcdir}/fix-package-name-node"
    for script in fix-package-name-node fix-cli.sh fix-menu.sh rebuild-modules.sh; do
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
