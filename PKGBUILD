# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: bradpitcher
# Contributor: mkurz
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=signal-desktop-arm
_pkgname=Signal-Desktop
pkgver=5.63.0
pkgrel=1
pkgdesc="Signal Private Messenger for Linux, for ARM and x86_64"
license=('AGPL3')
conflicts=('signal-desktop' 'signal-desktop-beta' 'signal-desktop-beta-bin')
arch=('x86_64' 'aarch64')
url="https://signal.org"
depends=('gtk3' 'libvips' 'libxss' 'hicolor-icon-theme' 'alsa-lib' 'openjpeg2')
makedepends=('yarn' 'git' 'git-lfs' 'nodejs-lts-gallium' 'npm' 'python' 'libxcrypt-compat' 'fpm')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "expire-from-source-date-epoch.patch"
)
sha512sums=('0e87eb9564297de8564502bb5538197fed1907bdd7b5defbe19d1e3307905eb6a3816d03f6fa421f9638b534597245e2ad50f01a0b0056a1c9717673f70b4731'
            '55b64c186cea00bf6d06aef353fd0ef103fdaed4fc86b773542c2379ef583b5ef97f08601fe68da72d99dbd1104df62892f9961eed2f1d9221de0fce2fa31a95'
            '1154859e87d8a2d649bc23210f2dd8aa473f268166559a51a2a64fe6ae094c101121535623b05b711bd87aab1f219627e9274fa542fdb0e5fe6f34b46fd7b7df')
b2sums=('48d234ed38da650e38e4ac737dfe83ab4203397482cea4b538eb103a682f5c744043822e85b3ecd463d4ae79b2878d8d107eeaf483f89a7387c52dcad1c35517'
        '0d099989fa38f65ccc42c8097df768244628824be24092d22116d41eca71c51d8cbc1e46189378cd26206c622bde7232e2dc4c1c007130736f1b454bbb84c2e8'
        '5a6dba4bfa799403ace721b143c5b54d3bff97ab0c3d30e94d312cf58ede2498886720247b0efcbbeffc0c95611a493625cef1f8bc06d3647b53ef2e44de96be')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # git-lfs hook needs to be installed for one of the dependencies
  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  yarn install --ignore-engines

  # We can't read the release date from git so we use SOURCE_DATE_EPOCH instead
  patch --forward --strip=1 --input="${srcdir}/expire-from-source-date-epoch.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  yarn generate
  USE_SYSTEM_FPM=true yarn build
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/"{lib,bin}
  cp -a release/linux-*unpacked "${pkgdir}/usr/lib/${pkgname}"
  ln -s "/usr/lib/${pkgname}/signal-desktop" "${pkgdir}/usr/bin/"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -Dm 644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

# vim: ts=2 sw=2 et:
