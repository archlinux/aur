# Maintainer:
# Contributor: Antony Ho <ntonyworkshop@gmail.com>

pkgname=session-desktop
pkgver=1.12.3
pkgrel=1
pkgdesc="Onion routing based messenger"
arch=(x86_64)
url="https://getsession.org"
license=('GPL-3.0-or-later')
_electron=electron25
depends=('bash' "${_electron}" 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'python')
makedepends=('cmake' 'git' 'nvm' 'yarn')
source=("git+https://github.com/oxen-io/session-desktop.git#tag=v${pkgver}"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('ed9d3952598c8d0e940c6cf9a96ff6a52c719509d9374e1d1db10b719e36522f'
            'fde2e8851d93a7a8ca2dc0338535362da3240208262d08155a594500e41a199b'
            'a5279447d005060aa77536dcabe0ab66226f9cffa668dc0b6e07a2f1e52ab5ce')

prepare() {
  source /usr/share/nvm/init-nvm.sh
  nvm install 18.15
  nvm use 18.15

  sed "s/@ELECTRON@/${_electron}/" -i "${pkgname}.sh"

  cd "${pkgname}"
  yarn install
}

build() {
  cd "${pkgname}"
  export SIGNAL_ENV=production
  yarn build-everything
  yarn electron-builder --linux --dir \
    --config.extraMetadata.environment="${SIGNAL_ENV}" \
    --config.electronDist="/usr/lib/${_electron}" \
    --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
  cd "${pkgname}"
  install -d "${pkgdir}/usr/lib"
  cp -r dist/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}"
  for i in 16 32 48 64 128 256 512 1024; do
    install -Dm644 "build/icons/icon_${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
