# Maintainer: Charlie Wolf <charlie@wolf.is>

_branch=master
_pkgname=asciiflow2
pkgname=${_pkgname}-git
pkgver=r132.f9e489c
pkgrel=2
pkgdesc="ASCII flow chart editor"
arch=('x86_64' 'i686')
url="https://github.com/lewish/asciiflow2"
license=('unknown')  # See: 
depends=('electron>=1.4.0')
makedepends=('asar')
provides=('asciiflow2')

sha256sums=('SKIP'
'8288ce0bfcb5701d540db69c8f22083fb7dc7fcb400f201b5f1fc756196759c4'
'e062178509ae01a1ab2721291d668bf143471957c5a7f987a35db72a765bea40') 

source=("asciiflow2::git+https://github.com/lewish/${_pkgname}.git#branch=${_branch}" "${_pkgname}.sh" "${_pkgname}.desktop")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf ${srcdir}/${_pkgname}-dist
    cp -R ${srcdir}/${_pkgname} ${srcdir}/${_pkgname}-dist
    rm ${srcdir}/${_pkgname}-dist/closure-compiler.jar
    rm -rf ${srcdir}/${_pkgname}-dist/.git
    asar pack ${srcdir}/${_pkgname}-dist ${srcdir}/${_pkgname}.asar
}
package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}/images/favicon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.asar" "${pkgdir}/usr/share/${_pkgname}/app.asar"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
