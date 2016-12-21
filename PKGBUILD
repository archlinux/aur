# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>

pkgname=doomrl-git
pkgver=r8.0cbac80
doomrl_assets='doomrl-linux-assets-x64-0997'
pkgrel=10
pkgdesc="Doom: The Rogue-like (git-latest) (WIP!)."
arch=(any)
url="http://drl.chaosforge.org/"
license=('GPL3')
depends=('sdl_mixer' 'zlib' 'lua51' 'timidity++' 'sdl_image')
makedepends=('git' 'fpc-svn' 'lua')
source=("${pkgname}::git+https://github.com/ChaosForge/doomrl"
	"fpcvalkyrie::git+https://github.com/ChaosForge/fpcvalkyrie"
	"http://www.libregeek.org/Linux/game-files/doomrl/${doomrl_assets}.tar"
	'disable-asmcse-opt.patch'
	'disable-offending-shell-code.patch'
	'hard-code-svn-revision.patch'
	'fix-lua-dynamic-linking.patch'
	'doomrl-launch'
	)
sha256sums=('SKIP'
	    'SKIP'
	    '590c28b4e7f655e23c01bca0b2f9ddf9b8dd024f3a8b7ac5ec65d79877a6450b'
	    '1844d4698da23f31276f71e2fdd369959b41eac0b69677a147bd534b9c32b5ce'
	    '439de08ce548b0dc7ff6ba31ace7f375a1e6f0ebac32addf8a05d3d31283e192'
	    'e57148577e3152c99a61adb7ae841272491b7be62b168b8d62ee73b322b37418'
	    '8b7be4a787422722da65b3c184178f221d5ec76e60f11fda371aa27c9808ea9d'
	    '1bd87b0e8707ed7c41ad4f3b409515e5ac66aa9f14127cef584a68c7644615bc'
	    )

prepare()
{

  msg2 "Cleaning files"

  # clean
  find "${srcdir}/${pkgname}" "${srcdir}/fpcvalkyrie" \
  '(' -iname '*.o' -or -iname '*.ppu' ')' -exec rm -f '{}' ';'

  # assets
  cp -ru "${srcdir}/$doomrl_assets/mp3"/* "${srcdir}/${pkgname}/bin/mp3"
  cp -ru "${srcdir}/$doomrl_assets/wavhq"/* "${srcdir}/${pkgname}/bin/wavhq" 

  # symlinks
  rm -f "${srcdir}/${pkgname}/bin/lua5.1.so"

  msg2 "Patching"

  # patch
  cd "${srcdir}"
  patch -p1 < disable-asmcse-opt.patch
  patch -p1 < disable-offending-shell-code.patch
  patch -p1 < hard-code-svn-revision.patch
  patch -p1 < fix-lua-dynamic-linking.patch

}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{

  cd ${srcdir}/${pkgname}
  rm -rf tmp && mkdir tmp

  # add Linux config
  msg2 "Compiling doomrl"
  echo "OS=\"LINUX\"" > "${srcdir}/${pkgname}/config.lua"
  echo "VALKYRIE_ROOT=\"${srcdir}/fpcvalkyrie/\"" >> "${srcdir}/${pkgname}/config.lua"
  
  # lua makefile can be called to do the build 
  # but it seems to miss building makewad
  # use lazbuild instead
  # lua makefile.lua hq

  lazbuild "src/makewad.lpi"
  lazbuild "src/doomrl.lpi"

  # Generate wad
  msg2 "Generating wad file(s)"
  cd "${srcdir}/${pkgname}/bin"

  # makewad doesn't properly search for the lua lib, include our lib path
  # link and provide the path
  ln -s "/usr/lib/liblua5.1.so" "lua5.1.so"
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:. ./makewad

}

package() {

  msg2 "Installing doomrl files"

  # check for doomrl and wads
  # Even if compile fails, it often will just continue on
  # Doesn't seem to exit fully

  file_check="doomrl core.wad doomrl.wad"

  for file in ${file_check};
  do

	if [[ ! -f "${srcdir}/${pkgname}/bin/${file}" ]]; then

		echo "ERROR: Cannot find core file ${file}. Exiting build."
		exit 1

	fi

  done

  cd "${srcdir}/${pkgname}"

  #####################
  # Directories
  #####################

  install -d "$pkgdir/usr/share/games/doomrl"
  # Modules should not include original source content, just readme
  install -d "$pkgdir/usr/share/games/doomrl/modules"

  DIRS="backup mp3 wavhq screenshot backup mortem"

  for dir in $DIRS;
  do
	cp -dr "bin/${dir}" "$pkgdir/usr/share/games/doomrl/${dir}"

  done

  #####################
  # bin/share files
  #####################

  # Shouldn't need the extra scripts, but include them anyway

  FILES="core.wad
	 doomrl.wad 
	 doomrl 
	 manual.txt 
	 version.txt
	 version_api.txt
	 unix_notes.txt
	 config.lua
	 colors.lua
	 keybindings.lua 
	 sound.lua
	 manual.txt
	 music.lua
	 musichq.lua
	 doomrl_gnome-terminal
	 doomrl_konsole
	 doomrl_xterm
	 modules/!readme.txt"

  for file in $FILES;
  do

	install -m755 "bin/${file}" "$pkgdir/usr/share/games/doomrl/$(basename ${file})"	

  done

  # launcher
  install -Dm755 "$startdir/doomrl-launch" "$pkgdir/usr/bin/doomrl"

  msg2 "Fixing permissions"
  
  # doomrl must have write access to several files
  # Use a workaround, makeing the group owner games and
  # only modifying files we need to
  chown -R root:games "$pkgdir/usr/share/games/doomrl"
  chmod -R g+w "$pkgdir/usr/share/games/doomrl"

  #############
  # libs
  #############

  msg "Fixing up libs"

  # doomrl expects the lib to be "lua5.1.so", not our liblua5.1.so
  # Need to use a hack (until otherwise fixed) to trick doomrl to find it
  # copy in the existing symlink in the $srcdir/$pkgname/bin dir, preserving
  # the symlink path

  cp -P "bin/lua5.1.so" "$pkgdir/usr/share/games/doomrl"

}
