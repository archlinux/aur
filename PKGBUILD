pkgbase=capstone-git
pkgname=(capstone-git python-capstone-git)
pkgver=20250730.5302.ccbc41d3d
pkgrel=1
pkgdesc="A lightweight multi-platform, multi-architecture disassembly framework."
arch=('i686' 'x86_64')
url="http://www.capstone-engine.org/"
license=(BSD-3-Clause)
makedepends=(
  'glibc'
  'python'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'git')
# if you want the bindings uncomment the appropriae line below, and
# comment out the line above
#makedepends=('git' 'python')

source=("${pkgname}::git+https://github.com/capstone-engine/capstone.git#branch=next")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(git rev-list --count makepkg).$(git rev-parse --short makepkg)"
  #git log -1 --date=short --format="%cd.%h" | tr -d -
}



build() {
  cd "${srcdir}/${pkgname}"
  CFLAGS+=" ${CPPFLAGS} -ffat-lto-objects"
  make V=1

  cd bindings/python
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  #make check
}

package_capstone-git() {
  depends=(glibc)
  provides=(capstone libcapstone.so)
  conflicts=(capstone)
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 docs/README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSES/LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-capstone-git() {
  depends=(
    capstone-git
    python
  )
  conflicts=(python-capstone)
  provides=(python-capstone)

  cd "${srcdir}/${pkgbase}/bindings/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
