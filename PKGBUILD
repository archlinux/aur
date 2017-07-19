# Maintainer:  Mihails Strasuns <public@dicebot.lv>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
pkgname=dub
pkgver=1.4.0
pkgrel=1
pkgdesc="Developer package manager for D programming language"
arch=('x86_64')
url="https://github.com/D-Programming-Language/dub"
license=('MIT')
makedepends=('dmd' 'libphobos-devel')
depends=('curl')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/dlang/dub/archive/v${pkgver}.tar.gz)
sha512sums=('0a21149da3bb09b4c384464eab33adc640938baa9e0bbdac6335583aa6ffe4735846244f2897dfdbd12778ec218b256cf2c58c436c5ffa7244b327af49584ffe')

build()
{
  DC=dmd
  cd ${pkgname}-${pkgver}

  echo Generating version file...
  GITVER=${pkgver}
  echo "module dub.version_;" > source/dub/version_.d
  echo "enum dubVersion = \"$GITVER\";" >> source/dub/version_.d
  echo "enum initialCompilerBinary = \"$DC\";" >> source/dub/version_.d

  $DC -ofbin/dub -w -g -version=DubUseCurl -Isource -L-lcurl @build-files.txt
}

package()
{
  cd ${pkgname}-${pkgver}
  install -D -m755 bin/dub "${pkgdir}/usr/bin/dub"
  install -D -m644 scripts/bash-completion/dub.bash $pkgdir/usr/share/bash-completion/completions/dub
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
