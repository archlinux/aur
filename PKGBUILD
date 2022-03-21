# Maintainer: dreieck

_pkgorigname=carto
_pkgname="${_pkgorigname}"
pkgname="nodejs-${_pkgname}-git"
pkgdesc="Mapbox carto: Translates Carto MML/ CartoCSS to Mapnik XML or a JSON variant of Mapnik XML."
pkgver=1.2.0+28+r1971.20201014.3051072
pkgrel=3
arch=('any')
license=('apache')
url="https://vis4.net/chromajs/"
depends=(
  'mapnik'
  'nodejs'
)
makedepends=(
  'git'
  'npm'
  'python-sphinx' # For making documentation.
  'python-sphinx_rtd_theme' # For making documentation.
  'texinfo' # For making documentation.
  'texlive-bin' # For making documentation.
  'texlive-latexextra' # For making documentation.
)
provides=(
  "${_pkgname}=${pkgver}"
  "nodejs-${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  # "${_pkgname}-doc=${pkgver}"
  # "nodejs-${_pkgname}-doc=${pkgver}"
  # "${_pkgname}-git-doc=${pkgver}"
  # "nodejs-${_pkgname}-git-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "nodejs-${_pkgname}"
  "${_pkgname}-git"
  # "${_pkgname}-doc"
  # "nodejs-${_pkgname}-doc"
  # "${_pkgname}-git-doc"
  # "nodejs-${_pkgname}-git-doc"
)
options=('!strip') # Do not attempt to strip, since there is no ELF binary anyway, so strip will just take needless time.
source=(
  "${_pkgorigname}::git+https://github.com/mapbox/${_pkgorigname}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgorigname}"

  _ver="$(git describe --tags | sed -E 's|\-g[0-9a-fA-F]*$||' | sed 's|^v||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgorigname}"
  msg2 "Downloading node-dependencies by running 'npm install' into a temporary directory ..."
  _carto_tmp="$(mktemp -d "${srcdir}/tmp_XXXX")"
  npm install -g --prefix "${_carto_tmp}" --cache "${srcdir}/.npm-cache" --production --no-optional
  rm -Rf "${_carto_tmp}"
}

build() {
  cd "${srcdir}/${_pkgorigname}/docs"

  msg2 "Building documentation ..."
  msg2 "· make man:";      make man
  msg2 "· make info:";     make info
  msg2 "· make text:";     make text
  # msg2 "· make dirhtml:";  make dirhtml
  msg2 "· make latexpdf:"; make latexpdf

  msg2 "compressing pdf, manpage and info file ..."
  rm -f "_build/man/carto.1.gz";        gzip -v -9 "_build/man/carto.1"
  rm -f "_build/texinfo/carto.info.gz"; gzip -v -9 "_build/texinfo/carto.info"
  rm -f "_build/latex/carto.pdf.xz";    xz   -v -9 "_build/latex/carto.pdf"
}

package() {
  cd "${srcdir}/${_pkgorigname}"

  msg2 "Running 'npm pack', and 'npm install' on the result ..."
  npm install --user root -g --prefix "$pkgdir"/usr --cache "${srcdir}/.npm-cache" --production --no-optional "$(npm pack -g --prefix "$pkgdir"/usr --cache "${srcdir}/.npm-cache" --production --no-optional | tail -n 1)"

  msg2 "Remving unneeded files from '/usr/lib/node_modules/carto/' ..."
  rm -rf "${pkgdir}/usr/lib/node_modules/carto"/{docs,man,carto-*.tgz}
  rm -rf "${pkgdir}/usr/share/man/man1/carto.1"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See http://github.com/npm/npm/issues/9359 for details.
  msg2 "Fixing permissions of directories due to a possible race condition in 'npm' ..."
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  for _docfile in CHANGELOG.md CONTRIBUTING.md README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "docs/_build/man/carto.1.gz" "${pkgdir}/usr/share/man/man1/carto.1.gz"
  install -D -v -m644 "docs/_build/texinfo/carto.info.gz" "${pkgdir}/usr/share/info/carto.info.gz"
  printf "%s\n" "Copying 'docs/_build/text' -> '${pkgdir}/usr/share/doc/${_pkgname}/text' ..."; cp -r "docs/_build/text" "${pkgdir}/usr/share/doc/${_pkgname}/text"; chmod -R a+Xr "${pkgdir}/usr/share/doc/${_pkgname}/text"
  # printf "%s\n" "Copying 'docs/_build/dirhtml' -> '${pkgdir}/usr/share/doc/${_pkgname}/html' ..."; cp -r "docs/_build/dirhtml" "${pkgdir}/usr/share/doc/${_pkgname}/html"
  install -D -v -m644 "docs/_build/latex/carto.pdf.xz" "${pkgdir}/usr/share/doc/${_pkgname}/carto.pdf.xz"
  install -d -v -m755 "${pkgdir}/usr/share/doc/${_pkgname}/html"; printf '%s\n' 'http://cartocss.readthedocs.io/en/latest/' > "${pkgdir}/usr/share/doc/${_pkgname}/html/html_doc.url"

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  msg2 "Fixing ownership ..."
  chown -R root:root "${pkgdir}"/*
}
