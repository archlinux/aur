# Maintainer: true_lock <anonyson@proton.me>

pkgname=battles-of-brass-git
_pkgname=battles-of-brass
pkgver=1.0.r38.4d2284b
pkgrel=1
pkgdesc='Battles of Brass, a game inspired by Spirits of Steel, made in java! (git version)'
arch=('any')
url='https://github.com/BattlesOfBrass/BOB'
license=('GPL-3.0-only')
depends=('java-runtime>=21')
makedepends=('git' 'gradle' 'jdk21-openjdk')
install="${pkgname}.install"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/BattlesOfBrass/BOB.git"
        "${_pkgname}-assets::git+https://github.com/BattlesOfBrass/assets.git"
        'bob.sh'
        'bob.desktop')
sha256sums=('SKIP'
            'SKIP'
            'd994af5ecddd8327bb721d41585908db1cadc2486a959706d76b6ed455be7a64'
            'f3a629d5fde3b39df40db2c64d9b57814502748d7a5f2146c11eb8801338afd0')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # The upstream has no tags, so build the version from gradle.properties
  # (e.g. "1.0-SNAPSHOT" -> "1.0") plus the commit count and short hash
  local _ver
  _ver=$(sed -n 's/^appVersion=\([0-9.]*\).*/\1/p' gradle.properties)
  printf '%s.r%s.%s' "${_ver:-0}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Requires a Java 21 toolchain
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  export PATH="${JAVA_HOME}/bin:${PATH}"
  # Keep Gradle's cache inside the build directory
  export GRADLE_USER_HOME="${srcdir}/gradle-home"

  # Only build the fat JAR.
  gradle shadowJar \
    --no-daemon \
    --console=plain \
    -Dorg.gradle.java.installations.auto-download=false
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 build/libs/BOB-main.jar \
    "${pkgdir}/usr/share/java/${_pkgname}/BOB-main.jar"

  install -Dm755 "${srcdir}/bob.sh" "${pkgdir}/usr/bin/bob"
  install -Dm644 "${srcdir}/bob.desktop" \
    "${pkgdir}/usr/share/applications/bob.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-assets/logo/BOB_logo_large.png" \
    "${pkgdir}/usr/share/pixmaps/bob.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Changelog for the upgrade message (see ${pkgname}.install).
  # The hash of the currently installed version is read from pacman, so the
  # list only contains commits that came in since the last update.
  local _installed _old _log
  _installed=$(pacman -Q "${pkgname}" 2>/dev/null | awk '{print $2}')
  _old=${_installed%-*}   # strip pkgrel
  _old=${_old##*.}        # keep the short commit hash
  if [[ -n "${_old}" ]] && git cat-file -e "${_old}^{commit}" 2>/dev/null; then
    _log=$(git log --no-decorate --format='  %h %s' -n 30 "${_old}..HEAD")
  fi
  if [[ -n "${_log}" ]]; then
    # Strip control characters, since pacman prints this text as root
    printf '%s\n' "${_log}" | sed 's/[[:cntrl:]]//g' |
      install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/doc/${pkgname}/changes.txt"
  fi
}
