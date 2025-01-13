# Maintainer: Philip May <eniak.info@gmail.com>
# Contributor: mark blakeney at bullet dash systems dot net
_appname=pycharm-community
pkgname="$_appname-jre"
pkgver=2024.3.1.1
pkgrel=1
pkgdesc="PyCharm Community Edition IDE for Python with bundled JRE"
arch=(x86_64 aarch64)
url="https://www.jetbrains.com/pycharm/"
license=('Apache-2.0')
conflicts=(
  "pycharm-community-eap"
  "pycharm-community-edition"
)
source=(
  pycharm.desktop
  pycharm.sh
)

source_x86_64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz")
source_aarch64=("https://download.jetbrains.com/python/pycharm-community-${pkgver}-aarch64.tar.gz")

options=(!strip)
sha256sums=('f727119ec7c8b96820e80712b1ee342de6a94ff72402e8f2d390cbff702f9b21'
            '81005f7c292a59ebfe0b0905e4dc90c0fa35b491465fde063ccf583860ba33b1')
sha256sums_x86_64=('36b9332262815099d0b86d2689fcf91b379730cb838623d82c0845969bb6470f')
sha256sums_aarch64=('cbc36953b6943e70468e1908bef9adddc2a9597124e5d794f294095888b0914c')

package() {
  cd "${_appname}-${pkgver}"

  # workaround FS#40934
  # see https://bugs.archlinux.org/task/40934
  sed -i 's/lcd/on/' bin/*.vmoptions

  rm -rf bin/fsnotifier-arm

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,pycharm}
  cp -dr --no-preserve='ownership' bin help jbr lib modules plugins \
    product-info.json "${pkgdir}"/usr/share/pycharm/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/pycharm/
  cp -dr --no-preserve='ownership' bin/pycharm.png "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 ../pycharm.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 755 ../pycharm.sh "${pkgdir}"/usr/bin/pycharm
}
