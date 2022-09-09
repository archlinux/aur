# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>
# Contributor: bruceutut <zttt183525594@gmail.com>

# 方法参考
# https://github.com/msojocs/wechat-web-devtools-linux
# https://github.com/dragonation/wechat-devtools
# https://github.com/cytle/wechat_web_devtools

_wechat_devtools_ver="1.06.2208010"
# https://servicewechat.com/wxa-dev-logic/download_redirect?type=x64&from=mpwiki&download_version=1052203030&version_type=1
_wechat_devtools_url="https://servicewechat.com/wxa-dev-logic/download_redirect?type=x64&from=mpwiki&download_version=${_wechat_devtools_ver//\./}&version_type=1"
# _wechat_devtools_url="https://dldir1.qq.com/WechatWebDev/release/p-ae42ee2cde4d42ee80ac60b35f183a99/wechat_devtools_1.05.2201240_x64.exe"
_wechat_devtools_md5="0073a70263614777fc41f21afbfc377d"

_wechat_devtools_exe="wechat_devtools_${_wechat_devtools_ver}_x64.exe"
_nwjs_ver="0.55.0"
_install_dir="/opt/wechat-devtools"
_node_version="16.4.2"

pkgname=wechat-devtools
pkgver="${_wechat_devtools_ver}"  # 主版本号
pkgrel=1   # 修订版本号release
epoch=2    # 大版本迭代强制更新（维护者变更，尽量不用）
pkgdesc="WeChat Devtools For Linux. "
arch=("x86_64")
url="https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html"
license=('unknown')
depends=('gconf' 'libxkbfile')
makedepends=('p7zip' 'python2' 'openssl' 'gcc' 'make' 'libssh2' 'krb5')
# compiler 用于可视化,以及编译
source=("nwjs-v${_nwjs_ver}.tar.gz::https://npm.taobao.org/mirrors/nwjs/v${_nwjs_ver}/nwjs-sdk-v${_nwjs_ver}-linux-x64.tar.gz"
        "${_wechat_devtools_exe}::${_wechat_devtools_url}"
        "node-v${_node_version}.tar.gz::https://npm.taobao.org/mirrors/node/v${_node_version}/node-v${_node_version}-linux-x64.tar.gz"
        "compiler-v${_wechat_devtools_ver}-${pkgrel}.tar.gz::https://github.com/msojocs/wechat-web-devtools-linux/releases/download/v${_wechat_devtools_ver}-${pkgrel}/compiler.tar.gz"
        "wechat-devtools.desktop"
        "logo.svg"
        "wechat-devtools"
        "wechat-devtools-cli"
        "fix-cli.sh"
        "fix-menu.sh"
        "fix-core.sh"
        "rebuild-node-modules.sh"
        "fix-package-name.js"
        "wxvpkg_pack.js"
        "wxvpkg_unpack.js"
        "fix-other.sh")
md5sums=('ac7680788544c457daee11aaf69798fe'
         '4312c9cd7b7be4a95f7b71d3311b19e4'
         '4d14589085ebbf79ce504dc27330d33b'
         'd6eb02f0d31b25e82812784b4147b9c5'
         '4d3f5273be80a74741c841fcfa4185d3'
         '0f4353664123320280ea4d6bb295dce2'
         'ae685283b21becd9c097aca4571f7556'
         '912b5948dc8a968e1b53390173c9d363'
         '951538b31000bf541446502069dcd92f'
         '468facecd8c3a4fbf4da03b5ceae1320'
         'e7735636b20240bcb1d61c1ac0085643'
         '8adadb9176aed175d85f271929e0055c'
         'd43f68ce696b5dad3ea4e7ff89b9d4ad'
         '38f8ed65b632c50ee5cef1231984f224'
         '005ce9329dfbd97106daab0f2ca4a90e'
         '5b24e5f379987f008bacda92d77fb2c8')
options=('!strip')

prepare() {
    7z x -owechat_devtools ${_wechat_devtools_exe} code/package.nw
    mv wechat_devtools/code/package.nw package.nw
    rm -rf wechat_devtools
    ls | grep node-*linux* | xargs -I{} mv {} node
    ls | grep nwjs-*linux* | xargs -I{} mv {} nwjs

    mkdir -p tools
    for file in *.js *.sh; do
        mv $file tools;
    done
}

_log() {
    echo -e "\e[1;34m$@\e[0m"
}

build() {
    # prepare node
    _log "prepare node v${_node_version}"
    export PATH="$srcdir/node/bin:$PATH"

    # prepare nw-gyp
    _log "prepare nw-gyp"
    node --version
    npm uninstall node-gyp -g
    npm install nw-gyp node-gyp -g

    # node bin
    _log "copy node exectuable"
    cp "$(which node)" "${srcdir}/node.${_node_version}"

    # run fix scripts
    export NW_PACKAGE_DIR="${srcdir}/package.nw"
    export NW_VERSION=$_nwjs_ver
    # fix-package-name.js使用
    export srcdir=$srcdir
    export WINE=false
    
    for script in fix-package-name.js fix-cli.sh fix-other.sh fix-menu.sh fix-core.sh rebuild-node-modules.sh; do
        _log "run ${script}"
        "${srcdir}/tools/${script}"
    done

    # cleanup
    _log "done"
}

package() {
    mkdir -p "${pkgdir}${_install_dir}"
    cd "${pkgdir}${_install_dir}"

    cp -r "${srcdir}/nwjs" .
    cp -r "${srcdir}/package.nw" .
    find ./package.nw -type d | xargs -I {} chmod -R a+rx {}

    cp ${srcdir}/node.${_node_version} nwjs/node
    cd nwjs && ln -s node node.exe && ln -s ../package.nw package.nw

    install -Dm755 "${srcdir}/wechat-devtools" "${pkgdir}${_install_dir}/bin/wechat-devtools"
    install -Dm755 "${srcdir}/wechat-devtools-cli" "${pkgdir}${_install_dir}/bin/wechat-devtools-cli"
    install -Dm644 "${srcdir}/wechat-devtools.desktop" "${pkgdir}/usr/share/applications/wechat-devtools.desktop"
    install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-devtools.svg"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${_install_dir}/bin/wechat-devtools" "${pkgdir}/usr/bin/wechat-devtools"
    ln -s "${_install_dir}/bin/wechat-devtools-cli" "${pkgdir}/usr/bin/wechat-devtools-cli"
}
