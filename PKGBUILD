# Maintainer ArjixWasTaken <me@arjix.dev>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2155,SC2164

pkgname=equicord
_pkgname=Equicord
pkgver=1.0.137.r7487g02b56940c
pkgrel=1
epoch=2
pkgdesc='The other cutest Discord client mod'
arch=('x86_64')
url='https://equicord.org/'
license=('custom')
options=('!debug' '!strip')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' 'hicolor-icon-theme')
optdepends=('libpulse: PulseAudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: For opening URLs and files')
makedepends=('git' 'nvm' 'pnpm' 'wget' 'asar')
source=(
    'equicord-source::git+https://github.com/Equicord/Equicord.git'
    'discord-pkgbuild::https://gitlab.archlinux.org/archlinux/packaging/packages/discord/-/raw/main/PKGBUILD'
    'equicord.desktop'
    'equicord.png'
    'equicord.sh'
)
sha512sums=('SKIP'
            'SKIP'
            '25c3e3cbef8c981a42ba059f589ffc9ebe8c81406fa6cd6b000ed7b4e3c7b95ae96108df2a29096a8c527153b3becf98b1769b2af75d5f6cf0fe69edd2b3da3a'
            '94f091c05c365986d556616404e00344a1d8e4ba93ad1875c0d3d96b1d0a643a799343fe6b84dcf7013ea3f9d47a3380540d8212bbf3fb6f5ddf39840ffe38d5'
            '2b7885cc7cad6d10d5d503fa1f55bf418dbea4d96fe4f3f917bd20bd5d934c7342c794ea77bea11aca79cc04d6f386f6e91dd5bd3fbf8a206e206bf440cd4be3')

pkgver() {
    local discord_ver=$(grep -oE '^pkgver=(.*?)$' discord-pkgbuild)
    local equicord_ver
    {
        local commits sha
        pushd equicord-source
            commits=$(git rev-list --count HEAD)
            sha=$(git rev-parse --short HEAD)
        popd
        equicord_ver="r${commits}g${sha}"
    } > /dev/null

    echo "${discord_ver#pkgver=}.${equicord_ver}"
}

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvmrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  # shellcheck source=/dev/null
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    export PNPM_HOME="$srcdir/pnpm-home"
    pushd equicord-source
        _ensure_local_nvm
        nvm install --lts
        pnpm install --frozen-lockfile

        sed -i \
            -e '#async function fetchUpdates\(\) {#a return false;' \
            -e '#async function applyUpdates\(\) {#a return false;' \
            src/main/updater/http.ts
    popd
}

build() {
    export PNPM_HOME="$srcdir/pnpm-home"
    local discord_ver="${pkgver%%.r*}"
    
    echo "Downloading discord: v$discord_ver"
    wget "https://dl.discordapp.net/apps/linux/$discord_ver/discord-$discord_ver.tar.gz" \
        -O "discord-$discord_ver.tar.gz" \
        --continue

    rm -rf "discord-$discord_ver"; mkdir "discord-$discord_ver"
    tar -xzvf "discord-$discord_ver.tar.gz" -C "discord-$discord_ver" --strip-components=1

    pushd equicord-source
        _ensure_local_nvm
        EQUICORD_REMOTE="Equicord/Equicord" pnpm buildStandalone

        pushd dist
            mkdir app
            echo '{"name": "discord", "main": "index.js"}' > app/package.json
            echo 'require(require("path").resolve(require("electron").app.getAppPath(), "..", "equicord.asar"));' > app/index.js
            asar pack app app.asar
            rm -rf app
        popd
    popd

    local hash="$(sha256sum equicord-source/dist/app.asar | awk '{print $1}')"
    sed -i 's/INSERT_HASH_HERE/'"$hash"'/' equicord.sh
}

package() {
  local discord="$(pwd)/discord-${pkgver%%.r*}"
  local equicord="$(pwd)/equicord-source"

  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png

  cd "$discord"
  install -Dm755 updater_bootstrap "$pkgdir"/usr/share/$pkgname/updater_bootstrap

  cd "$equicord"
  install -Dm644 dist/app.asar "$pkgdir"/usr/share/$pkgname/app.asar
  install -Dm644 dist/desktop.asar "$pkgdir"/usr/share/$pkgname/equicord.asar
}
