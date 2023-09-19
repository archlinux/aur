# Maintainer: Kppqju77 <ju.adde-gmail-com>

pkgname=flutter-beta
pkgver=3.15.0_15.1.pre
pkgrel=2
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname%-beta}.dev"
license=("custom" "BSD" "CCPL")
depends=("git" "glu" "java-environment" "libglvnd" "unzip")
optdepends=("android-sdk" "android-studio" "dart" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "perl" "python" "android-sdk-cmdline-tools-latest: for android checks" "cmake: for linux desktop build" "ninja: for linux desktop build" "clang: for linux desktop build" "gtk3: for linux desktop build")
makedepends=("python")
provides=("${pkgname%-beta}=${pkgver}")
conflicts=("${pkgname%-beta}")
backup=("opt/${pkgname%-beta}/packages/${pkgname%-beta}_test/pubspec.yaml" "opt/${pkgname%-beta}/packages/${pkgname%-beta}/pubspec.yaml")
options=("!emptydirs")
install="${pkgname%-beta}.install"
source=(
  "${pkgname%-beta}-${pkgver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/beta/linux/${pkgname%-beta}_linux_${pkgver/_/-}-beta.tar.xz"
  "${pkgname%-beta}.sh"
  "${pkgname%-beta}.csh"
)
sha256sums=('6fc2503bc70b69d7d063dc27216c0d24da5b31886ff9654a9fa0d28bc50190f8'
            '1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a'
            '7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f')

build() {
  rm -rf "${srcdir}/${pkgname%-beta}/bin/cache" "${srcdir}/${pkgname%-beta}/.pub-cache"
  "${srcdir}/${pkgname%-beta}/bin/internal/update_dart_sdk.sh"
  "${srcdir}/${pkgname%-beta}/bin/flutter" --no-version-check precache
}

package() {
  install -Dm644 "${srcdir}/${pkgname%-beta}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname%-beta}.sh" "${pkgdir}/etc/profile.d/${pkgname%-beta}.sh"
  install -Dm755 "${srcdir}/${pkgname%-beta}.csh" "${pkgdir}/etc/profile.d/${pkgname%-beta}.csh"
  install -dm755 "${pkgdir}/opt/${pkgname%-beta}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${pkgname%-beta}" "${pkgdir}/opt/"

  # Version override
  echo "${pkgver}" > "${pkgdir}/opt/${pkgname%-beta}/version" 

  # Addition of read rights for end-users
  find "${pkgdir}/opt/${pkgname%-beta}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${pkgname%-beta}" -type f -exec chmod a+r {} +

  # Addition of read/write rights for end-users
  chmod a+rw "${pkgdir}/opt/${pkgname%-beta}" "${pkgdir}/opt/${pkgname%-beta}/.pub-preload-cache"
  chmod -R a+rw "${pkgdir}/opt/${pkgname%-beta}/version" "${pkgdir}/opt/${pkgname%-beta}/bin/cache" "${pkgdir}/opt/${pkgname%-beta}/.git"
  find "${pkgdir}/opt/${pkgname%-beta}" -name "pubspec.lock" -exec chmod a+rw {} +
  find "${pkgdir}/opt/${pkgname%-beta}" -name "package_config.json" -exec chmod a+rw {} +

  # Fix git ref migrations (will produce warnings on update)
  mv "${pkgdir}/opt/${pkgname%-beta}/.git" "${pkgdir}/opt/${pkgname%-beta}/.git-refs"

  ln -s "/opt/${pkgname%-beta}/bin/${pkgname%-beta}" "${pkgdir}/usr/bin/${pkgname%-beta}"
}