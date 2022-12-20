# Maintainer: Index Dev Team <indexdevteam@gmail.com>

# shellcheck disable=SC2034
_pkg=archiso
_distro=dogelonindex
_pkgbase="${_distro}-website"
pkgname="${_pkgbase}-git"
pkgver=v0.1+150+g238a074
pkgrel=1
pkgdesc='Dogelon Index Website'
arch=('any')
license=('GPL3')
_url="ssh://git@127.0.0.1/home/git/dogelonindex-website"
url="https://no.www/tallero/${_pkgbase}"
_marker_tag="2020.04.04"
makedepends=('git'
	     'marker'
	     'pandoc'
             'python-fastjsonschema')
checkdepends=()
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
optdepends=("apache"
	    "lighttpd"
            "nginx")
source=("${_pkgbase}::git+${_url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}" || exit
  git describe --tags | sed 's/-/+/g'
}

# shellcheck disable=SC2154
build() {
  local _styles="/usr/share/com.github.fabiocolacio.marker/styles"
  cp -r "${_styles}" "${srcdir}"
}

# shellcheck disable=SC2154
package() {
  local _pages="${srcdir}/${_pkgbase}"
  local dest="${pkgdir}/srv/http"
  local _styles="${srcdir}/styles"
  local _tl_src="${_pages}/tokenlist.json"
  local _tl_schema="${_pages}/tokenlist.schema.json"
  local _dest name page
  install -dm750 "${dest}"
  chown -R 0:33 "${dest}"

  cd "${_pages}" || exit
  for page in "${_pages}"/*md; do
    name="${page%%.md}"
    pandoc -s --verbose \
	      --css="${_styles}/markdown.css" \
              --css="${_styles}/swiss.css" \
	      --self-contained \
              -f markdown \
              -t html \
              --output "${name}.html" \
              "${page}"
    _dest="${dest}"
    install -dm750 "${_dest}/resources"
    chown -R 0:33 "${_dest}"
    if [ "$(basename "${name}")" != "index" ]; then
      _dest="${dest}/$(basename "${name}")"
      install -dm750 "${_dest}"
      chown -R 0:33 "${_dest}"
      _dest="${_dest}/index.html"
    fi
    install -Dm 644 "${name}.html" "${_dest}"
    rm "${name}.html"
  done
  install -Dm 644 "${_pages}/sitemap.xml" "${dest}"
  jsonschema -i "${_tl_src}" "${_tl_schema}"
  install -Dm644 "${_tl_src}" "${dest}/resources"
}
