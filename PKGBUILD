# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: bgkillas (https://aur.archlinux.org/account/bgkillas)

_pkgname=revchatgpt
pkgname="${_pkgname}-git"
pkgver=0.0.44+11.r525.20221223.efff7f5
pkgrel=1
pkgdesc="Lightweight package for interacting with ChatGPT's API by OpenAI. Uses reverse engineered official API."
arch=(
  'any'
)
url="https://github.com/acheong08/ChatGPT"
license=('GPL2')
depends=(
  'python'
  'python-cf_clearance2'
  'python-httpx'
  'python-nest-asyncio'
  'python-playwright'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  # 'python-setuptools'
  'python-wheel'
)
provides=(
  "${_pkgname}=${pkgver}"
  "chatgpt=${pkgver}"
  "chatgpt-git=${pkgver}"
  "python-revchatgpt=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "chatgpt"
  "python-revchatgpt"
)
replaces=(
  "chatgpt<=${pkgver}"
  "chatgpt-git<=${pkgver}"
)
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

  install -D -v -m644 logo.png                      "${pkgdir}/usr/share/pixmaps/revchatgpt.png"

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in CONTRIBUTING.md README.md SECURITY.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
  ln -svf "/usr/share/pixmaps/revchatgpt.png"       "${pkgdir}/usr/share/doc/${_pkgname}/logo.png"
}
