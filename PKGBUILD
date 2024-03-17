# Maintainer: devome <evinedeng@hotmail.com>

_prefix=grub-theme
pkgbase="${_prefix}-dedsec-git"
pkgver=r14.8ccb1be
pkgrel=1
pkgdesc="A collection of GRUB themes that was created inspired by the fictional hacker group DedSec from Ubisoft's Watch Dogs video game."
arch=('any')
url="https://gitlab.com/VandalByte/dedsec-grub-theme"
license=('GPL3')
depends=('grub')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')
_themes=(brainwash comments compact firewall fuckery hackerden legion lovetrap mashup reaper redskull sitedown spam spyware stalker strike tremor trolls unite wannacry wrench)
_icons=('color' 'white')
_resolutions=('1080p' '1440p')
for _theme in "${_themes[@]}"; do
    for _icon in "${_icons[@]}"; do
        for _resolution in "${_resolutions[@]}"; do
            pkgname+=( "${_prefix}-${_theme}-${_icon}-${_resolution}-git" )
        done
    done
done

pkgver() {
    cd "dedsec-grub-theme"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package() {
    cd "dedsec-grub-theme"
    install -Dm644 "LICENSE"                                    -t "${pkgdir}/usr/share/licenses/${theme}-${icon}-${resolution}-git"
    install -Dm644 "base/${resolution}/"*                       -t "${pkgdir}/usr/share/grub/themes/${theme}-${icon}-${resolution}"
    install -Dm644 "assets/fonts/${resolution}/"*               -t "${pkgdir}/usr/share/grub/themes/${theme}-${icon}-${resolution}"
    install -Dm644 "assets/icons-${resolution}/${icon}/"*       -t "${pkgdir}/usr/share/grub/themes/${theme}-${icon}-${resolution}/icons"
    install -Dm644 "assets/backgrounds/${theme}-${resolution}.png" "${pkgdir}/usr/share/grub/themes/${theme}-${icon}-${resolution}/background.png"
}

main() {
    for _pkgname in "${pkgname[@]}"; do
        eval "package_${_pkgname}() {
            provides=("${_pkgname%-*}")
            theme="$(echo "${_pkgname}" | awk -F '-' '{print $3}')"
            icon="$(echo "${_pkgname}" | awk -F '-' '{print $4}')"
            resolution="$(echo "${_pkgname}" | awk -F '-' '{print $5}')"
            _package
        }"
    done
}

main
