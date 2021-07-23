# Maintainer: Vedant K <gamemaker0042 at gmail dot com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Philip Goto <philip dot goto at gmail dot com>

# Mostly copied from the `flutter` aur package

_pkgname=flutter
_pkgver=2.4.0-4.0.pre

pkgname=flutter-dev
pkgver=2.4.0_4.0.pre
pkgrel=1
epoch=
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android"
arch=("any")
url="https://flutter.dev"
license=("custom" "BSD" "CCPL")
depends=("git" "glu" "java-environment" "libglvnd" "unzip")
optdepends=("android-sdk" "android-studio" "dart" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "perl" "python" "clang" "cmake" "gtk3" "ninja" "pkgconf")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-beta")
makedepends=("python")
backup=("opt/${_pkgname}/packages/${_pkgname}_test/pubspec.yaml" "opt/${_pkgname}/packages/${_pkgname}/pubspec.yaml")
options=("!emptydirs")
install="${_pkgname}.install"
source=("${_pkgname}-${_pkgver}.tar.gz::https://storage.googleapis.com/flutter_infra_release/releases/dev/linux/flutter_linux_${_pkgver}-dev.tar.xz"
				"${_pkgname}.sh"
  			"${_pkgname}.csh")
sha256sums=('9ab51abd5714e563d696363b8322b9caedea60479171310a1721b1f654ad0ea5'
            '1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a'
            '7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f')

build() {
  cd "${srcdir}/${_pkgname}"
  "${srcdir}/${_pkgname}/bin/${_pkgname}" doctor
}

package() {
  rm -rf "${srcdir}/${_pkgname}/bin/cache" "${srcdir}/${_pkgname}/.pub-cache"

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${srcdir}/${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
  
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
  chmod a+rw "${pkgdir}/opt/${_pkgname}/version"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
