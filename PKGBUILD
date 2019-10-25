# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgbase=mindustry
pkgname=("${pkgbase}" "${pkgbase}-server")
pkgver=97
pkgrel=1
arch=('any')
_repo_name="Mindustry"
url="https://github.com/Anuken/${_repo_name}"
license=('GPL3')
depends=("java-environment=8" "sh" "hicolor-icon-theme")
makedepends=("libicns")
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Anuken/${_repo_name}/archive/v${pkgver}.tar.gz"
        "${pkgbase}.desktop"
        "${pkgbase}.sh"
        "${pkgbase}-server.desktop"
        "${pkgbase}-server.sh")
sha256sums=('8acdbcba19a4e4470b6a74ab5c0704dcf64b712e0ded0102e44060093835180e'
            'e5fd49ed3456c53e91b834cb388956e3f9ded4e2c880352d36cf9c2246ca0f0b'
            '938f5f9f636379402ba0bb9a53345de499f4f3fd50f232b31605129dcf4ea6c9'
            '053030932334f40145e927f6c7e9ebf01bd28ddd1e7b9fba6234b51cc83ad241'
            '679727847ba70773cee4f902114345e095b27f425aa00c4d3860d247705ed1f0')

build() {
  cd "${_repo_name}-${pkgver}"
  ./gradlew --no-daemon dist -Pbuildversion="${pkgver}"

  cd core/assets/icons
  icns2png --extract icon.icns
}

_package_common() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_repo_name}-${pkgver}"
  local icon_size; for icon_size in 256 512 1024; do
    install -Dm644 "core/assets/icons/icon_${icon_size}x${icon_size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${pkgname}.png"
  done
}

package_mindustry() {
  pkgdesc="A sandbox tower defense game written in Java"
  _package_common
  install -Dm755 "desktop/build/libs/Mindustry.jar" -t "${pkgdir}/usr/share/java/${pkgname}"
}

package_mindustry-server() {
  pkgdesc="Server of a sandbox tower defense game written in Java"
  _package_common
  install -Dm755 "server/build/libs/server-release.jar" -t "${pkgdir}/usr/share/java/${pkgname}"
}
