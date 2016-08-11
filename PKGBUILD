# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=aurora-themes
pkgver=3.20.20160705
pkgrel=1
pkgdesc="Easy On The Eyes GNOME Shell, GTK2, GTK3 and Cinnamon themes"
arch=('any')
url="https://www.opendesktop.org/p/1143475/"
license=('GPL3')
optdepends=("gtk-engine-murrine: for GTK2 themes")
source=("version::version${url#https}"
        "https://dl.opendesktop.org/api/files/download/id/1468995652/Dark-Aurora.tar.gz")
sha256sums=('f5bbb7ea941d120d03237a28d07411aafc23e866b184083e37e02eda65aa3072'
            '6fbdaaae2e59b5f514ca003ba2552fcb7eb5724bd278e291ed5ae2036563d6ff')

# The following is a very convoluted script because of makepkg's DLAGENTS escaping logic.
# An agent is added for the protocol "version". It is treated like http, which is done by processing
# the input url %u with sed, replacing the protocol back to http. Everything downloaded is then not
# immediatley saved to the output file name %o, but first piped through sed, which finds the
# gnome-shell version string in the Dark Aurora page on GNOME-Look.org.
# This makes a file containing the version readily available to both pkgver and package so that they
# not both have to sed out the version from the webpage themselves.
DLAGENTS=("version::/usr/bin/bash -c $(
  printf '%s\n' "${DLAGENTS[@]}" | sed -n 's/http::\(.*\)/\1/p' \
    | sed 's/-[^ ] %o //' | sed 's/ /\\ /g' | sed 's/%u/$(echo\\ %u\\ |\\ sed\\ "s\/^version\/http\/")/'
)\ |\ xmllint\ --html\ --xpath\ 'normalize-space(//span[@class=\"value\"][1]/text())'\ -\ 2>/dev/null\ >\ %o"
"${DLAGENTS[@]}")

pkgver() {
  cat version
  while read -rd $'\0'
  do
    if [[ "$REPLY" -gt "$max" ]]
    then
      max="$REPLY"
    fi
  done < <(find */ -type f -exec stat --printf="%Y\0" '{}' +)
  date -d "@$max" +.%Y%m%d
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
