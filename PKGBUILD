# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="python-bertini_real"
_pkgname="${_name}-docs"
pkgname="${_pkgname}-git"
pkgver=1.7.1.r113.58a8faa
_commit="bdd3757964b8b6d03615a0d7ca045886dbe962e8"
pkgrel=1
pkgdesc="HTML documentation for python-bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/bertini_real"
license=('custom:Bertini license')
makedepends=('git' 'python-bertini_real' 'python-sphinx')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="bertini_real"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/python/bertini_real"
  local version=$(sed -n "s/^__version_info__ = (\(.*\))/\1/p" "__about__.py" | sed "s/, /./g")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

build() {
  cd "${srcdir}/${_pkgsrc}/python/docs"
  make html   
}

package() {
  cd "${srcdir}/${_pkgsrc}/python/example"
  install -d "${pkgdir}/usr/share/doc/${_name}/examples"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/examples" \;
  
  cd "${srcdir}/${_pkgsrc}/python/docs/_build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/{}" \;
}
