# Maintainer: 1F616EMO <root@1f616emo.xyz>

_pkgname='icloud-notes'
pkgname="${_pkgname}-git"
pkgver=1.2.0.r0.g6635f9d
pkgrel=2
pkgdesc='Unofficial iCloud Notes Desktop App'
arch=('any')
url='https://github.com/swe-himelrana/icloud-notes'
license=('MIT')
_electron=electron30
depends=("$_electron" 'hicolor-icon-theme' 'sh')
makedepends=('npm' 'git' 'asar' 'imagemagick')
source=(
    'icloud-notes::git+https://github.com/swe-himelrana/icloud-notes#branch=master'
    'icloud-notes.desktop'
)
sha256sums=(
    'SKIP'
    '4a511005e2cbee1debf3ebcd34278fe3745c9d6ffd6548c457e9a6945b6a0806'
)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    _ver="$(</usr/lib/${_electron}/version)"
    cd "$_pkgname"
    npm install
}

build() {
    cd "$_pkgname"
    local i686=ia32 x86_64=x64
    export NODE_ENV=production
    export NODE_OPTIONS='--openssl-legacy-provider'
    ./node_modules/.bin/electron-builder --linux --"${!CARCH}" --dir \
        -c.electronDist=/usr/lib/"$_electron" \
        -c.electronVersion="$_ver"
    
    for _i in 16 32 48 128; do
        magick "icon.png" -resize ${_i}x${_i} "../icon${_i}.png"
    done
}

package() {
    # Desktop Entry
    install -Dm644 "icloud-notes.desktop" \
        "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    
    # icon (except 512x512)
    for _i in 16 32 48 128; do
        install -Dm644 "icon${_i}.png" "${pkgdir}/usr/share/icons/hicolor/${_i}x${_i}/apps/${_pkgname}.png"
    done

    cd "$_pkgname"

    # Shell wrapper
    install -Dm755 /dev/null "${pkgdir}/usr/bin/$_pkgname"
    cat >>"${pkgdir}/usr/bin/$_pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/$_pkgname "\$@"
EOD

    # Electron files
    asar e "dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$_pkgname/"

    # License
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/${_pkgname}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.md"

    # Icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    ln -s "../../../../../lib/${_pkgname}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}