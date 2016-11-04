# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=aurora-themes
pkgver=20161121091307
pkgrel=1
pkgdesc='Easy On The Eyes GNOME Shell, GTK2, GTK3 and Cinnamon themes'
arch=('any')
url='https://www.opendesktop.org/p/1143475'
license=('GPL3')
makedepends=('jq')
optdepends=('gtk-engine-murrine: for GTK2 themes')
source=("meta::meta://dl.opendesktop.org/api/files/index?format=json&status=active&collection_content_id=${url##*/}")
sha256sums=('ad8124bba7333a255191c6d2ea322e9bf8b67215a6b2b757a5db1c0c877274a7')

# The following is a very convoluted script because of makepkg's DLAGENTS escaping logic.
# An agent is added for the protocol "meta". It is treated like http, which is done by processing
# the input url %u with sed, replacing the protocol back to http. Everything downloaded is then not
# immediatley saved to the output file name %o, but first piped through jq, which simplifies the
# JSON metadata received from the Dark Aurora page on GNOME-Look.org. This makes it more accessible
# for the following functions which then do not need to repeat the prefix again and again.
DLAGENTS=("meta::/usr/bin/bash -c $(
  printf '%s\n' "${DLAGENTS[@]}" | sed -n 's/http::\(.*\)/\1/p' \
    | sed 's/-[^ ] %o //' | sed 's/ /\\ /g' | sed 's/%u/$(echo\\ \"%u\"\\ |\\ sed\\ "s\/^meta\/http\/")/'
)\ |\ jq\ -j\ '.files.\"0\"'\ |\ sed\ '/downloaded/d'\ >\ %o"
"${DLAGENTS[@]}")

meta() {
  jq -j ".$1" meta
}

prepare() {
  source=("https://dl.opendesktop.org/api/files/download/id/$(meta id)/Dark-Aurora.tar.xz")
  sha256sums=('3259a8be44493ab5f3b2b455b6dae7725e0646b160c2b9a83968bf81feb3eaaa')
  download_sources
  check_source_integrity
  extract_sources
}

pkgver() {
  date -d "$(meta updated_timestamp)" '+%Y%m%d%H%M%S'
}

package() {
  extend-optdepends
  install -d ${pkgdir}/usr/share/themes
  cp --no-preserve=mode -r ${srcdir}/*/ ${pkgdir}/usr/share/themes
} 

# Hidden in a subfunction not to show up in the .SRCINFO.
extend-optdepends() {
  readarray -t < <(meta version | sed 's/[^[:digit:].]\+/\n/g' | sort -n)
  optdepends+=("gnome-shell>=${MAPFILE[0]}: for gnome-shell themes")
  optdepends+=("gnome-shell<${MAPFILE[-1]%.*}.$((${MAPFILE[-1]#*.} + 1)): for gnome-shell themes")
}
