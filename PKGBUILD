# Maintainer: Philip May <eniak.info@gmail.com>
# Contributor: mark blakeney at bullet dash systems dot net
_appname=pycharm-community
pkgname="$_appname-jre"
pkgver=2024.2.0.1
pkgrel=2
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
            'c8c09631672ef6b639407d0bc92099b9b9ef0469dea6052be9854c71a0043738')
sha256sums_x86_64=('d9befc260f48b9809f84cefd05761848ee8be643b49c595e13fd1443c967eb25')
sha256sums_aarch64=('3c954950fb616dc85dc0da6475feee6d67363a537df451ee8fe25aeb6e473b86')

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
