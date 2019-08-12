# Maintainer: Michael Taboada <michael@2mb.solutions>
# Contributer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=horseshoes
pkgver=1.0.5
pkgrel=1
pkgdesc="Audio only game of horseshoes."
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/2mb-solutions/horseshoes"
license=('MIT')
depends=('speech-dispatcher' 'allegro')
makedepends=('gcc' 'git')
optdepends=('espeak: TTS support'
	'festival: TTS support'
	'flite: TTS support')
source=("git+https://github.com/2mb-solutions/$pkgname.git"
        "$pkgname.desktop"
        "$pkgname.sh")
md5sums=('SKIP'
        '7be0952ea7c4286f9f64d39bd98f1497'
         '8f6e9504843af79b9a3761d833c2fdb9')

prepare()
{
  cd "$srcdir"
  cd "$pkgname"
  git checkout v${pkgver}
  git submodule update --init
}

build()
{
  cd "$pkgname"
  make package
}

package()
 {
  cd "$pkgname"
  install -d "$pkgdir/opt/horseshoes"
  cd packages
  _packagefile="$(ls -1 *.tar.xz |head -n1)"
  tar xf $_packagefile
  cp -r ${_packagefile/.tar.xz//}/* "${pkgdir}/opt/$pkgname/"
  # Remove libraries that are installed already on arch from the directory
  rm -rf "${pkgdir}/opt/$pkgname/lib"
  # execute bit for horseshoes
  chmod 755 "${pkgdir}/opt/$pkgname/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  }

# vim:set ts=2 sw=2 et:
