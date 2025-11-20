# Maintainer: zmr233 <zmr_233@outlook.com>
# Contributor and Ahthor: qier22 <qier222@outlook.com>

# Refer to https://aur.archlinux.org/packages/yesplaymusic-git
# 参考了如上AUR包的PKGBUILD文件以使用系统electron

_pkgname=yesplaymusic
pkgname=yesplaymusic-plus
pkgver=0.4.10
pkgrel=1
pkgdesc="A third-party music player for Netease Music"
arch=('x86_64')
url="https://github.com/qier222/YesPlayMusic"
license=('MIT')
provides=("${_pkgname}=${pkgver}")

# _electronversion=33 无法确保系统中有对应版本的electron，故使用系统中的electron
_nodeversion=16

conflicts=(
    "my-yesplaymusic-bin"
    "r3playx-bin"
    "r3playx-git"
    "yesplaymusic"
    "yesplaymusic-appimage"
    "yesplaymusic-bin"
    "yesplaymusic-electron"
    "yesplaymusic-git"
    "yesplaymusic-new"
    "yesplaymusicosd-origin-electron-git"
    "yesplaymusicosd-origin-git"
)

depends=(
    "electron"
)

makedepends=(
    'jq'
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
    'gcc'
    'python-setuptools'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/qier222/YesPlayMusic/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")

sha256sums=('819caa59ebde11eb4e3a56e4c95e233c9245f1a707999e86d193b8d3609856cf'
            '2c70ded5b08d349db110f2fc80f8aa6b7dc8f6945b576c5c3324404fb8fbe55b'
            '8022475183b04d8c04168ff32aaa6d749e65ba1bf6966867b49982baa2953661'
)

_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}

# 获取国家代码
_get_country_code() {
    local response
    # 尝试不使用代理
    response=$(curl -s --noproxy ip-api.com --max-time 2 http://ip-api.com/json)
    if [[ $? -eq 0 && -n "$response" ]]; then
        echo "$response" | jq -r .countryCode
        return 0
    fi

    # 尝试使用代理
    response=$(curl -s --max-time 2 http://ip-api.com/json)
    if [[ $? -eq 0 && -n "$response" ]]; then
        echo "$response" | jq -r .countryCode
        return 0
    fi

    # 尝试备用服务不使用代理
    response=$(curl -s --noproxy ipinfo.io --max-time 2 http://ipinfo.io/json)
    if [[ $? -eq 0 && -n "$response" ]]; then
        echo "$response" | jq -r .country
        return 0
    fi

    # 尝试备用服务使用代理
    response=$(curl -s --max-time 2 http://ipinfo.io/json)
    if [[ $? -eq 0 && -n "$response" ]]; then
        echo "$response" | jq -r .country
        return 0
    fi

    # 如果所有方法都失败，返回空并发出警告
    echo "Failed to retrieve country code from all services." >&2
    return 1
}

prepare() {
    export SYSTEM_ELECTRON_VERSION="$(electron -v | sed 's/v//g')"
    # 检查最低electron版本
    if [[ $(vercmp "$SYSTEM_ELECTRON_VERSION" "13.0.0") -lt 0 ]]; then
        echo "Error: Electron version 13.0.0 or higher is required."
        exit 1
    fi
}

build() {
    # 设置启动脚本
    #  不再特殊指定版本 => 使用系统中的electron
    sed -e "
        s/@electronversion@//g 
        s/@appname@/${_pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname}.sh"

    # 设置构建node版本
    _ensure_local_nvm
    cd "$srcdir/YesPlayMusic-$pkgver"

    # 设置系统electron版本
    
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"

    # 获取国家代码
    countryCode=$(_get_country_code)

    if [[ "$countryCode" == "CN" ]]; then
        echo "Using mirror in China"
        {
            echo -e '\n'
            echo 'registry "https://repo.nju.edu.cn/repository/npm/"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder \"${srcdir}/.yarn/cache\""
            echo "pluginsFolder \"${srcdir}/.yarn/plugins\""
            echo "globalFolder \"${srcdir}/.yarn/global\""
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g;s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    elif [[ -z "$countryCode" ]]; then
        echo "Empty countryCode from ip-api.com and ipinfo.io"
    elif [[ $? -ne 0 ]]; then
        echo "Failed to retrieve country code from all services. Proceeding without proxy settings."
    else 
        echo "No proxy"
    fi

    # 设置较高并发数
    yarn config set network-concurrency 16

    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json

    # 添加 homepage 字段到 package.json
    sed -i 's/"name": "yesplaymusic"/"name": "yesplaymusic", "homepage": "https:\/\/github.com\/qier222\/YesPlayMusic"/' package.json
    
    # 更换版本号
    sed -i "s/\"version\": \".*\"/\"version\": \"$pkgver\"/" package.json
    
    # 设置网易云API
    cp .env.example .env

    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache" --ignore-optional
    NODE_ENV=development    yarn add --ignore-platform --ignore-optional \
                                @unblockneteasemusic/rust-napi-linux-x64-gnu@0.4.0 \
                                @unblockneteasemusic/rust-napi-linux-arm64-gnu@0.4.0 \
                                @unblockneteasemusic/rust-napi-linux-arm-gnueabihf@0.4.0 \
                                utf-8-validate
    NODE_ENV=production     yarn run electron:build-linux --dir
}

package() {
  cd "$srcdir/YesPlayMusic-$pkgver"

  # 安装主程序
  install -Dm644 "dist_electron/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${_pkgname}"

  # 安装启动脚本
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # 安装桌面条目和图标
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "build/icons/${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done

  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}