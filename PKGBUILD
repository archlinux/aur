# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=plasma-weather-plus
pkgver=4.6
pkgrel=1
epoch=1
pkgdesc="Weather widget for KDE Plasma with meteogram and extensive customization"
arch=('any')
url='https://github.com/tully-t/weather-widget-plus'
license=('GPL-2.0-or-later')
depends=('plasma-workspace' 'plasma5support' 'libplasma' 'kirigami'
         'kcmutils' 'qt6-declarative' 'qt6-5compat')
makedepends=('gettext')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db36d1c8b16d69dd689d5ade8465872c2226bd6b72c61edc0592ce2732c40fcf')

_plasmoid=weather.widget.plus

latestver() {
    curl -fsSL 'https://api.github.com/repos/tully-t/weather-widget-plus/releases/latest' |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

prepare() {
    cd "weather-widget-plus-${pkgver}"

    # Compile translations (.po -> .mo)
    local podir=translations/po
    local catdir="${_plasmoid}/contents/locale"
    local moname="plasma_applet_${_plasmoid}.mo"
    for po in "${podir}"/*.po; do
        local locale
        locale=$(basename "${po%.po}")
        install -d "${catdir}/${locale}/LC_MESSAGES"
        msgfmt -o "${catdir}/${locale}/LC_MESSAGES/${moname}" "${po}"
    done
}

package() {
    cd "weather-widget-plus-${pkgver}"
    install -d "${pkgdir}/usr/share/plasma/plasmoids/${_plasmoid}"
    cp -r "${_plasmoid}"/* "${pkgdir}/usr/share/plasma/plasmoids/${_plasmoid}/"
}
