# Maintainer: Charlie Wolf <charlie@wolf.is>

_branch=master
_pkgname=asciiflow2
pkgname=${_pkgname}-git
pkgver=r192.f9f13e4
pkgrel=4
pkgdesc="ASCII flow chart editor"
arch=('x86_64' 'i686')
url="https://github.com/lewish/asciiflow2"
license=('MIT')
depends=('electron>=1.4.0')
makedepends=('bazelisk' 'rsync')
provides=('asciiflow2')

sha256sums=('SKIP'
            '2f75555c30e5b06769ab965a0fdb22928a72c27044ef36f5115655acb9d6085b'
            'e062178509ae01a1ab2721291d668bf143471957c5a7f987a35db72a765bea40'
            'd7c1e19100cb8f778ac408c4c3fcb0fd1dcbdf4685475b3b878aa5c65faac69d')

source=("asciiflow2::git+https://github.com/lewish/${_pkgname}.git#branch=${_branch}" "${_pkgname}.sh" "${_pkgname}.desktop" "index.js")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_pkgname}
    bazel build electron/...
    rm -rf  ${srcdir}/${_pkgname}-dist
    mkdir ${srcdir}/${_pkgname}-dist/
    cp -R ${srcdir}/${_pkgname}/bazel-bin/electron/electron.sh.runfiles/_main ${srcdir}/${_pkgname}-dist/asciiflow
    cp ${srcdir}/index.js ${srcdir}/${_pkgname}-dist/index.js
    mkdir -p ${srcdir}/${_pkgname}-dist/asciiflow/client/public/images
    cp  ${srcdir}/${_pkgname}-dist/asciiflow/client/public/favicon.png  ${srcdir}/${_pkgname}-dist/asciiflow/client/public/images/favicon.png
    chmod 644 ${srcdir}/${_pkgname}-dist/asciiflow/client/bundle.js ${srcdir}/${_pkgname}-dist/asciiflow/client/index.html
    sed -i 's|/public/logo|public/logo|g' ${srcdir}/${_pkgname}-dist/asciiflow/client/bundle.js
    sed -i 's|/public/logo|public/logo|g' ${srcdir}/${_pkgname}-dist/asciiflow/client/index.html
}
package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}/dist"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}/legacy/images/favicon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  rsync -av "${srcdir}/${_pkgname}-dist/" "${pkgdir}/usr/share/${_pkgname}/dist/"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
