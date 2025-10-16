# Maintainer ArjixWasTaken <me@arjix.dev>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2155,SC2164

pkgname=equicord-openasar
_pkgname=equicord
pkgver=0.0.112.r5532g087303a0.r846gbf8a71e
pkgrel=1
pkgdesc='The other cutest Discord client mod (with OpenAsar)'
arch=('x86_64')
url='https://equicord.org/'
license=('custom')
options=('!debug' '!strip')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
optdepends=('libpulse: PulseAudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: For opening URLs and files')
makedepends=('git' 'nvm' 'pnpm' 'wget' 'asar')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    'equicord-source::git+https://github.com/Equicord/Equicord.git'
    'openasar-source::git+https://github.com/GooseMod/OpenAsar.git'
    'discord-pkgbuild::https://gitlab.archlinux.org/archlinux/packaging/packages/discord/-/raw/main/PKGBUILD'
    'equicord.desktop'
    'equicord.png'
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '25c3e3cbef8c981a42ba059f589ffc9ebe8c81406fa6cd6b000ed7b4e3c7b95ae96108df2a29096a8c527153b3becf98b1769b2af75d5f6cf0fe69edd2b3da3a'
            '94f091c05c365986d556616404e00344a1d8e4ba93ad1875c0d3d96b1d0a643a799343fe6b84dcf7013ea3f9d47a3380540d8212bbf3fb6f5ddf39840ffe38d5')

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

    local openasar_ver
    {
        local commits sha

        pushd openasar-source
            commits=$(git rev-list --count HEAD)
            sha=$(git rev-parse --short HEAD)
        popd

        openasar_ver="r${commits}g${sha}"
    } > /dev/null

    echo "${discord_ver#pkgver=}.${equicord_ver}.${openasar_ver}"
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
    popd

    pushd openasar-source
        sed -i -e "s|nightly|nightly-$(git rev-parse HEAD | cut -c 1-7)|" src/index.js
        sed -i -e "/config.setup = true/a\  config.autoupdate = false;" src/config/index.js
        sed -i -e "s|process.resourcesPath|'/usr/lib/${_pkgname}/resources'|" src/utils/buildInfo.js
        sed -i -e "s|^Exec=\${exec}$|Exec=/usr/bin/${_pkgname}|" \
        		-e "s|^Name=\${basename(exec)}$|Name=${_pkgname^}|" src/autoStart.js
        node scripts/strip.js
        asar pack src app.asar
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

    pushd "discord-$discord_ver"
        # replace desktop file
        cp ../equicord.{desktop,png} .
        cp {equicord,discord}.png
        rm discord.desktop

        # setuid on chrome-sandbox
        chmod u+s chrome-sandbox
        chmod 755 Discord

        rm postinst.sh

        pushd resources
            rm app.asar
            mkdir app

            echo '{"name": "discord", "main": "index.js"}' > app/package.json
            echo 'require("/usr/lib/equicord/dist/desktop.asar");' > app/index.js
            asar pack app app.asar
            rm -rf app
        popd
    popd

    pushd openasar-source
        cp app.asar "../discord-${discord_ver}/resources/_app.asar"
    popd
    
    pushd equicord-source
        _ensure_local_nvm
        pnpm build
        cp -a dist "../discord-$discord_ver"

        rm -rf "../discord-$discord_ver/dist/Installer"
        rm -rf "../discord-$discord_ver/dist/equibop"
        rm -f "../discord-$discord_ver/dist/equibop.asar"
    popd
}

package() {
  local discord="discord-${pkgver%%.r*}"

  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -a "$discord/." "$pkgdir/usr/lib/$_pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/${_pkgname}/Discord" "$pkgdir/usr/bin/${_pkgname}"

  install -d "$pkgdir/usr/share/applications"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
