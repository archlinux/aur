# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=aurora-themes
pkgver=3.18.20160326
pkgrel=2
pkgdesc="Easy On The Eyes GNOME Shell, GTK2, GTK3 and Cinnamon themes"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
optdepends=("gtk-engine-murrine: for GTK2 themes")
source=("version::version${url#http}"
        "http://gnome-look.org/CONTENT/content-files/${url##*=}-Dark-Aurora.tar.gz")
sha256sums=('6f34484abaf76f7175264de32610a92447408d63c06a91dfb6e5744023e8d831'
            'a27a1a16b6fb938d8315dd21519b4d8b5609746aee1c29c92f6ff2bb9ee5ad4d')

# The following is very convoluted script because of makepkg's DLAGENTS escaping logic.
# An agent is added for the protocol "version". It is treated like http, which is done by processing
# the input url %u with sed, replacing the protocol back to http. Everything downloaded is then not
# immediatley saved to the output file name %o, but first piped through sed, which finds the
# gnome-shell version string in the Dark Aurora page on GNOME-Look.org.
# This makes a file containing the version readily available to both pkgver and package so that they
# not both have to sed out the version from the webpage themselves.
DLAGENTS=("version::/usr/bin/bash -c $(
  printf '%s\n' "${DLAGENTS[@]}" | sed -n 's/http::\(.*\)/\1/p' \
    | sed 's/-[^ ] %o //' | sed 's/ /\\ /g' | sed 's/%u/$(echo\\ %u\\ |\\ sed\\ "s\/^version\/http\/")/'
)\ |\ grep\ -Po\ '(?<=GNOME\ )[[:digit:].]+(?=\ Theme)'\ >\ %o"
"${DLAGENTS[@]}")

pkgver() {
  tr '\n' '.' < version
  while read -rd $'\0'
  do
    if [[ "$REPLY" -gt "$max" ]]
    then
      max="$REPLY"
    fi
  done < <(find */ -type f -exec stat --printf="%Y\0" '{}' +)
  date -d "@$max" +%Y%m%d
}

package() {
  extend-optdepends
  install -d ${pkgdir}/usr/share/themes
  cp --no-preserve=mode -r ${srcdir}/*/ ${pkgdir}/usr/share/themes
} 

# Hidden in a subfunction not to show up in the .SRCINFO.
extend-optdepends() {
  optdepends+=("gnome-shell=$(cat version): for gnome-shell themes")
}
