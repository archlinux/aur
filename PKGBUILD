# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Based on shattered-pixel-dungeon package

pkgname=remixed-dungeon
pkgver=32.3.fix.1
pkgrel=1
pkgdesc='Classig roguelike game with pixel graphics, remix of Pixel Dungeon'
arch=(any)
url='https://wiki.nyrds.net/'
license=('GPL-3.0-only')
depends=('sh' 'java-runtime>=17')
makedepends=(
  jdk17-openjdk
  gradle8
)
_arch_suf='tar.gz'
source=(
  "${pkgname}-${pkgver}.${_arch_suf}::https://github.com/NYRDS/${pkgname}/archive/refs/tags/${pkgver}.${_arch_suf}"
  "${pkgname}-wrapper.sh"
  "${pkgname}.desktop"
)
b2sums=(
  '7bee58abb066ecb386c1fcfea5f8be6f39028b660b87b62b98c0480a3fbb010d1fba00def9a29e981b6816d5154bb5e973daa110db892473843c5c8014104926'
  'f6b83b27e643536d51d0a2e1acaa8efff58fee65f31e495ee10c6d8fb2efad0eedd50788d7c7e632712e4112e229814ad7210cae0f7298d6bda61b595f126145'
  '58e8e707e57607fcb9a831abadd6412bba85b39e885d7526a84e028960c8e1a631c5a8c1475b5448e4bf506331f5948dd33803baba229dc290dbb5a4326c8410'
)
_game_srcdir="${pkgname}-${pkgver}"

build() {
  cd "$_game_srcdir"
  export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
  gradle8 build RemixedDungeonDesktop:shadowJar
}

package() {
  cd "$_game_srcdir"
  opt_root="${pkgdir}/opt/${pkgname}"


  install -vDm644 \
    'RemixedDungeonDesktop/build/libs/RemixedDungeon.jar'\
    "${opt_root}/bin/remixed-dungeon.jar"

  mkdir -p "${opt_root}/data/mods/"
  cp -rLv 'RemixedDungeonDesktop/src/desktop/assets' "${opt_root}/data/mods/Remixed"

  cp -rLv RemixedDungeonDesktop/src/desktop/d_assets/* \
    "${opt_root}/data/mods/Remixed/"
  cp -rLv RemixedDungeonDesktop/src/desktop/l10ns/* \
    "${opt_root}/data/mods/Remixed/"

  install -vDm644 'GameServices/icon.png' \
    "${pkgdir}/usr/share/icons/${pkgname}.png"

  mkdir -p "${pkgdir}/usr/bin/"
  install -vDm755 "$srcdir/remixed-dungeon-wrapper.sh" "${pkgdir}/usr/bin/"

  install -vDm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/$pkgname.desktop"
}
