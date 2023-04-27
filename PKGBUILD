# Maintainer: dreieck

_pkgname='audible-activator'
pkgname="${_pkgname}-git"
epoch=1
pkgver=0.2.r1.20210324.79e2cea
pkgrel=2
pkgdesc="A script to retrieve your activation data (activation_bytes) from Audible servers. Use it to play your aax or aax+ files downloaded from amazon audible. Needs chrome or chromium."
url='http://github.com/inAudible-NG/audible-activator'
arch=('any')
license=('GPL3')

# install="audible-activator.install"

backup=()

# groups=()

depends=(
  "python>=3.8"
  "python-requests"
  "python-selenium"
  "python-urllib3"
  "chromium>=83" # For chromedriver and 'chromedriver'-executable. You can also use "chrome" or any other chrome-based browser which provides a supported chromedriver.
)

makedepends=(
  'git'
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_source_base="https://github.com/inAudible-NG/${_pkgname}"

source=(
  "${_pkgname}::git+${_source_base}"
  "audible-activator.chromedriverpath.patch::http://ix.io/1TLM"
  "disable-chromedriver-headless-in-debug-mode::https://patch-diff.githubusercontent.com/raw/inAudible-NG/audible-activator/pull/53.patch"
  "fix-no-find_element_by_id-error.patch::https://patch-diff.githubusercontent.com/raw/inAudible-NG/audible-activator/pull/55.patch"
  "audible-activator.sh::http://ix.io/1TLN"
)

sha256sums=(
  "SKIP"
  "d8dbc2b220550d376d4124ff09ccd42aae14245d03f9253bf5da49e684ec85cf"
  "d673ed35f81218851948aafc3148f15d5fcc4955a9a1e59df0ba334e3f0c067e"
  "c30bed5d6e22c421508ba61ed0caa2bf4930d74b80c1147951ff627859d1c8c2"
  "81bbd637e83db4f49c2e5be5b88a220e1908fa757f0a8e499aee6ad13b40489b"
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -N -p1 --follow-symlinks -i "${srcdir}/audible-activator.chromedriverpath.patch"
  patch -N -p1 --follow-symlinks -i "${srcdir}/disable-chromedriver-headless-in-debug-mode"
  patch -N -p1 --follow-symlinks -i "${srcdir}/fix-no-find_element_by_id-error.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(./audible-activator.py --version | awk '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." >&2
    false
    return 1
  fi

  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine git commit count." >&2
    false
    return 1
  fi

  if [ -z "${_hash}" ]; then
    echo "$0: Error: Could not determine latest git commit hash." >&2
    false
    return 1
  fi

  if [ -z "${_date}" ]; then
    echo "$0: Error: Could not determine latest git commit date." >&2
    false
    return 1
  fi

  echo "${_ver}.r${_rev}.${_date}.${_hash}"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -v -m755 -d "${pkgdir}/opt/audible-activator"
  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -v -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"

  for _binfile in AAS-parser.py audible-activator.py common.py extract-activation-bytes.py; do
    install -v -m755 "${_binfile}" "${pkgdir}/opt/audible-activator/${_binfile}"
  done

  # for _regularfile in ; do
  #     install -v -m644 "${_regularfile}" "${pkgdir}/opt/audible-activator/${_regularfile}"
  # done

  install -v -m755 "${srcdir}/audible-activator.sh" "${pkgdir}/usr/bin/audible-activator"

  install -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
