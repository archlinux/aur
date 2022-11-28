# Mantainer: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>, WithTheBraid <the-one@with-the-braid.cf>

pkgname=flutter-light
_pkgname=flutter
provides=(flutter)
conflicts=(flutter)
pkgver=3.3.8
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64" "aarch64")
url="https://${_pkgname}.dev"
license=("custom" "BSD" "CCPL")
depends=("git" "glu" "java-environment" "libglvnd" "unzip" "dart")
optdepends=("android-sdk" "android-studio" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "ninja" "perl" "python")
makedepends=("python")
backup=("opt/${_pkgname}/packages/${_pkgname}_test/pubspec.yaml" "opt/${_pkgname}/packages/${_pkgname}/pubspec.yaml")
options=("!emptydirs")
install="${pkgname}.install"
source=(
  "${_pkgname}-${pkgver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${_pkgname}_linux_${pkgver/.hotfix/+hotfix}-stable.tar.xz"
  "${_pkgname}.sh"
  "${_pkgname}.csh"
)

sha256sums=('407fb5d05e9ad17604bc17ad8808b8e527f2ed64dd559d62f1538ee09b92236e'
            '1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a'
            '7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f')

build() {
  rm -rf "${srcdir}/${_pkgname}/bin/cache/" "${srcdir}/${_pkgname}/.pub-cache"
  sed -i "s/\$FLUTTER_ROOT\/bin\/cache\/dart-sdk/\/opt\/dart-sdk/g" "${srcdir}/${_pkgname}/bin/internal/shared.sh"
  sed -i "/\"\$FLUTTER_ROOT\/bin\/internal\/update_dart_sdk.sh\"/d" "${srcdir}/${_pkgname}/bin/internal/shared.sh"
  mkdir "${srcdir}/${_pkgname}/bin/cache/"
  ln -sf "/opt/dart-sdk" "${srcdir}/${_pkgname}/bin/cache/dart-sdk"
  cp "${srcdir}/${_pkgname}//bin/internal/engine.version" "${srcdir}/${_pkgname}/bin/cache/engine.stamp"
  "${srcdir}/${_pkgname}/bin/flutter" precache
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${srcdir}/${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
  # those files *must* be read-write for end-users; not my fault *grumble*
  chmod a+rw "${pkgdir}/opt/${_pkgname}/version" "${pkgdir}/opt/${_pkgname}/bin/cache/lockfile" "${pkgdir}/opt/${_pkgname}/bin/cache/usbmuxd.stamp" "${pkgdir}/opt/${_pkgname}/bin/cache/libimobiledevice.stamp"
  ln -s "/opt/${pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/"
}
