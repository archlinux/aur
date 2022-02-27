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
_node_version="16.1.0"

pkgname=wechat-devtools
pkgver="1.05.2201242"  # 主版本号
pkgrel=1   # 次版本号release, 一位数用0n
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
        "compiler.tar.gz::https://download.fastgit.org/msojocs/wechat-devtools-linux/releases/download/v0.17/compiler.tar.gz"
        "wechat-devtools.desktop"
        "logo.svg"
        "fix-cli.sh"
        "fix-menu.sh"
        "fix-core.sh"
        "rebuild-modules.sh"
        "fix-package-name-node"
        "wxvpkg_pack"
        "wxvpkg_unpack"
        "fix-other.sh")
md5sums=(b6f49803c51d0abacca2d1e566c7fe19   # nwjs
         "${_wechat_devtools_md5}"
         2280bfbbf29981fd5adce334f40146ff   # nodejs
         87a3849f7105f411bee25da9532b0382   # compiler
         1abd6b4ebbbb918f601a6c5dbad55a05   # desktop
         0f4353664123320280ea4d6bb295dce2   # svg
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP")
options=('!strip')

prepare() {
    7z x -owechat_devtools ${_wechat_devtools_exe}
}

_log() {
    echo -e "\e[1;34m$@\e[0m"
}

build() {
    # prepare node
    _log "prepare node v${_node_version}"
    export PATH="$srcdir/node-v${_node_version}-linux-x64/bin:$PATH"

    # prepare nw-gyp
    _log "prepare nw-gyp"
    npm uninstall node-gyp -g
    npm install nw-gyp node-gyp -g

    # node bin
    _log "copy node exectuable"
    cp "$(which node)" "${srcdir}/node.${_node_version}"

    # run fix scripts
    export NW_PACKAGE_DIR="${srcdir}/wechat_devtools/code/package.nw"
    export NW_VERSION=$_nwjs_ver
    export srcdir=$srcdir
    export NO_WINE=true
    
    for script in fix-package-name-node fix-cli.sh fix-other.sh fix-menu.sh fix-core.sh rebuild-modules.sh; do
        _log "run ${script}"
        "${srcdir}/${script}"
    done

    # cleanup
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
