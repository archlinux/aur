# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Antony Ho <ntonyworkshop@gmail.com>

pkgname=session-desktop
pkgver=1.14.2
pkgrel=1
pkgdesc="Onion routing based messenger"
arch=(x86_64)
url="https://getsession.org"
license=('GPL-3.0-only')
_electron=electron25
depends=('bash' "${_electron}" 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'python')
makedepends=('cmake' 'git' 'nvm' 'python-setuptools' 'yarn')
source=("git+https://github.com/oxen-io/session-desktop.git#tag=v${pkgver}"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('3efa6af7cbb615db5ba7c73af67bd6d54a44471b17f85d54ce14f04d354203a4'
            '267d772a94ba49b19e799e7ecee25c0077ded4dd9c853c073ec386a8ab6a7e5c'
            'a5279447d005060aa77536dcabe0ab66226f9cffa668dc0b6e07a2f1e52ab5ce')

prepare() {
  sed "s/@ELECTRON@/${_electron}/" -i "${pkgname}.sh"

  source /usr/share/nvm/init-nvm.sh

  cd "${pkgname}"
  nvm install
  yarn install
}

build() {
  cd "${pkgname}"
  export NODE_ENV=production SIGNAL_ENV=production
  yarn build-everything
  yarn electron-builder --linux --dir \
    -c.extraMetadata.environment=production \
    -c.electronDist="/usr/lib/${_electron}" \
    -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
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
