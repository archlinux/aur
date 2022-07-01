# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Hannes Eichblatt <lists@hanneseichblatt.de>

pkgname='wifijammer-git'
_basename="${pkgname%-git}"
_last_non_tagged_release_ver=0.1  # 2016-12-19, added with setup.py
_last_non_tagged_release_commit=fabc4adfae3da001923c97e2e1e9c4104aaadf83
pkgver=0.1.r28.gd4fda28
pkgrel=1
pkgdesc='Continuously jam all wifi clients and access points within range.'
arch=('any')
_repo_maintainer='Theelx'
url="https://github.com/${_repo_maintainer}/${_basename}"
license=('BSD')
makedepends=(
  'git'
  'python-setuptools'
)
_repodir="${_basename}-${_repo_maintainer}"
source=("${_repodir}::git+${url}.git")
b2sums=('SKIP')

prepare() {
  cd "${_repodir}"

  echo "Fixing README.md: refer to Python 3 instead of Python 2.7"
  sed -e 's|[Pp]ython[ 	]*2\.7|Python 3|g' \
      -i 'README.md'

  echo "Changing hashbangs in *.py files to refer to 'python3'"
  sed -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python3|' \
      -i $(find . -name '*.py')
}

pkgver() {
  cd "${_repodir}"

  # Generate git tag based version if there is a git tag newer than the $_last_non_tagged_release_ver.
  # Count only proper (v)#.#* [#=number] tags if such exists.
  # If not, count the number of revisions (commits) since the $_last_non_tagged_release_commit.
  (
    set -o pipefail
    local _gitversion=$(git describe --long --tags --match 'v[0-9][0-9.][0-9.]*' \
      --contains "${_last_non_tagged_release_commit}" 2>/dev/null || \
      printf "%s.r%s.g%s" \
        "${_last_non_tagged_release_ver}" \
        $(git rev-list --count "${_last_non_tagged_release_commit}"..HEAD) \
        $(git rev-parse --short HEAD))

    # Format git-based version for pkgver
    echo "${_gitversion}" | \
      sed -e 's|^v||' | \
      tr '[:upper:]' '[:lower:]' | \
      sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
  )
}

build() {
  cd "${_repodir}"
  python setup.py build --executable='/usr/bin/env python3'
}

package() {
  depends+=(
    'python'
    'python-scapy'
  )
  provides=("${_basename}=${pkgver%.r*}")
  conflicts=("${_basename}")

  cd "${_repodir}"

  python setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  grep -A 100000 -e "^License$" 'README.md' > 'LICENSE.md'
  install --verbose -Dm 644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
