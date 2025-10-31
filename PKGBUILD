# Contributor: Ivan Zenin <i.zenin@gmx.com>

pkgname=linkchecker-git
pkgver=v10.6.0.r38.gc9b07de2
pkgrel=1
pkgdesc="Check websites for broken links (development version)"
arch=('i686' 'x86_64')
url="https://linkchecker.github.io/linkchecker"
license=("GPL")
depends=("python>=3.5" "python-beautifulsoup4" "python-requests>=2.4" "python-dnspython")
optdepends=("python-argcomplete")
provides=('linkchecker')
conflicts=('linkchecker')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer' 'python-setuptools-scm' 'python-hatch-vcs')
source=("git+https://github.com/linkchecker/linkchecker.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/linkchecker
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}"/linkchecker
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
