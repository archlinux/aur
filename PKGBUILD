# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=cgm-life-dataexport
pkgver=1.5.0
pkgrel=1
pkgdesc='Personal data exporter for Clickdoc (formerly CGM Life) accounts'
arch=('any')
url='https://one.cgm.com/clickdoc'
license=('LicenseRef-unknown')
_java=21
depends=(
  'bash'
  "java-openjfx=${_java}"  # provided by e.g. java21-openjfx or java21-openjfx-bin (AUR)
  "java-runtime-openjdk=${_java}"
)
makedepends=('dpkg' 'jq' 'python-j2cli')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.deb::https://docs.cgmlife.com/LIFEExportDesktopClient/PROD/${pkgname}-desktop-${pkgver}.deb"
  "${pkgname}.bash.j2"
  "${pkgname}.desktop"
)

sha512sums=(
  '86e7fd805bbff930233bb8530a2bb233c861d5129056ac001799f0a315125da59c01b6f431616fa047761dbaed401a773226024b06c3d47e744fe250b4b052e9'
  '00a28686c9be3aa4e0cf29efdf4063b274720dfbe0193a30dc2b4e7122693b67817d6915e169a6689bbd1f3c934899b358edcb3a76d14800ca3c4be7ba8d9f3a'
  '65bf0d3ecb145fbcc07cd80b4a4a376f92aed0dd78ee03e20272299081da4bda2535abd955f875b289189c00687d22e7c4b774ff3d74573f065299cfc8821a61'
)

prepare() {
  echo >&2 'Extracting upstream archive'
  dpkg-deb -x "${pkgname}-${pkgver}.deb" "${pkgname}-${pkgver}"

  echo >&2 'Asserting that bundled Java version matches depends entries'
  diff -u \
    --label 'Expected Java major version' <(echo "${_java}") \
    --label 'Actual Java major version' <(
      awk -F '"' -e '/JAVA_VERSION/ { print $2 }' \
        "${pkgname}-${pkgver}/opt/${pkgname}-desktop/lib/runtime/release" \
        | cut -d . -f 1
    )

  echo >&2 'Preparing the launcher'
  jq -n \
    --arg java "${_java}" \
    --arg modulePath "$(
      echo /usr/lib/jvm/"java-${_java}-openjdk"/lib/javafx.{base,controls,fxml,graphics,media,web}.jar \
        | tr " " :
    )" \
    --arg modules "$(
      awk -F '"' -e '/MODULES/ { gsub(/\s/, ",", $2); print $2 }' \
        "${pkgname}-${pkgver}/opt/${pkgname}-desktop/lib/runtime/release"
    )" \
    --arg pkgver "${pkgver}" \
    '{ $java, $modulePath, $modules, $pkgver }' \
    | j2 -f json -o "${pkgname}-desktop" "${pkgname}.bash.j2" -
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "opt/${pkgname}-desktop/share/doc/copyright"

  echo >&2 'Packaging application icon'
  install -D -m 644 -T \
    "opt/${pkgname}-desktop/lib/${pkgname}-desktop.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging desktop file'
  install -D -m 644 -t "${pkgdir}/usr/share/applications" \
    ../"${pkgname}.desktop"

  echo >&2 'Packaging application files'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    "opt/${pkgname}-desktop/lib/app" \

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" ../"${pkgname}-desktop"
}
