# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pylatex"
pkgname="python-${_name}-git"
pkgver=1.2.2.r685.3642fd2
pkgrel=1
pkgdesc="A Python library for creating LaTeX files (git version)"
arch=("any")
url="https://jeltef.github.io/PyLaTeX/"
license=("MIT")
depends=("python")
makedepends=("git")
optdepends=("python-numpy" "python-matplotlib" "python-quantities")
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("${_name}::git+https://github.com/JelteF/PyLaTeX")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 3 | tr -d "v,)")
  _parent_major_ver=$(echo "${_parent_ver}" | cut -d "." -f 1)
  _parent_minor_ver=$(echo "${_parent_ver}" | cut -d "." -f 2)
  _parent_patch_ver=$(echo "${_parent_ver}" | cut -d "." -f 3)
  # Don't use the patch version of the parent tag.
  _git_patch_ver=$((_parent_patch_ver+1))
  printf "%s.%s.%s.r%s.%s" \
         "${_parent_major_ver}" \
         "${_parent_minor_ver}" \
         "${_git_patch_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
