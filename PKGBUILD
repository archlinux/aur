# Maintainer: Will Foran <will.foran+aur@gmail.com>
pkgname=paintown-git
pkgver=r7291.ec5824f2
pkgrel=2
pkgdesc="side scrolling fighting game (w/mugen)"
arch=('x86_64')
url="http://paintown.org"
license=('BSD')
groups=()
depends=('freetype2' 'allegro')
makedepends=('git' 'scons' 'r-tech1-git' 'python2-scons')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("paintown::git+https://github.com/kazzmir/paintown.git")
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
   # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


build() {
	cd "$srcdir/${pkgname%-git}"
   # include freetype2
   sed -i -e "s:scons.utils.safeParseConfig(staticEnv, 'freetype-config --libs'):env.Append(CPPPATH = ['/usr/include/freetype2']):" SConstruct
   python2 $(which scons)
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
   mkdir -p $pkgdir/usr/{bin,share/games/paintown}
   cd $pkgdir/usr/share/games/paintown
   cp "$srcdir/${pkgname%-git}/paintown" paintown-bin
   git clone https://github.com/kazzmir/paintown-data.git data
   echo "#!/usr/bin/env sh\ncd /usr/share/games/paintown; ./paintown" >> $pkgdir/usr/bin/paintown
   chmod +x paintown-bin $pkgdir/usr/bin/paintown
}
