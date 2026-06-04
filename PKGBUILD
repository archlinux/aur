# Maintainer: rzhli <tayuebuliuhen@gmail.com>
pkgname=thinkorswim
pkgver=1991.3.0
pkgrel=1
pkgdesc='Schwab thinkorswim trading platform'
arch=('x86_64')
url='https://www.schwab.com/trading/thinkorswim/download'
license=('LicenseRef-thinkorswim')
depends=('bash' 'jre21-openjdk')
options=('!strip' '!debug')
conflicts=('thinkorswim-bin')
source=(
  "thinkorswim_installer-${pkgver}.sh::https://tosmediaserver.schwab.com/installer/InstFiles/thinkorswim_installer.sh"
  'thinkorswim.desktop'
)
sha256sums=(
  '37f846f2f2826f634970d03eb77555dce58f4cc3eebc4212f548214ad1310be0'
  '84335a6eff765144ceb77db702c3eaf5933644dca1aefaa09ffbb84ac4ff457a'
)

_java21_home() {
  local dir version

  for dir in ${JAVA21_HOME:-} /usr/lib/jvm/java-21-openjdk /usr/lib/jvm/zulu-21 /usr/lib/jvm/java-21* /usr/lib/jvm/*21*; do
    [[ -n "${dir}" && -x "${dir}/bin/java" ]] || continue
    version=$("${dir}/bin/java" -version 2>&1 | sed -n 's/.*version "\([^"]*\)".*/\1/p' | head -n 1)
    [[ "${version}" == 21* ]] || continue
    printf '%s\n' "${dir}"
    return 0
  done

  printf 'Java 21 was not found. Install jre21-openjdk or set JAVA21_HOME.\n' >&2
  return 1
}

build() {
  local installer="${srcdir}/thinkorswim_installer-${pkgver}.sh"
  local fake_home="${srcdir}/fake-home"
  local cache_home="${srcdir}/cache"
  local app_dir="${fake_home}/thinkorswim"
  local java_home

  java_home=$(_java21_home)

  rm -rf "${fake_home}" "${cache_home}"
  mkdir -p "${fake_home}" "${cache_home}"
  HOME="${fake_home}" \
  XDG_CACHE_HOME="${cache_home}" \
  INSTALL4J_JAVA_HOME_OVERRIDE="${java_home}" \
  INSTALL4J_ADD_VM_PARAMS="-Duser.home=${fake_home}" \
    sh "${installer}" -q

  [[ -x "${app_dir}/thinkorswim" ]]

  rm -f \
    "${app_dir}/client.err" \
    "${app_dir}/client.out" \
    "${app_dir}/suit.log" \
    "${app_dir}/suit.usergui.log" \
    "${app_dir}/uninstall" \
    "${app_dir}/.install4j/autoUninstall.1" \
    "${app_dir}/.install4j/installation.log"

  sed -i "s#${app_dir}#/usr/lib/${pkgname}#g" \
    "${app_dir}/.install4j/install.prop" \
    "${app_dir}/.install4j/response.varfile"

  if [[ -f "${app_dir}/.install4j/files.log" ]]; then
    sed -i \
      -e '\#<entry name="/.*/Desktop/thinkorswim.desktop"#d' \
      -e "s#${app_dir}#/usr/lib/${pkgname}#g" \
      "${app_dir}/.install4j/files.log"
  fi
}

package() {
  local app_dir="${srcdir}/fake-home/thinkorswim"

  rm -f \
    "${app_dir}/client.err" \
    "${app_dir}/client.out" \
    "${app_dir}/suit.log" \
    "${app_dir}/suit.usergui.log"

  install -d "${pkgdir}/usr/lib"
  cp -a --no-preserve=ownership "${app_dir}" "${pkgdir}/usr/lib/${pkgname}"
  rm -f \
    "${pkgdir}/usr/lib/${pkgname}/client.err" \
    "${pkgdir}/usr/lib/${pkgname}/client.out" \
    "${pkgdir}/usr/lib/${pkgname}/suit.log" \
    "${pkgdir}/usr/lib/${pkgname}/suit.usergui.log"
  ln -s "/usr/lib/jvm/java-21-openjdk" "${pkgdir}/usr/lib/${pkgname}/jre"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/thinkorswim" "${pkgdir}/usr/bin/thinkorswim"
  install -Dm644 "${srcdir}/thinkorswim.desktop" "${pkgdir}/usr/share/applications/thinkorswim.desktop"
  install -Dm644 "${app_dir}/.install4j/thinkorswim.png" "${pkgdir}/usr/share/pixmaps/thinkorswim.png"
  install -Dm644 "${app_dir}/license_en.html" "${pkgdir}/usr/share/licenses/${pkgname}/license_en.html"

  printf '%s-%s\n' "${pkgver}" "${pkgrel}" > "${pkgdir}/usr/lib/${pkgname}/pkgver"
}
