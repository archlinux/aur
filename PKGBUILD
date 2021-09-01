# Maintainer: dreieck

_pkgname=catch-my-bus-python
pkgname="${_pkgname}-git"
pkgver=r105.20170419.e458b52
pkgrel=2
pkgdesc="A GTK3 status icon for real time public transport departures from a selected stop in Dresden (Verkehrsverbund Oberelbe/ VVO)."
arch=(
  "any"
)
url="https://github.com/meepoSenpai/catch-my-bus-python"
license=('custom: unspecified')
depends=(
  'python>=3'
  'python-gobject'
  'python-notify2'
)
makedepends=(
  'git'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
install="${_pkgname}.install"
source=(
  "${_pkgname}::git+git://github.com/meepoSenpai/catch-my-bus-python.git"
  "catch-my-bus-vvo.sh"
  "${install}"
  "license-dummy.txt"
)
sha256sums=(
  'SKIP'
  'b04ffdf8eeae08d6582c6a1dd8102148cfb147c32c6bcb16ba832cd446164388'
  'b4264e6c0d079a1b4bcafd0372d84529652dbe3097423b616832d927b8bc9b63'
  '4b5dc58a16f4388301ca913765db1a98f3697d5923c81923cfe0971f8e386338'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  printf '%s' "r${_rev}.${_date}.${_hash}"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d -v -m755 "${pkgdir}/opt/catch-my-bus-python"
  install -d -v -m755 "${pkgdir}/opt/catch-my-bus-python/assets"
  install -d -v -m755 "${pkgdir}/opt/catch-my-bus-python/ui"
  install -v -m755 -t "${pkgdir}/opt/catch-my-bus-python"         src/catch_my_bus.py
  install -v -m644 -t "${pkgdir}/opt/catch-my-bus-python"         src/{departure.py,fetch_station.py,notification_time_list.py,stop_menu.py}
  install -v -m644 -t "${pkgdir}/opt/catch-my-bus-python/assets"  src/assets/{standard_config,stop_list,bus_stop_icon.png,stop.png}
  install -v -m644 -t "${pkgdir}/opt/catch-my-bus-python/ui"      src/ui/{departure_item.py,gtk_icon.py,gtk_popup.py}

  install -D -v -m755 "${srcdir}/catch-my-bus-vvo.sh" "${pkgdir}/usr/bin/catch-my-bus-vvo"

  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-dummy"
}
