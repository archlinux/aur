# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_name=packer
pkgname=packer-io
pkgver=0.10.2
pkgrel=2
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
depends=(unzip)
optdepends=()
conflicts=()
if test "$CARCH" == i686; then
source=(
  "${_name}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_386.zip"
  'https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer'
)
sha256sums=(
  'ffb1b4679b46f5149a41671a767519cfc36387210402a00d25fc296b01cf54ad'
  '070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459'
)
else
source=(
  "${_name}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip"
  'https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer'
)
sha256sums=(
  '86c78bae6bd09afb4ddb86915cb71a22fb81ea79578bbf65de3ef48c842d9b2b'
  '070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459'
)
fi
noextract=(${source[@]%%::*})

prepare() {
  if [[ -e ${srcdir}/${_name}-${pkgver} ]]; then rm -rf ${srcdir}/${_name}-${pkgver}; fi
  mkdir ${srcdir}/${_name}-${pkgver}
  unzip -o ${_name}-${pkgver}.zip -d ${srcdir}/${_name}-${pkgver}
}

package() {
  install -dm755 "${pkgdir}/usr/bin"

  cd "${srcdir}/${_name}-${pkgver}"
  for file in `ls ${srcdir}/${_name}-${pkgver}`; do
    if [ "$file" == "packer" ]; then
      install -Dm755 "$file" "${pkgdir}/usr/bin/${file}-io"
    else
      install -Dm755 "$file" "${pkgdir}/usr/bin/${file}"
    fi
  done
  install -Dm644 ${srcdir}/_packer ${pkgdir}/usr/share/zsh/site-functions/_packer
}
