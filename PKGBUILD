# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase=chrome-pass
pkgbase="${_pkgbase}-git"
pkgname=(
  # "${_pkgbase}-git"
  "${_pkgbase}-hostapp-git"
  "${_pkgbase}-docfiles-git"
)
pkgver=0.3.0+5.r56.20230319.240e165
_mainver="$(sed -E 's|^([^\.]*\.[^\.]*\.[^.+_]*)[\.+_]?.*$|\1|' <<<"${pkgver}")"
_nextver="$(awk -F. '{print $1"."$2"."$3+1}' <<<"${_mainver}")"
pkgrel=1
pkgdesc="Interface programme for the chrome extension 'chrome-pass' for zx2c4's 'pass' password manager."
arch=(
  'any'
)
url="https://github.com/hsanson/chrome-pass"
license=("unknown")
depends=()
makedepends=(
  'git'
  'python>=3'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=(
  "${_pkgbase}::git+${url}.git"
  'chrome-pass-hostapp.install'
)
sha256sums=(
  'SKIP'
  '2d6c3d84a8db2ab15fa0cd17abdd258dbf93b17fe5f9ab8a8521bd077cad2701'
)

prepare() {
  cd "${srcdir}/${_pkgbase}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]+$||' | tr '-' '+')"
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


build() {
  cd "${srcdir}/${_pkgbase}/application"

  python -m build --wheel --no-isolation
}

# package_chrome-pass-git() {
#   pkgdesc="Chrome extension for zx2c4's 'pass' password manager."
#   depends=(
#     "chrome-pass-hostapp>=${_mainver}"
#     "chrome-pass-hostapp<${_nextver}"
#   )
#   optdepends=(
#     "chromium>=50: To make use of this extension. (Can also be any other chromium-based browser like google chrome or vivaldi)."
#     "chrome-pass-docfiles: The documentation files from the source repository of this software."
#   )
#   provides=(
#     "chrome-pass=${pkgver}"
#   )
#   conflicts=(
#     "chrome-pass"
#   )
# 
#   cd "${srcdir}/${_pkgbase}"
# }

package_chrome-pass-hostapp-git() {
  pkgdesc="Interface programme needed by the 'chrome-pass' chrome extension for zx2c4's 'pass' password manager."
  depends=(
    "pass"
    "pinentry"
    "python>=3"
    "python-gnupg"
  )
  optdepends=(
    "chrome-pass>=${_mainver}: The browser extension this hostapp is for (can be installed as Arch Linux package or by the user via chrome webstore)."
    "chrome-pass<${_nextver}"
    "chrome-pass-docfiles: The documentation files from the source repository of this software."
  )
  provides=(
    "chrome-pass-hostapp=${pkgver}"
  )
  conflicts=(
    "chrome-pass-hostapp"
  )
  install='chrome-pass-hostapp.install'

  cd "${srcdir}/${_pkgbase}/application"
  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_chrome-pass-docfiles-git() {
  pkgdesc="Documentation files for 'chrome-pass' and 'chrome-pass-hostapp'."
  depends=()
  optdepends=(
    "chrome-pass: The software this documentation is for."
    "chrome-pass-hostapp: The software this documentation is for."
  )
  provides=(
    "chrome-pass-docfiles=${pkgver}"
  )
  conflicts=(
    "chrome-pass-docfiles"
  )

  cd "${srcdir}/${_pkgbase}"
  for _docfile in CHANGELOG.adoc README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgbase}/${_docfile}"
  done
}
