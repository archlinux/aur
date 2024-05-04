# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: slithery0 (https://aur.archlinux.org/account/slithery0)

_pkgname=chatgpt-cli
pkgname="${_pkgname}-git"
pkgver=0.1.3+8.r41.20230204.1746661
pkgrel=3
pkgdesc="A very minimal cli prompt for ChatGPT."
arch=(
  'any'
)
url="https://github.com/slithery0/gpt-chatbot-cli"
license=('MIT')
depends=(
  'python'
  'python-openai'
  'python-termcolor'
  'python-prompt_toolkit'
  'python-aiohttp'
  'python-tinydb'
  'python-poetry'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
  "gpt-chatbot-cli=${pkgver}"
  "gpt-chatbot-cli-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "gpt-chatbot-cli"
)
replaces=()
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl

  ln -svr "${pkgdir}/usr/bin/gpt-chatbot-cli"       "${pkgdir}/usr/bin/chatgpt-cli"

  install -D -v -m644 LICENCE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -d -v -m755                               "${pkgdir}/usr/share/doc/${_pkgname}/wiki"
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
