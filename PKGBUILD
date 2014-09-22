# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Cravix < dr dot neemous at gmail dot org >
# Contributor: Ronald van Haren <ronald.archlinux.org>

# IMPORTANT!!! Modify this list for your specific installation
_module_list=(
  'alarm'
  'cpu'
  'diskio'
  'eenvader.fractal'
# 'elev8'                # adds dep on v8, not compatible with v8 >= 3.19.16
# 'elfe'                 # not compatible with Enlightenemnt >= 0.19.0
# 'empris'               # not compatible with Enlightenment >= 0.19.0, adds dep on e_dbus
  'everything-places'
  'everything-websearch' # adds dep on e_dbus
  'forecasts'
# 'mail'                 # not compatible with Enlightenment >= 0.19.0
  'mem'
# 'moon'                 # not compatible with Enlightenment >= 0.19.0
  'mpdule'               # adds dep on libmpd
  'net'
# 'news'                 # not compatible with Enlightenment >= 0.19.0
  'penguins'
# 'photo'                # not compatible with Enlightenment >= 0.18.0
# 'share'                # not compatible with Enlightenment >= 0.19.0, adds dep on libbsd
  'tclock'
  'wallpaper2'
  'wlan'
)

containsElement () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

pkgname=e-modules-extra-git
pkgver=20140921
pkgrel=1
pkgdesc="Enlightenment modules: Extra unsupported modules in Git not already packaged elsewhere"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL' 'MIT')
depends=('enlightenment')
  containsElement "elev8" "${_module_list[@]}" && depends+=('v8<3.19.16')
  containsElement "empris" "${_module_list[@]}" && depends+=('e_dbus')
  containsElement "everything-websearch" "${_module_list[@]}" && depends+=('e_dbus')
  containsElement "mpdule" "${_module_list[@]}" && depends+=('libmpd')
  containsElement "share" "${_module_list[@]}" && depends+=('libbsd')
makedepends=('git')
provides=("${pkgname%-*}")
for _module in ${_module_list[@]}; do
  source+=("git://git.enlightenment.org/enlightenment/modules/$_module.git")
  sha256sums+=('SKIP')
done

pkgver() {
  date +%Y%m%d
}

prepare() {
  if containsElement "empris" "${_module_list[@]}"; then
    sed -i '/PKG_CHECK_MODULES(E,/ s/enlightenment/& edbus/' "$srcdir/empris/configure.ac"
    sed -i '1a #include <E_DBus.h>' "$srcdir/empris/src/e_mod_main.c"
  fi
}

build() {
  for _module in ${_module_list[@]}; do
    cd "$srcdir/$_module"

    msg2 "Building $_module"

    ./autogen.sh \
      --prefix=/usr \
      --disable-static

    make
  done
}

package() {
  for _module in ${_module_list[@]}; do
    cd "$srcdir/$_module"

    msg2 "Installing $_module"

    make DESTDIR="$pkgdir" install

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
