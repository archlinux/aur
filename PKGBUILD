# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=flutter-git
pkgver=0.2.9.r39.d121cbc80
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname%-git}.io"
license=("custom:https://github.com/${pkgname%-git}/${pkgname%-git}/blob/master/LICENSE")
depends=("glu" "java-environment" "lib32-libglvnd")
optdepends=("android-sdk"
            "android-studio"
            "bash"
            "dart"
            "git"
            "intellij-idea-community-edition"
            "intellij-idea-ultimate-edition"
            "perl"
            "python"
            "sh")
makedepends=("git" "python")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("opt/${pkgname%-git}/packages/${pkgname%-git}_test/pubspec.yaml" "opt/${pkgname%-git}/packages/${pkgname%-git}/pubspec.yaml")
options=("!emptydirs")
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/${pkgname%-git}/${pkgname%-git}"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.csh")
sha256sums=("SKIP"
            "1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a"
            "7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[a-Z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  "bin/${pkgname%-git}" doctor
}

package() {
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/etc/profile.d/${pkgname%-git}.sh"
  install -Dm755 "${srcdir}/${pkgname%-git}.csh" "${pkgdir}/etc/profile.d/${pkgname%-git}.csh"
  install -d "${pkgdir}/opt/${pkgname%-git}/"
  cp -ra "${srcdir}/${pkgname%-git}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${pkgname%-git}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${pkgname%-git}" -type f -exec chmod a+r {} +
}
