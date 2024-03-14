# Maintainer: Ernesto Castellotti <ernesto@castellotti.net>

pkgname=telegram-a
realname=telegram-tt
pkgver=10.4.9
gitpkgver=21c4484d7a7bc24b06526ed55b11bc1aefbef5cc
pkgrel=2
_electron=electron22
pkgdesc="Official Telegram Web client version A system Electron version"
arch=('any')
url="https://web.telegram.org/a/get/"
license=('GPL3')
depends=("$_electron" 'libappindicator-gtk3' 'zlib' 'hicolor-icon-theme')
makedepends=('asar' 'yarn' 'npm' 'git')
conflicts=("${pkgname}"-appimage "${pkgname}"-bin)
source=("https://github.com/Ajaxy/${realname}/archive/${gitpkgver}.tar.gz"
                "${pkgname}.desktop"
                "set_custom_app_name.patch"
                "set_custom_window_title_from_env.patch"
                "disable_statoscope.patch"
                "run_husky_install_only_in_git.patch"
                "force-disable-auto-update.patch")
sha256sums=('c027d5a08e99b6c3b4e3b31615e1e23d133a436b9a6eb116647035565793f24d'
                'efeb0cd71fd3d39d75744885a585e9961481a68ccf885a0b4f929eaf062c2b35'
                'be1ec2ce92c6017e55ea79254502e34bf744fdeccd8952bce9eb69d0a7ee231a'
                'ecd8513d233fa5da2925ef68a97cd03ddcea81c2a050576e64dcfa8f177aea0b'
                '00f7cf0019c84fbd0da5014fdf3cc6eba35cbed2a3574951bbe57e9fd0ecbcd9'
                '7492e3db6991a6917b206ee2324c783fcfd3e67b3d01cf5a17cfd613ef94aeb0'
                '4e9f3c68fa01604d71002bb03fcdb248e8468cff2d279ecffff2619402ea29df')

prepare() {
    cd "${srcdir}/${realname}-${gitpkgver}"

    # Apply patches
    patch -Np1 -i "${srcdir}/set_custom_app_name.patch"
    patch -Np1 -i "${srcdir}/set_custom_window_title_from_env.patch"
    patch -Np1 -i "${srcdir}/disable_statoscope.patch"
    patch -Np1 -i "${srcdir}/run_husky_install_only_in_git.patch"
    patch -Np1 -i "${srcdir}/force-disable-auto-update.patch"

    # Workaround 
    echo "ignore-engines true" >> "${srcdir}/${realname}-${gitpkgver}/.yarnrc"
}

build() {
    cd "${srcdir}/${realname}-${gitpkgver}"
    _ver="$(</usr/lib/${_electron}/version)"

    # See https://gitlab.archlinux.org/archlinux/packaging/packages/telegram-desktop/-/blob/ab56b44af59db2c3459ddb17840f3ff4afe86cb2/PKGBUILD#L32
    export ENV=production
    export TELEGRAM_API_ID=611335
    export TELEGRAM_API_HASH=d524b414d21f4d37f08684c1df41ac9c

    npm ci
    yarn electron:build
    yarn electron-builder build --linux --"${!CARCH}" --dir \
        -c.productName="Telegram A" \
        -c.artifactName=${productName}-${arch}.${ext} \
        -c.appId=org.telegram.TelegramA \
        -c.extraMetadata.main=dist/electron.js \
        -c.extraMetadata.productName="Telegram A" \
        -c.files=dist \
        -c.files=!dist/**/build-stats.json \
        -c.files=!dist/**/statoscope-report.html \
        -c.files=!dist/**/reference.json \
        -c.files=!dist/img-apple-* \
        -c.files=!dist/get \
        -c.files=!node_modules \
        -c.directories.buildResources=public \
        -c.directories.output=dist-electron \
        -c.electronDist=/usr/lib/"$_electron" \
        -c.electronVersion="$_ver"
}

package() {
    install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${realname}-${gitpkgver}/src/assets/telegram-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/telegram-a.svg"
    asar extract "${srcdir}/${realname}-${gitpkgver}/dist-electron/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
   
    cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#!/usr/bin/bash
exec env ELECTRON_FORCE_IS_PACKAGED=true env CUSTOM_APP_NAME=telegram-a env CUSTOM_WINDOW_TITLE="Telegram A" $_electron /usr/lib/telegram-a --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations "\$@"
EOD
}
