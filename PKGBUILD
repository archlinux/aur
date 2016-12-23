_pkgname=manjaro-hello
pkgname=${_pkgname}-git
pkgver=0.3.r1.g4d34afa
pkgrel=1
pkgdesc="A tool providing access to documentation and support for new Manjaro users."
url="https://github.com/Huluti/${_pkgname}"
arch=('any')
license=('GPL')
depends=('gtk3' 'python3')
optdepends=('calamares: Distribution-independent installer framework', 'manjaro-icons: Official Manjaro icons')
makedepends=('git')
replaces=('manjaro-hello')
provides=('manjaro-hello')
conflicts=('manjaro-hello')
source=("${_pkgname}::git+https://github.com/Huluti/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    cp -r data "${pkgdir}/usr/share/${_pkgname}"
    cp -r ui "${pkgdir}/usr/share/${_pkgname}"
    install -D -m644 ${_pkgname}.desktop ${pkgdir}/etc/skel/.config/autostart/${_pkgname}.desktop
    install -D -m644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -D -m755 "src/manjaro_hello.py" "${pkgdir}/usr/bin/${_pkgname}"
    cd po
    for lang in $(ls *.po); do
        install -d -m755 ${pkgdir}/usr/share/locale/${lang::-3}/LC_MESSAGES
        msgfmt -c -o "${pkgdir}/usr/share/locale/${lang::-3}/LC_MESSAGES/${_pkgname}.mo" ${lang}
    done
}
