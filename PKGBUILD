# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Herr_Irrtum

pkgname=huexpress-git
_pkgname=huexpress
pkgver=r199.b91fd8e
pkgrel=1
pkgdesc="A PCEngine emulator forked from Hu-Go!"
url="https://github.com/kallisti5/huexpress"
depends=('libzip' 'glu' 'sdl2_mixer')
makedepends=('git' 'gendesk' 'scons')
conflicts=(huexpress)
license=('GPL')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/kallisti5/huexpress.git')
md5sums=('SKIP')

prepare() {
  cd ${srcdir}/${pkgname}
  # scons ignores the environment: pass makepkg's flags; old C (disass_menu() called with an
  # argument) does not compile as C23, the GCC 15 default; its opcode table mixes function
  # types; globals are defined in several files (-fcommon)
  sed -i "s|^env.Append(CFLAGS = \['-g'\])|env.Append(CFLAGS = ['-g', '-std=gnu17', '-fcommon', '-Wno-error=incompatible-pointer-types'] + os.environ.get('CFLAGS', '').split())\\nenv.Append(CPPFLAGS = os.environ.get('CPPFLAGS', '').split())\\nenv.Append(LINKFLAGS = os.environ.get('LDFLAGS', '').split())|" SConstruct
  # the log message must not be used as a format string (-Werror=format-security)
  sed -i 's|fprintf (log_file, buf);|fputs (buf, log_file);|' src/utils.c
  # SDL2: SDL_JoystickName() takes the joystick, not its index
  sed -i 's|SDL_JoystickName (n)|SDL_JoystickNameForIndex (n)|' src/osd_keyboard.c
}

build() {
  cd ${srcdir}/${pkgname}
  scons
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm755 "${srcdir}/${pkgname}/src/huexpress" "$pkgdir/usr/bin/huexpress"
}

# vim:set ts=2 sw=2 et:
