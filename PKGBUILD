# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_pkgname=flatpak-builder-tools
pkgname="${_pkgname}"
pkgver=2023.06.09
pkgrel=1
pkgdesc="Various helper tools for flatpak-builder"
arch=(any)
url="https://github.com/flatpak/${_pkgname}"
license=(MIT unknown)
depends=(
  'flatpak-builder'
  'python>=3.6'
  'python-toml'
  'python-aiohttp'
  'python-requirements-parser'
  'perl'
  'cpanminus'
  'perl-json-maybexs'
  'perl-lwp-protocol-https'
  'perl-capture-tiny'
  'ruby')
makedepends=()
_commit="f47d081458f7a3d9ada77c55447b6c203252dda9"
source=(
  # "${pkgname}::git+$url.git"
  "${url}/archive/${_commit}.zip"
)
sha512sums=("39b833e01e05ae2bc5159a4be83a263ebde5c0adbff33139ee4ab0d37bed4a647bc42a2417126bcde2ae8ba776972aae991db452a081b4c69612e9767536f62e")

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  
  # Prefix for tool script
  _bindir="${pkgdir}/usr/bin"
  # Prefix for docs dir
  _docdir="${pkgdir}/usr/share/doc/${pkgname}"
  
  # Install json2yaml
  install -Dm755 "flatpak-json2yaml.py" "${_bindir}/flatpak-json2yaml"
  install -Dm644 "readme.md" -t "$_docdir"
  
  # Find all tools
  for _toolname in $(find -type d -regex '^\.\/\w*$' | sed 's,\.\/,,'); do
    # Find and install scripts
    for _scriptname in $(find "$_toolname" -type f -regex "^$_toolname/flatpak.*" | sed "s,$_toolname/\\(.*\\),\1,"); do
      # Crop extension from scriptname
      _destname=$(echo "$_scriptname" | sed 's,\(\.py\|\.pl\|\.rb\),,')
      install -Dm755 "$_toolname/$_scriptname" "$_bindir/$_destname"
    done
  
    # Find all documentation files and install them
    for _docname in $(find "$_toolname" -type f -regex '.*\.md$'); do
      install -Dm644 "$_docname" -t "$_docdir/$_toolname"
    done
  done
}
