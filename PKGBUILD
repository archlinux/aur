# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Co-Maintainer: Martin Rys <rys.pw/contact>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>


pkgname='python-jira'
pkgdesc='Python library to work with Jira APIs'
pkgver='3.5.2'
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
sha256sums=('ddc35267a33f42ebfbbd344f5b7078d96cb54186c0ec906de9dc750eb441b6a1')

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
