# Maintainer: Kamack38 <kamack38.biznes@gmail.com>

_pkgbase=kawaiki-grub2-themes
pkgbase="${_pkgbase}-git"
pkgname=(
    'grub-theme-kawaiki-color-1080p-git'
    'grub-theme-kawaiki-white-1080p-git'
    'grub-theme-kawaiki-whitesur-1080p-git'
    'grub-theme-kawaiki-color-2k-git'
    'grub-theme-kawaiki-white-2k-git'
    'grub-theme-kawaiki-whitesur-2k-git'
    'grub-theme-kawaiki-color-4k-git'
    'grub-theme-kawaiki-white-4k-git'
    'grub-theme-kawaiki-whitesur-4k-git'
    'grub-theme-kawaiki-color-ultrawide-git'
    'grub-theme-kawaiki-white-ultrawide-git'
    'grub-theme-kawaiki-whitesur-ultrawide-git'
    'grub-theme-kawaiki-color-ultrawide2k-git'
    'grub-theme-kawaiki-white-ultrawide2k-git'
    'grub-theme-kawaiki-whitesur-ultrawide2k-git'
)
pkgver=r207.427aa2f
pkgrel=1
pkgdesc="Kawaiki Design themes for Grub"
arch=('any')
url="https://github.com/lucidtanooki/kawaiki-grub2-themes"
license=('GPL3')
depends=('grub')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/kawaiki-grub2-themes"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package() {
    cd "${srcdir}/${_pkgbase}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${name}-${icon}-${resolution}-git"/
    install -Dm 644 common/* -t "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/
    install -Dm 644 config/"theme-${resolution}.txt" "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/theme.txt
    install -Dm 644 backgrounds/"${resolution}"/"background-${name}.png" "${pkgdir}/usr/share/grub/themes/${name}-${icon}-${resolution}/background.png"
    for icons in 'color' 'white' 'whitesur'; do
        if [[ "${icon}" == "${icons}" ]]; then
            if [[ "${resolution}" == 'ultrawide' ]]; then
                install -Dm 644 assets/assets-select/select-1080p/* -t "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/
                install -Dm 644 assets/"assets-${icon}"/icons-1080p/* -t "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/icons/
                install -Dm 644 assets/info-1080p.png "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/info.png
            elif [[ "${resolution}" == 'ultrawide2k' ]]; then
                install -Dm 644 assets/assets-select/select-2k/* -t "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/
                install -Dm 644 assets/"assets-${icon}"/icons-2k/* -t "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/icons/
                install -Dm 644 assets/info-2k.png "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/info.png
            else
                install -Dm 644 assets/assets-select/"select-${resolution}"/* -t "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/
                install -Dm 644 assets/"assets-${icon}"/"icons-${resolution}"/* -t "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/icons/
                install -Dm 644 assets/"info-${resolution}.png" "${pkgdir}"/usr/share/grub/themes/"${name}-${icon}-${resolution}"/info.png
            fi
        fi
    done
}

main() {
    for _pkgname in "${pkgname[@]}"; do
        eval "package_${_pkgname}() {
            provides=("${_pkgname%-*}")
            conflicts=("${_pkgname%-*}")
            name="$(echo ${_pkgname%-*} | sed 's/grub-theme-//' | awk -F '-' '{print $1}')"
            icon="$(echo ${_pkgname%-*} | sed 's/grub-theme-//' | awk -F '-' '{print $2}')"
            resolution="$(echo ${_pkgname%-*} | sed 's/grub-theme-//' | awk -F '-' '{print $3}')"
            _package
        }"
    done
}

main
