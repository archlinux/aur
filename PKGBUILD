# Maintainer: Rocket Aaron <rocka@archlinuxcn.org>

_pkgname=sing-box-dashboard
pkgname="${_pkgname}-git"
pkgver=0.0.0.r95.3e4bf08
pkgrel=1
pkgdesc="Web dashboard for sing-box"
arch=('any')
url="https://github.com/SagerNet/sing-box-dashboard"
license=('GPL-3.0-or-later')
makedepends=(git nodejs pnpm)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+${url}.git"
        "git+https://github.com/mbadolato/iTerm2-Color-Schemes.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    # init submodule
    cd "${_pkgname}"
    git submodule init
    git config submodule.vendor/iterm2-color-schemes.url "${srcdir}/iTerm2-Color-Schemes"
    git -c protocol.file.allow=always submodule update
    # fix "pnpm 11.13.0 shipped a broken @pnpm/exe binary"
    sed -i '/"packageManager":/d' package.json
    # disable pnpm update notification
    pnpm config --location project set updateNotifier false
    # remove vendor fonts
    sed -i '/import "@fontsource/d' src/main.tsx
    sed -i '/src: url("@fontsource/d;
            /font-family: "Noto Color Emoji";/a src:local(Noto Color Eomji);
            /--font-sans:/c  --font-sans:sans-serif;
            /--font-serif:/c --font-serif:serif;
            /--font-mono:/c  --font-mono:monospace;
    ' src/styles/globals.css
}

build() {
    cd "${_pkgname}"
    pnpm install --frozen-lockfile
    pnpm generate
    pnpm build
}

check() {
    cd "${_pkgname}"
    pnpm test
}

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${_pkgname}/dist" "${pkgdir}/usr/share/${_pkgname}"
}
