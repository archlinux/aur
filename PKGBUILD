# Mantainer: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>, WithTheBraid <the-one@with-the-braid.cf>

pkgname=('flutter-light-common' 'flutter-light-android-arm' 'flutter-light-android-arm64' 'flutter-light-android-x86' 'flutter-light-android-x64' 'flutter-light-web' 'flutter-light-linux')
pkgbase=flutter-light
_pkgname=flutter
pkgver=3.3.10
pkgrel=1
makedepends=("python")
optdepends=("android-sdk" "android-studio" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "ninja" "perl" "python")

arch=("x86_64" "aarch64")
url="https://${_pkgname}.dev"
license=("custom" "BSD" "CCPL")
options=("!emptydirs")
source=(
  "${_pkgname}-${pkgver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${_pkgname}_linux_${pkgver/.hotfix/+hotfix}-stable.tar.xz"
  "${_pkgname}.sh"
  "${_pkgname}.csh"
)

sha256sums=('d24e83f7a6b829d163feeef1abfcc30869f0c5d1af93e9917426265dad507024'
            '1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a'
            '7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f')

build() {
  rm -rf "${srcdir}/${_pkgname}/bin/cache/"
  #sed -i "s/\$FLUTTER_ROOT\/bin\/cache\/dart-sdk/\/opt\/dart-sdk/g" "${srcdir}/${_pkgname}/bin/internal/shared.sh"
  sed -i "/\"\$FLUTTER_ROOT\/bin\/internal\/update_dart_sdk.sh\"/d" "${srcdir}/${_pkgname}/bin/internal/shared.sh"
  mkdir -p "${srcdir}/${_pkgname}/bin/cache/"
  rm -rf ${srcdir}/${_pkgname}/bin/cache/{dart-sdk,engine.stamp}
  ln -sf "/opt/dart-sdk" "${srcdir}/${_pkgname}/bin/cache/dart-sdk"
  ln -s "${srcdir}/${_pkgname}/bin/internal/engine.version" "${srcdir}/${_pkgname}/bin/cache/engine.stamp"
  "${srcdir}/${_pkgname}/bin/flutter" precache
}

package_flutter-light-common() {
  provides=(flutter)
  conflicts=(flutter)
  depends=("git" "glu" "java-environment>=8" "libglvnd" "unzip" "dart" "flutter-light-android-arm64" "dart")
  arch=("x86_64" "aarch64")
  backup=("opt/${_pkgname}/packages/${_pkgname}_test/pubspec.yaml" "opt/${_pkgname}/packages/${_pkgname}/pubspec.yaml")
  pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android. Using the dart package provided by Arch devs (slower updates)"
  install="${pkgbase}.install"
  
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${srcdir}/${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/opt/"
  rm -rf ${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine/{android*,linux*}
  rm -rf "${pkgdir}/opt/${_pkgname}/bin/cache/flutter_web_sdk"
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
  # those files *must* be read-write for end-users; not my fault *grumble*
  chmod a+rw "${pkgdir}/opt/${_pkgname}/version" "${pkgdir}/opt/${_pkgname}/bin/cache/lockfile" "${pkgdir}/opt/${_pkgname}/bin/cache/usbmuxd.stamp" "${pkgdir}/opt/${_pkgname}/bin/cache/libimobiledevice.stamp"
  ln -s "/opt/${pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/"
}

package_flutter-light-android-arm() {
  depends=("flutter")
  
  install -dm755 "${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/${_pkgname}/bin/cache/artifacts/engine/android-arm" "${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/${_pkgname}/bin/cache/artifacts/engine/android-arm-* ${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine
  
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
}

package_flutter-light-android-arm64() {
  depends=("flutter")
  
  install -dm755 "${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/${_pkgname}/bin/cache/artifacts/engine/android-arm64* ${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine
  
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
}

package_flutter-light-android-x86() {
  depends=("flutter")

  install -dm755 "${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/${_pkgname}/bin/cache/artifacts/engine/android-x86* ${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine
  
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
}

package_flutter-light-android-x64() {
  depends=("flutter")

  install -dm755 "${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/${_pkgname}/bin/cache/artifacts/engine/android-x64 ${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine
  
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
}

package_flutter-light-web() {
  depends=("flutter")

  install -dm755 "${pkgdir}/opt/${_pkgname}/bin/cache"
  cp -ra "${srcdir}/${_pkgname}/bin/cache/flutter_web_sdk" "${pkgdir}/opt/${_pkgname}/bin/cache"
  
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
}

package_flutter-light-linux() {
  depends=("flutter")

  install -dm755 "${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/${_pkgname}/bin/cache/artifacts/engine/linux* ${pkgdir}/opt/${_pkgname}/bin/cache/artifacts/engine
  
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod a+r {} +
}
