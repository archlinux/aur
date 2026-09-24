# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fluent-reader-git
_pkgname='Fluent Reader'
pkgver=1.2.2.r3.g5813998
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="A modern desktop RSS reader."
arch=('any')
url="https://hyliu.me/fluent-reader/"
_ghurl="https://github.com/yang991178/fluent-reader"
license=("BSD-3-Clause")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'bun'
    'git'
    'nvm'
    'gendesk'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export BUN_INSTALL_CACHE_DIR="${HOME}/.bun/cache"
	export BUN_INSTALL_GLOBAL_DIR="${HOME}/.bun/global"
	export BUN_INSTALL_BIN="${HOME}/.bun/bin"
	export BUN_CONFIG_SKIP_SAVE_LOCKFILE=1
	export BUN_CONFIG_SKIP_LOAD_LOCKFILE=1
	export BUN_DISABLE_DOTENV=1
	export DO_NOT_TRACK=1
	export BUN_JOBS="$(nproc)"
	mkdir -p "${HOME}" "${BUN_INSTALL_CACHE_DIR}" "${BUN_INSTALL_GLOBAL_DIR}" "${BUN_INSTALL_BIN}"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    sed "s/.\/bin\/\${platform}\/\${arch}\//release/g" -i electron-builder.yml
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    export NODE_ENV=development
    # Upgrade React to v17 for jsx-runtime compatibility
    sed -i 's/"react": "\^16\.[^"]*"/"react": "^17.0.2"/g' package.json
    sed -i 's/"react-dom": "\^16\.[^"]*"/"react-dom": "^17.0.2"/g' package.json
    sed -i 's/"@types\/react": "\^16\.[^"]*"/"@types\/react": "^17.0.0"/g' package.json
    sed -i 's/"@types\/react-dom": "\^16\.[^"]*"/"@types\/react-dom": "^17.0.0"/g' package.json
    # Add skipLibCheck to tsconfig.json to fix TS2786 type errors
    sed -i 's/"strict": false/"strict": false, "skipLibCheck": true/' tsconfig.json
    # Rewrite webpack.config.js with all necessary fixes
    cat > webpack.config.js << 'WEBPACK_EOF'
const HtmlWebpackPlugin = require("html-webpack-plugin")
const NodePolyfillPlugin = require("node-polyfill-webpack-plugin")
const { GriffelPlugin } = require("@griffel/webpack-plugin")
const MiniCssExtractPlugin = require("mini-css-extract-plugin")

module.exports = [
    {
        mode: "production",
        entry: "./src/electron.ts",
        target: "electron-main",
        module: {
            rules: [
                {
                    test: /\.ts$/,
                    include: /src/,
                    resolve: {
                        extensions: [".ts", ".js"],
                    },
                    use: [{ loader: "ts-loader", options: { transpileOnly: true } }],
                },
            ],
        },
        output: {
            devtoolModuleFilenameTemplate: "[absolute-resource-path]",
            path: __dirname + "/dist",
            filename: "electron.js",
        },
        node: {
            __dirname: false,
        },
    },
    {
        mode: "production",
        entry: "./src/preload.ts",
        target: "electron-preload",
        module: {
            rules: [
                {
                    test: /\.ts$/,
                    include: /src/,
                    resolve: {
                        extensions: [".ts", ".js"],
                    },
                    use: [{ loader: "ts-loader", options: { transpileOnly: true } }],
                },
            ],
        },
        output: {
            path: __dirname + "/dist",
            filename: "preload.js",
        },
    },
    {
        mode: "production",
        entry: "./src/index.tsx",
        target: "web",
        resolve: {
            fullySpecified: false,
            alias: {
                "react/jsx-runtime": "react/jsx-runtime.js",
                "react/jsx-dev-runtime": "react/jsx-dev-runtime.js",
            },
        },
        devtool: "source-map",
        performance: {
            hints: false,
        },
        module: {
            rules: [
                {
                    test: /\.(js|ts|tsx)$/,
                    include: [/src/, /node_modules\/@fluentui/],
                    use: {
                        loader: "@griffel/webpack-plugin/loader",
                    },
                },
                {
                    test: /\.ts(x?)$/,
                    include: /src/,
                    resolve: {
                        extensions: [".ts", ".tsx", ".js"],
                    },
                    use: {
                        loader: "ts-loader",
                        options: { transpileOnly: true }
                    },
                },
                {
                    test: /\.css$/,
                    use: [MiniCssExtractPlugin.loader, "css-loader"],
                },
            ],
        },
        output: {
            path: __dirname + "/dist",
            filename: "index.js",
        },
        plugins: [
            new NodePolyfillPlugin({
                additionalAliases: ["process"],
            }),
            new HtmlWebpackPlugin({
                template: "./src/index.html",
            }),
            new MiniCssExtractPlugin(),
            new GriffelPlugin(),
        ],
    },
]
WEBPACK_EOF
    echo "Webpack config rewritten successfully"
    bun install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    bun run build
    bunx electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config electron-builder.yml
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
