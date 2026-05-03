# Maintainer: Mike Pento <mjpento@gmail.com>

# IMPORTANT!!! Modify this list for your specific installation
_module_list=(
#  'alarm'		# fails to compile (implicit-funcion-declaration)
  'cpu'
  'desksanity'
  'diskio'               # not compatible with EFL >= 1.13
  'eenvader.fractal'
# 'elfe'                 # not compatible with Enlightenemnt >= 0.19.0
# 'empris'               # not compatible with Enlightenment >= 0.19.0, adds dep on e_dbus
  'everything-places' 
  'everything-websearch'
#  'eweather'		# libeweather(?), not compatible with E >= 0.18.0
  'forecasts'
# 'mail'                 # not compatible with Enlightenment >= 0.19.0
  'mem'
# 'moon'                 # not compatible with Enlightenment >= 0.19.0
# 'mpdule'               # not compatible with Enlightenment >= 0.19.99, adds dep on libmpd
  'net'
# 'news'                 # not compatible with Enlightenment >= 0.19.0
  'penguins'		 
# 'photo'                # not compatible with Enlightenment >= 0.18.0
# 'share'                # not compatible with Enlightenment >= 0.19.0, adds dep on libbsd
  'tclock'
# 'wallpaper2'           # not compatible with Enlightenment < 0.19.99
#  'wlan'		# fails to compile (implicit-function-declaration)
)

containsElement () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

pkgname=e-modules-extra-git
pkgver=20260502
pkgrel=1
pkgdesc="Enlightenment modules: Extra unsupported modules in Git not already packaged elsewhere"
arch=('i686' 'x86_64')
url="https://git.enlightenment.org/"
license=('GPL-1.0-or-later' 'MIT')
options+=('!debug')

depends=('enlightenment' 'efl' 'glibc')
  containsElement "mpdule" "${_module_list[@]}" && depends+=('libmpd')
  containsElement "share" "${_module_list[@]}" && depends+=('libbsd')
  containsElement "penguins" "${_module_list[@]}" && depends+=('meson' 'ninja')

makedepends=('git')
provides=("${pkgname%-*}")
for _module in ${_module_list[@]}; do
  source+=(
      "git+https://git.enlightenment.org/enlightenment/enlightenment-module-$_module.git"
      e_mod_main.patch
  )
  sha256sums+=(
      'SKIP'
      '08142da0466d91519f5fa80a6b055e923076e982d748c660251c24741c4579e7'
  )
done

pkgver() {
  date +%Y%m%d
}

prepare() {
  if containsElement "empris" "${_module_list[@]}"; then
    sed -i '/PKG_CHECK_MODULES(E,/ s/enlightenment/& edbus/' "$srcdir/empris/configure.ac"
    sed -i '1a #include <E_DBus.h>' "$srcdir/empris/src/e_mod_main.c"
  fi

  if containsElement "diskio" "${_module_list[@]}"; then
      cd ${srcdir}/enlightenment-module-diskio/src
      patch --verbose e_mod_main.c < ${srcdir}/e_mod_main.patch
  fi
}

build() {
  for _module in ${_module_list[@]}; do
    cd "$srcdir/enlightenment-module-$_module"

    msg2 "Building $_module"

    case $_module in
	penguins)
	    /usr/bin/meson setup build
	    ninja -C build
	    ;;
	forecasts)
	    /usr/bin/meson build
	    ninja -C build
	    ;;
	*)
	    ./autogen.sh \
		--prefix=/usr \
		--disable-static
	    make CFLAGS+=-std=gnu17
	    ;;
    esac

  done
}

package() {
  for _module in ${_module_list[@]}; do
    cd "$srcdir/enlightenment-module-$_module"

    msg2 "Installing $_module"

    case $_module in
	penguins)
	    # ninja -C build install
	    /usr/bin/meson install -C build --destdir "$pkgdir"
	    ;;
	forecasts)
	    # ninja -C build install
	    /usr/bin/meson install -C build --destdir "$pkgdir"
	    ;;
	*)
	    make DESTDIR="$pkgdir" install
	    ;;
    esac

#   install text files
    [[ -e ChangeLog ]] && install -Dm644 ChangeLog "$pkgdir/usr/share/doc/${pkgname%-*}/$_module/ChangeLog" || true
    [[ -e NEWS ]] && install -Dm644 NEWS "$pkgdir/usr/share/doc/${pkgname%-*}/$_module/NEWS" || true
    [[ -e README ]] && install -Dm644 README "$pkgdir/usr/share/doc/${pkgname%-*}/$_module/README" || true

#   install license files
    [[ -e AUTHORS ]] && install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/$_module/AUTHORS" || true
    [[ -e COPYING ]] && install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/$_module/COPYING" || true
    [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname/$_module/COPYING-PLAIN" || true
 done
}
