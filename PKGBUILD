_pkgname=manjaro-hello
pkgname=${_pkgname}-git
pkgver=0.1
pkgrel=1
pkgdesc="A tool that helps the new user of Manjaro in the discovery of the system."
url="https://github.com/Huluti/${_pkgname}"
arch=('any')
license=('GPL')
depends=('gtk3' 'python3')
optdepends=('calamares: universal installer framework')
makedepends=('git')
replaces=('manjaro-hello')
provides=('manjaro-hello')
conflicts=('manjaro-hello')
source=("${_pkgname}::git+https://github.com/Huluti/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    cp -r data "${pkgdir}/usr/share/${_pkgname}"
    cp -r ui "${pkgdir}/usr/share/${_pkgname}"
    install -D -m644 ${_pkgname}.desktop ${pkgdir}/etc/skel/.config/autostart/${_pkgname}.desktop
    install -D -m644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -D -m755 "src/manjaro_hello.py" "${pkgdir}/usr/bin/${_pkgname}"
    cd "po"
    for lang in $(ls -1 | sed -e 's/\..*$//'); do
        if [ ${lang} != ${_pkgname} ]
        then
            install -d -m755 ${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES
            msgfmt -c -o "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/${_pkgname}.mo" ${lang}.po
        fi
    done
}
