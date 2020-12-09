# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgbase=mindustry
pkgname=("${pkgbase}" "${pkgbase}-server")
_build=121.2
pkgver="6.0_${_build}"
pkgrel=1
epoch=1
arch=('any')
_repo_name="Mindustry"
url="https://github.com/Anuken/${_repo_name}"
license=('GPL3')
depends=("java-runtime>=8" "sh" "hicolor-icon-theme")
makedepends=("java-environment>=14" "libicns")
source=("${pkgbase}-${_build}.tar.gz::https://github.com/Anuken/${_repo_name}/archive/v${_build}.tar.gz"
        "${pkgbase}.desktop"
        "${pkgbase}.sh"
        "${pkgbase}-server.desktop"
        "${pkgbase}-server.sh")
sha256sums=('21d30cc5d2d81e993133fb530017badcf351fb6711c5288030e42c18e63165ff'
            'e5fd49ed3456c53e91b834cb388956e3f9ded4e2c880352d36cf9c2246ca0f0b'
            '938f5f9f636379402ba0bb9a53345de499f4f3fd50f232b31605129dcf4ea6c9'
            '053030932334f40145e927f6c7e9ebf01bd28ddd1e7b9fba6234b51cc83ad241'
            '679727847ba70773cee4f902114345e095b27f425aa00c4d3860d247705ed1f0')

build() {
  cd "${_repo_name}-${_build}"

  # NOTE: JDK discovery code is not needed for now because the upstream switched
  # to Gradle 6.x.  Keeping it just in case.

  # # find JDK older than 13 because Gradle 5.x doesn't support it
  # for java_dir in /usr/lib/jvm/*; do
  #   if ! [ -x "${java_dir}/bin/java" ]; then break; fi

  #   if [ -f "${java_dir}/release" ]; then
  #     version="$(sed -n 's/^JAVA_VERSION="\(.*\)"$/\1/p' "${java_dir}/release")"
  #   elif [ -f "${java_dir}/jre/lib/rt.jar" ]; then
  #     version="$(unzip -p "${java_dir}/jre/lib/rt.jar" META-INF/MANIFEST.MF | sed -n 's/Implementation-Version: 1\.\(.*\)$/\1/p')"
  #   else
  #     break
  #   fi

  #   if [ -z "${version}" ]; then break; fi

  #   if [ "$(vercmp "${version}" 8)" -ge 0 ] && [ "$(vercmp "${version}" 13)" -lt 0 ]; then
  #     msg2 "Using JDK v%s from %s" "${version}" "${java_dir}"
  #     msg2 "Edit the PKGBUILD if you wish to change the JDK used to compile %s" "${pkgbase}"
  #     found_correct_jdk=1
  #     break
  #   fi
  # done; unset version

  # if [ -z "$found_correct_jdk" ]; then
  #   error "Couldn't find a JDK with version >=8 and <13"
  #   return 1
  # fi

  # JAVA_HOME="${java_dir}" ./gradlew --no-daemon dist -Pbuildversion="${_build}" desktop:dist server:dist
  ./gradlew --no-daemon dist -Pbuildversion="${_build}" desktop:dist server:dist
  # unset java_dir

  cd core/assets/icons
  icns2png --extract icon.icns
}

_package_common() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_repo_name}-${_build}"
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
