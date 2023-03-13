# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: bgkillas (https://aur.archlinux.org/account/bgkillas)

_pkgname=revchatgpt
pkgname="${_pkgname}-git"
pkgver=3.3.4+8.r1265.20230313.6a7bfbf
pkgrel=1
pkgdesc="Lightweight package for interacting with ChatGPT's API by OpenAI. Uses reverse engineered official API."
arch=(
  'any'
)
url="https://github.com/acheong08/ChatGPT"
# url="https://github.com/ChatGPT-Hackers/revChatGPT"
license=('GPL2')
depends=(
  'python'
  'python-argparse'
  'python-httpx'
  'python-openaiauth'
  'python-requests'
  'python-tiktoken'
  'python-undetected-chromedriver'
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
  "python-revchatgpt=${pkgver}"
  "python-revchatgpt-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "chatgpt<=0.0.48"
  "python-revchatgpt"
)
replaces=(
  "chatgpt<=0.0.48"
  "chatgpt-git<=0.0.48"
)
install=revchatgpt.install
source=(
  "${_pkgname}::git+${url}.git"
  'revchatgpt-v1.sh'
  'revchatgpt-v2.sh'
  'revchatgpt-unofficial.sh'
  "${install}"
)
sha256sums=(
  'SKIP'
  '96f34a85defd78aaed8ee8af973cbca5336a6d8f7fbf4779f4f9f2f1a658f4b4'
  '794baec2fabe7471ef11c033e1cd7d9be917847c4c58d919566cac8eb4c65233'
  '50b167e806b9d1a22d1b9ba0dd3b6aa43eb18d0fe91665a6b6268eef9b64c3f6'
  'da09adf013656180dc033f0f9064c16b610ebbe720d9d86662388cf752d52898'
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

  install -D -v -m755 "${srcdir}/revchatgpt-v1.sh"          "${pkgdir}/usr/bin/revchatgpt-v1"
  install -D -v -m755 "${srcdir}/revchatgpt-v2.sh"          "${pkgdir}/usr/bin/revchatgpt-v2"
  install -D -v -m755 "${srcdir}/revchatgpt-unofficial.sh"  "${pkgdir}/usr/bin/revchatgpt-unofficial"
  ln -svr             "${pkgdir}/usr/bin/revchatgpt-v1"     "${pkgdir}/usr/bin/revchatgpt"

  install -D -v -m644 logo.png                      "${pkgdir}/usr/share/pixmaps/revchatgpt.png"

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in CONTRIBUTING.md README.md SECURITY.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -d -v -m755                               "${pkgdir}/usr/share/doc/${_pkgname}/wiki"
  cp -av wiki/*                                     "${pkgdir}/usr/share/doc/${_pkgname}/wiki"/
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
  ln -svf "/usr/share/pixmaps/revchatgpt.png"       "${pkgdir}/usr/share/doc/${_pkgname}/logo.png"
}
