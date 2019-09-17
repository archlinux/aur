# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=chocolate-doom
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
pkgver=3.0.0
pkgrel=4
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
install=chocolate-doom.install
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II-compatible game')
conflicts=(chocolate-common
           chocolate-heretic
           chocolate-hexen
           chocolate-strife)
replaces=(${conflicts[@]})
source=(https://www.chocolate-doom.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc}
        0001_fix-bash-completion.patch)
sha512sums=('41f235c0d84ef21070636ad0610e97898dfd366fae7f9244bd2aebf8974db98dcf55f70bcab2f93589b9bf31dd421db32e8af88e0f8e0a655d2b9f1d4ead2afd'
            'SKIP'
            '5da61fcabd332698b3a8934670195d42f9d9db949fd666c3a670c47252af0376cf8cd0e3f2d78c9d6593446d68dab02b3db14b995a9fa8c973859cd2fd8bc3d0')
validpgpkeys=('6D2C117E0310664497AA9546F6C2EE9C23354344')

prepare() {
  cd "${pkgbase}-${pkgver}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "${pkgbase}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/share/games/doom

  # dedup all the *setup programs, make desktop file work
  rm "${pkgdir}"/usr/bin/chocolate-{heretic,hexen,strife}-setup
  mv "${pkgdir}"/usr/bin/chocolate-doom-setup "${pkgdir}"/usr/bin/chocolate-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-doom-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-heretic-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-hexen-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-strife-setup
}
