# Maintainer: yustin <#archlinux-proaudio@libera.chat>
# Contributor: Milk Brewster < milk on freenode >
# Contributer: Lukas Sabota <lukas _at_ lwsabota _dot_ com>

pkgname=sid-vst-git
_gitbase=SID
pkgver=r110.845782d
pkgrel=1
pkgdesc="Emulates MOS Technology SID audio chip (used in Commodore 64) as a VST"
arch=('i686' 'x86_64')
url="http://socalabs.com/"
license=('LGPL')
groups=('socalabs-vst-suite')
depends=('mesa' 'ttf-ms-fonts')
makedepends=('git')
source=('SID::git+https://github.com/FigBug/SID.git' )
md5sums=('SKIP' )

pkgver() {
  cd "$srcdir/$_gitbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitbase"
	sed "s/git@github.com:/https:\/\/github.com\//" -i .gitmodules
	git submodule init
	git submodule update
  cd "$srcdir/$_gitbase/ci"
	sed "/OS = \"linux\"/s/linux/lynix/" -i build.sh
}

build() {
  cd "$srcdir/$_gitbase/ci"
 	OS=linux ./build.sh
}

package() {
  install -D -m644 "$srcdir/$_gitbase/ci/bin/SID.vst3/Contents/x86_64-linux/$_gitbase.so" "$pkgdir/usr/lib/vst/$_gitbase.so"
	for file in $srcdir/$_gitbase/ci/bin/SID.lv2/*; do
	  install -D -m644 -t "$pkgdir/usr/lib/lv2/$_gitbase/" "$file"
	done
}
