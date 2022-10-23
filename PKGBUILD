# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Michael Taboada <michael@2mb.solutions>
_pkgname=horseshoes
pkgname=horseshoes-git
pkgver=1.0.7.r0.4395ab0
pkgrel=1
pkgdesc="Audio only game of horseshoes -- master branch."
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://2mb.games/games/horseshoes"
license=('MIT')
depends=('speech-dispatcher' 'allegro')
makedepends=('git')
optdepends=('espeak: TTS support'
	'festival: TTS support'
	'flite: TTS support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://git.2mb.codes/~lilmike/${_pkgname}"
        "$_pkgname.desktop"
        "$_pkgname.sh")
md5sums=('SKIP'
        '7be0952ea7c4286f9f64d39bd98f1497'
         '8f6e9504843af79b9a3761d833c2fdb9')
prepare()
{
  cd "$srcdir"
  cd "$_pkgname"
  git submodule update --init
  patch -p0 -i fix-warning.patch
}

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v\(.*\)/\1/g')"
}

build()
{
  cd "$_pkgname"
  make package
}

package()
 {
  cd "$_pkgname"
  install -d "$pkgdir/opt/horseshoes"
  cd packages
  _packagefile="$(ls -1 *.tar.xz |head -n1)"
  tar xf $_packagefile
  cp -r ${_packagefile/.tar.xz//}/* "${pkgdir}/opt/$_pkgname/"
  # Remove libraries that are installed already on arch from the directory
  rm -rf "${pkgdir}/opt/$_pkgname/lib"
  # execute bit for horseshoes
  chmod 755 "${pkgdir}/opt/$_pkgname/$_pkgname"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  }

# vim:set ts=2 sw=2 et:
