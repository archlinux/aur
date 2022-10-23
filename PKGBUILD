# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-ink-extensions-git
_gitpkgname=ink_extensions
pkgver=r20.6a246a5
pkgrel=1
pkgdesc='Python dependencies for running Inkscape extensions outside of Inkscape'
arch=('any')
url='https://github.com/evil-mad/ink_extensions'
license=('GPL2')
depends=('python-lxml')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-mock')
provides=('python-ink-extensions')
conflicts=('python-ink-extensions')
options=('!strip')

source=(
  "${pkgname}::git+https://github.com/evil-mad/ink_extensions.git"
  'github-pr-8.patch'
  'github-pr-9.patch'
)

sha512sums=(
  'SKIP'
  'b1ce78e3e79631359f76476d67a515a2f7e68a08c78e36717a4a8c038fb8fd8adca7002611c26412f997cad66b96215af8587b8038644861ab872e61e3dc4089'
  '10dc10a5fc741332b35479af26bbd4867015df2580e0530e4ff77cfcc9a8ebb36e2b4c7b3cb123a22eab6cb1af49b34f2b8f9e908037786b9294c152eff447fe'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

prepare() {
  # https://github.com/evil-mad/ink_extensions/pull/8
  patch -p1 -d "${srcdir}/${pkgname}" < github-pr-8.patch
  # https://github.com/evil-mad/ink_extensions/pull/9
  patch -p1 -d "${srcdir}/${pkgname}" < github-pr-9.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  python -m unittest
}

package() {
  cd "${srcdir}/${pkgname}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}/LICENSE"
}
