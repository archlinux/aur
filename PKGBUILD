# Maintainer: Shalygin Konstantin (k0ste@cn.ru)

pkgname='qutim'
pkgver=0.3.1.1294.gb443658
pkgrel=0
pkgdesc='qutIM is module-based multiprotocol instant messenger, Qt. All its functionality and features are implemented through separate plugins.'
arch=('any')
url="https://github.com/k0ste/${pkgname}"
license=('GPL')
depends=('qt5-quick1' 'qt5-multimedia' 'qt5-x11extras')
makedepends=('qbs' 'git' 'gcc' 'sdl_mixer' 'gsasl' 'libotr' 'qtkeychain-qt5' 'qt5-quick1' 'qt5-multimedia' 'qt5-x11extras' 'hunspell' 'aspell')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

prepare() {
  pushd "${srcdir}/${pkgname}"
  git submodule update --init
  cd "${srcdir}/${pkgname}/artwork"
  git checkout master
  cd "${srcdir}/${pkgname}/qbs"
  git checkout master
  cd "${srcdir}/${pkgname}/src/plugins/generic/docktile/qtdocktile"
  git checkout master
  cd "${srcdir}/${pkgname}/src/plugins/protocols/jabber/jreen"
  git checkout master
  cd "${srcdir}/${pkgname}/src/qml/imports/Controls"
  git checkout master
  cd "${srcdir}/${pkgname}/translations"
  git checkout master
  popd

  qbs setup-qt --detect
  qbs setup-qt /usr/bin/qmake ${pkgname}
  qbs setup-toolchains /usr/bin/gcc ${pkgname}-gcc
  qbs config profiles.${pkgname}.baseProfile ${pkgname}-gcc
}

build() {
  pushd "${srcdir}/${pkgname}"
  qbs build -j 2 -d ../${pkgname}-build debug profile:${pkgname} project.addressSanitizer:true indicator.condition:false offtherecord.condition:true
}

package() {
  pushd "${srcdir}/${pkgname}"
  qbs install -d ../${pkgname}-build --no-build --install-root "${srcdir}/${pkgname}-install" profile:${pkgname}
  popd
  pushd "${srcdir}/${pkgname}-install"
  install -Dm775 "bin/qutim" "${pkgdir}/usr/bin/qutim"
  cp -ax "lib" "${pkgdir}/usr"
  cp -ax "share" "${pkgdir}/usr"
  popd
  cp -ax "${srcdir}/${pkgname}/src/share/applications" "${pkgdir}/usr/share"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/"
  cp -ax "${pkgdir}/usr/share/apps/${pkgname}/icons/hicolor" "${pkgdir}/usr/share/icons"
  install -Dm644 "${srcdir}/${pkgname}/GPL" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
