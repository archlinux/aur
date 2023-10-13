# Maintainer: Ernesto Castellotti <ernesto@castellotti.net>

pkgname=telegram-a
realname=telegram-tt
pkgver=10.0.13
pkgrel=1
pkgdesc="Official Telegram Web client version A system Electron version"
arch=('any')
url="https://web.telegram.org/a/get/"
license=('GPL3')
depends=('electron' 'libappindicator-gtk3' 'zlib' 'hicolor-icon-theme')
makedepends=('asar' 'yarn' 'npm' 'git')
conflicts=("${pkgname}"-appimage "${pkgname}"-bin)
source=("https://github.com/Ajaxy/${realname}/archive/v${pkgver}.tar.gz"
                "${pkgname}"
                "${pkgname}.desktop"
                "electron-builder.yml"
                "set_custom_app_name.patch"
                "set_custom_window_title_from_env.patch"
                "disable_statoscope.patch"
                "run_husky_install_only_in_git.patch")
sha256sums=('19495e827e22680c87367718fb37f67cd14af0794d420678b7890bb0d10ee523'
                'f90da929a33048561899c8774969e6a1012dcbf679e0082c835783278b41b780'
                'de086bb54da308478eadb00680e6feec6c50b80283a2dd7c1f67132c11e3a216'
                'f5be452e2baa2a6508080b292f0341f3a36c9a6ca6633666d313cef64193d86d'
                'be1ec2ce92c6017e55ea79254502e34bf744fdeccd8952bce9eb69d0a7ee231a'
                'ecd8513d233fa5da2925ef68a97cd03ddcea81c2a050576e64dcfa8f177aea0b'
                '00f7cf0019c84fbd0da5014fdf3cc6eba35cbed2a3574951bbe57e9fd0ecbcd9'
                '7492e3db6991a6917b206ee2324c783fcfd3e67b3d01cf5a17cfd613ef94aeb0')

prepare() {
    cd "${srcdir}/${realname}-${pkgver}"

    # Apply patches
    patch -Np1 -i "${srcdir}/set_custom_app_name.patch"
    patch -Np1 -i "${srcdir}/set_custom_window_title_from_env.patch"
    patch -Np1 -i "${srcdir}/disable_statoscope.patch"
    patch -Np1 -i "${srcdir}/run_husky_install_only_in_git.patch"
}

build() {
    cd "${srcdir}/${realname}-${pkgver}"

    # See https://gitlab.archlinux.org/archlinux/packaging/packages/telegram-desktop/-/blob/ab56b44af59db2c3459ddb17840f3ff4afe86cb2/PKGBUILD#L32
    export ENV=production
    export APP_ENV=production
    export IS_ELECTRON_BUILD=true
    export TELEGRAM_API_ID=611335
    export TELEGRAM_API_HASH=d524b414d21f4d37f08684c1df41ac9c

    npm ci
    yarn webpack
    yarn electron-builder install-app-deps
    yarn webpack --config ./webpack-electron.config.ts
    yarn electron-builder build --linux --config "${srcdir}/electron-builder.yml" -p always
}

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${realname}-${pkgver}/src/assets/telegram-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/telegram-a.svg"
    asar extract "${srcdir}/${realname}-${pkgver}/dist-electron/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
}
