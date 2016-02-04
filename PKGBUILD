pkgname=moksha-modules-extra-git
pkgver=9ab20a0
pkgrel=1
_pkgname=moksha-modules-extra
pkgdesc="Extra Moksha modules"
arch=('i686' 'x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha' 'moksha-module-emprint-git')
conflicts=('moksha-module-cpu-git' 'moksha-module-deskshow-git' 'moksha-module-diskio-git' 'moksha-module-mem-git' 'moksha-module-net-git')
_module_list=(
  'alarm'
  'calendar'
  'cpu'
  'deskshow'
  'diskio'
  'engage'
  'flame'
  'forecasts'
  'mail'
  'mem'
  'net'
  'penguins'
  'photo'
  'places'
  'rain'
  'screenshot'
  'snow'
  'tclock'
  'trash'
  'winlist-ng'
  'winselector'
)
source=("$_pkgname::git+https://github.com/JeffHoogland/moksha-modules-extra.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  for _module in ${_module_list[@]}; do
    cd "${srcdir}/${_pkgname}/${_module}"
    msg2 "Building $_module"
    ./autogen.sh \
      --prefix=/usr
    make
  done
}

package() {
  for _module in ${_module_list[@]}; do
    cd "${srcdir}/${_pkgname}/${_module}"
    msg2 "Installing $_module"
    make DESTDIR="${pkgdir}" install

#   install text files
    [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/$_module/ChangeLog" || true
    [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/$_module/NEWS" || true
    [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/$_module/README" || true

#   install license files
    [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/$_module/AUTHORS" || true
    [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/$_module/COPYING" || true
    [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/$_module/COPYING-PLAIN" || true
  done
}
