# Maintainer:
# Contributor: robertfoster

_pkgname="soundcloud-dl"
pkgname="$_pkgname-git"
pkgver=2.12.1.r0.g9732b53
pkgrel=2
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
license=('GPL-2.0-only')
arch=('any')

depends=(
  'python'
  'python-docopt'
  'python-filelock'
  'python-mutagen'
  'python-requests'
  'python-termcolor'
  'python-tqdm'
  'python-typing_extensions'

  ## AUR
  # 'python-dacite' # python-soundcloud-v2
  'python-pathvalidate'
  'python-soundcloud-v2'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$_site_packages/tests"
}
