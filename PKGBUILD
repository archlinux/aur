# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=diaphora
pkgver=3.5.0
pkgrel=1
pkgdesc="Program diffing tool for IDA Pro"
arch=('any')
url="https://github.com/joxeankoret/diaphora"
license=('AGPL-3.0-or-later')
depends=()
optdepends=(
  'python-cdifflib: C implementation of the diff, replaces the slower stdlib fallback'
  'python-numpy: ML-assisted comparison'
  'python-pandas: ML-assisted comparison'
  'python-scikit-learn: ML-assisted comparison'
  'python-joblib: ML-assisted comparison'
  'python-nltk: "code cut" module-boundary guessing'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('015c1ef6bbd37152ad2ec406486fd16284a0d6a94ddeaeb4d42bf0231724c716')

# Nothing here runs without IDA Pro: it supplies the interpreter that imports these
# modules, and every optional import upstream is guarded by a working fallback
# (cdifflib -> difflib; scikit-learn, pandas, joblib -> ML_AVAILABLE = False).
# Hence empty depends and four ML optdepends.
#
# Expected namcap findings that must not be "fixed" with depends: IDA ships its own Qt
# bindings (PySide6 above SDK 920, PyQt5 below) and the ida_* modules; the pygments copy
# inside the plugin directory is vendored upstream and is what the plugin actually
# imports, so a system python-pygments would be shadowed; and pygments' PIL, chardet,
# docutils and sphinx imports live in the image formatter and Sphinx extension, which
# Diaphora never loads.

latestver() {
  curl -fsSL "https://api.github.com/repos/joxeankoret/diaphora/releases/latest" |
    sed -nE 's/.*"tag_name": *"v?([0-9]+(\.[0-9]+)*)".*/\1/p'
}

# IDA discovers a plugin package by the ida-plugin.json inside a subdirectory of a
# plugin directory, and the AUR ida-pro package installs IDA at /opt/ida-pro, so
# this is a system plugin path IDA already scans.
package() {
  local plugin_dir="${pkgdir}/opt/ida-pro/plugins/${pkgname}"

  install -d "${plugin_dir}"
  cp -r --no-preserve=ownership "${pkgname}-${pkgver}/." "${plugin_dir}/"
  # .github is CI config; tester/ is upstream's developer harness and carries two
  # prebuilt ELF fixtures, which an arch=('any') package cannot ship.
  rm -rf "${plugin_dir}/.github" "${plugin_dir}/tester"

  find "${plugin_dir}" -type d -exec chmod 755 {} +
  find "${plugin_dir}" -type f -exec chmod 644 {} +

  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
