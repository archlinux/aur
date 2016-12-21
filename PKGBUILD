# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>

pkgname=doomrl-git
pkgver=r8.0cbac80
doomrl_assets='doomrl-linux-assets-x64-0997'
pkgrel=6
pkgdesc="Doom: The Rogue-like (git-latest) (WIP!)."
arch=(any)
url="http://drl.chaosforge.org/"
license=('GPL3')
depends=('sdl_mixer' 'zlib' 'lua' 'timidity++' 'sdl_image')
makedepends=('git' 'fpc-svn' 'lua')
source=("$pkgname::git+https://github.com/ChaosForge/doomrl"
	"fpcvalkyrie::git+https://github.com/ChaosForge/fpcvalkyrie"
	"http://www.libregeek.org/Linux/game-files/doomrl/${doomrl_assets}.tar"
	'disable-asmcse-opt.patch'
	'disable-offending-shell-code.patch'
	'hard-code-svn-revision.patch'
	)
sha256sums=('SKIP'
	    'SKIP'
	    '590c28b4e7f655e23c01bca0b2f9ddf9b8dd024f3a8b7ac5ec65d79877a6450b'
	    '1844d4698da23f31276f71e2fdd369959b41eac0b69677a147bd534b9c32b5ce'
	    '439de08ce548b0dc7ff6ba31ace7f375a1e6f0ebac32addf8a05d3d31283e192'
	    'e57148577e3152c99a61adb7ae841272491b7be62b168b8d62ee73b322b37418'
	    )

prepare()
{

  # clean
  find "$srcdir/$pkgname" "$srcdir/fpcvalkyrie" \
  '(' -iname '*.o' -or -iname '*.ppu' ')' -exec rm -f '{}' ';'

  # assets
  cp -ru "$srcdir/$doomrl_assets/mp3"/* "$srcdir/$pkgname/bin/mp3"
  cp -ru "$srcdir/$doomrl_assets/wavhq"/* "$srcdir/$pkgname/bin/wavhq" 

  # patch
  cd "${srcdir}"
  patch -p1 < disable-asmcse-opt.patch
  patch -p1 < disable-offending-shell-code.patch
  patch -p1 < hard-code-svn-revision.patch

}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{

  cd $srcdir/$pkgname
  rm -rf tmp && mkdir tmp

  # add Linux config
  echo "OS=\"LINUX\"" > "$srcdir/$pkgname/config.lua"
  echo "VALKYRIE_ROOT=\"$srcdir/fpcvalkyrie/\"" >> "$srcdir/$pkgname/config.lua"
  lua makefile.lua hq


}

package() {

	msg2 "Installing configuration files..."
	# TODO

}
