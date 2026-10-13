# Maintainer: blueperil at blueperil dot de

pkgname=meshmonitor
pkgver=4.17.0
pkgrel=1
pkgdesc='Web dashboard for monitoring Meshtastic, MeshCore and MQTT mesh networks'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Yeraze/meshmonitor'
license=('BSD-3-Clause')
depends=('nodejs>=22.0.0' 're2')
makedepends=('git' 'npm' 'node-gyp' 'python' 'make' 'gcc')
backup=("etc/default/${pkgname}")
options=('!debug' '!strip')
source=("git+${url}.git#tag=v${pkgver/rc/-rc}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('22cae6495133f3a2f26041e247c4d7a8ea302f5c9848a8a24cc5089cbbeda09b'
            '996e15ae1f2cc6bc7fb3103d13e502031d415dbb64f1b26872c35424890a50b2'
            '7ed7cf20001e8fd44b48b0af4af68ff95c1618ee1a5e4c279ba4faaf40b7ecab'
            '8189cf6775ae2c3975da7d2f557eb881f4badc581637661627e2924a07fc9395')

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname}"

    export npm_config_cache="${srcdir}/npm-cache"
    export npm_config_nodedir=/usr
    export npm_config_audit=false
    export npm_config_fund=false
    export npm_config_update_notifier=false
    export NODE_OPTIONS="--max-old-space-size=6144"
    export RE2_DOWNLOAD_FORCE_BUILD=1

    npm ci --allow-git=all --legacy-peer-deps
    npm audit fix || echo "Nothing to fix"

    local _mod
    for _mod in esbuild @scarf/scarf @serialport/bindings-cpp bcrypt \
                better-sqlite3 puppeteer re2 zstd-napi; do
        npm install-scripts approve "${_mod}"
    done
    npm install --allow-git=all --legacy-peer-deps --prefer-offline

    (
        cd node_modules/re2
        node-gyp -j max rebuild
    )

    npm run build
    npm run build:server
    npm prune --omit=dev
}

package() {
    cd "${pkgname}"
    local _lib="${pkgdir}/usr/lib/${pkgname}"

    install -dm755 "${_lib}/protobufs"
    cp -a package.json dist node_modules "${_lib}/"
    cp -a protobufs/meshtastic "${_lib}/protobufs/"

    find "${_lib}/node_modules" -type f \( \
        -iname '*Makefile*' -o -iname 'appveyor.yml' -o -iname '.babelrc' -o \
        -iname '*.bak' -o -iname 'bower.json' -o -iname '*.c' -o \
        -iname '*.cc' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.o' -o \
        -iname '*.md' -o -iname '*.markdown' -o -iname '*.rst' -o \
        -iname '.nycrc' -o -iname '.npmignore' -o -iname '.editorconfig' -o \
        -iname '*.el' -o -iname '.eslintignore' -o -iname '.eslintrc*' -o \
        -iname '.fimbullinter.yaml' -o -iname '.gitattributes' -o \
        -iname '.gitmodules' -o -iname '.jshintrc' -o -iname '.jscs.json' -o \
        -iname '*.log' -o -iname '*logo.svg' -o -iname '.nvmrc' -o \
        -iname 'package-lock.json' -o -iname '.travis.yml' -o \
        -iname '.prettierrc' -o -iname '*.sh' -o -iname '.tags*' -o \
        -iname '.tm_properties' -o -iname '.wotanrc.yaml' -o \
        -iname 'tsconfig.json' -o -iname 'yarn.lock' -o -iname '*.map' \
        \) -delete

    find "${_lib}/node_modules" -type d \( \
        -name '.github' -o -name '.tscache' -o -name '.cache' -o \
        -path '*/man' -o -path '*/test' -o -path '*/obj.target' -o \
        -path '*/git-hooks' -o \
        -path '*/prebuilds/darwin-*' -o -path '*/prebuilds/win32-*' -o \
        -path '*/prebuilds/android-*' -o -path '*/prebuilds/ios-*' \
        \) -prune -exec rm -rf {} +

    find "${_lib}" -name package.json -print0 | xargs -r -0 sed -i '/"_where"/d'

    find "${pkgdir}" -type d -exec chmod 755 {} +

    install -Dm644 .env.example "${pkgdir}/etc/default/${pkgname}"
    cat >> "${pkgdir}/etc/default/${pkgname}" <<ENV

# Arch Linux paths
DATA_DIR=/var/lib/meshmonitor
DATABASE_PATH=/var/lib/meshmonitor/meshmonitor.db
BACKUP_DIR=/var/lib/meshmonitor/backups
SYSTEM_BACKUP_DIR=/var/lib/meshmonitor/system-backups
ENV

    install -Dm644 "${srcdir}/${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
