# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: envolution
# Contributor: Ralph Torres <mail@ralphptorr.es>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: White-Oak <lpzhelud@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=servo-nightly-bin
_pkgname=servo
pkgver=20261104
pkgrel=1
pkgdesc='Parallel Browser Project: web browser written in Rust'
arch=(x86_64)
url='https://servo.org'
license=(MPL-2.0)
depends=(
  bzip2
  fontconfig
  freetype2
  glu
  gst-plugins-bad
  libgl
  libxcursor
  libxi
  libxmu
  libxrandr
  mesa
  python-dbus
  ttf-font
  xcb-util
)
provides=(${_pkgname})
conflicts=(${_pkgname})

# prepare download URL from stored pkgver
_datecode=$(echo "${pkgver}" | sed 's/\(....\)\(..\)\(..\)/\1-\2-\3/')
_url="https://github.com/servo/servo-nightly-builds/releases/download/${_datecode}"

source=(
  "${_pkgname}-${pkgver}.tar.gz::${_url}/${_pkgname}-x86_64-linux-gnu.tar.gz"
  "${_pkgname}-${pkgver}.tar.gz.sha256::${_url}/${_pkgname}-x86_64-linux-gnu.tar.gz.sha256"
  'LICENSE-servo::https://raw.githubusercontent.com/servo/servo/main/LICENSE'
)
sha256sums=('0c60d0ccb49e54b1cfa479e4a91ddbab05ae726d2d46389edb6e37f487184c75'
            '49e7adfa3ed95bc811fb5f052a2e17f30f167255f19f794ffc57f1cd2a729014'
            '1af2d2b02d9c86030d29ed77117ca7a1b0e4b6ff35bcf8eeb124867d0f5cb59e')

prepare() {
  sha256sum ${_pkgname}-${pkgver}.tar.gz | sha256sum -c
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "servo/resources/org.${_pkgname}.${_pkgname^}.desktop"

  sed -i "${pkgdir}/usr/share/applications/org.servo.${_pkgname^}.desktop" -e "s|Exec=SERVO_SRC_PATH/target/release/|Exec=/usr/lib/servo/|g"

  install -Dm644 LICENSE-servo "${pkgdir}"/usr/lib/${_pkgname}/LICENSE
  install -Dm755 /dev/stdin "${pkgdir}"/usr/bin/${_pkgname}shell << END
#!/bin/sh
exec /usr/lib/servo/servoshell "\$@"
END

  install -Dm755 "${_pkgname}/${_pkgname}shell" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}shell"
  cp -r "${_pkgname}/resources" "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm644 "${_pkgname}/resources/servo_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/servo.png"
  install -Dm644 "${_pkgname}/resources/servo_1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/servo.png"
  install -Dm644 "${_pkgname}/resources/servo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/servo.svg"
  find "${pkgdir}/usr/lib/${_pkgname}/resources" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/${_pkgname}/resources" -type f -exec chmod 644 {} +
}
