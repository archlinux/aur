# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>


pkgname='python-jira'
pkgdesc='Python library to work with Jira APIs'
pkgver='3.5.0'
pkgrel=1
url='https://github.com/pycontribs/jira'
license=('BSD')
arch=('any')
depends=('python-defusedxml'
         'python-keyring'
         'python-requests'
         'python-requests-oauthlib'
         'python-requests-toolbelt')
optdepends=("ipython")
makedepends=('python-setuptools' 
             'python-build' 
             'python-wheel'
             'python-setuptools-scm' 
             'python-installer')
source=("https://github.com/pycontribs/jira/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('44bf7384e00923b9df06e28c4b0bf200bfbb9203c61669373267bb4fe0a08509')

prepare() {
  cd "${srcdir}/jira-${pkgver}"
  sed -i \
    -e '/tool.setuptools_scm/d' \
    -e "/^build-backend/a [project]\nname=\"jira\"\nversion=\"${pkgver}\"" \
    pyproject.toml
}

build() {
  cd "${srcdir}/jira-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/jira-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/${site_packages}/tests"
}

