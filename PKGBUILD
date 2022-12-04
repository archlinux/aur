# Maintainer: Georg Pichler <georg.pichler@gmail.com>

pkgname=pystatsd-git
pkgver=v4.0.1.r6.g4c621bf
pkgrel=1
pkgdesc="A Python client for statsd"
arch=('any')
url="https://pypi.python.org/pypi/statsd"
license=('MIT')
makedepends=('python-setuptools' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-six')
source=("${pkgname}::git+https://github.com/jsocol/pystatsd.git")
options=(!emptydirs)
md5sums=(SKIP)
provides=(pystatsd)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}



package() {
  # From AUR package `python-statsd.git`
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # make sure we don't install any world-writable or root-readable-only files
  # we shouldn't need to fix ownership as we extract tarballs as a non-root user
  # https://github.com/pypa/setuptools/issues/1328
  # https://github.com/LonamiWebs/Telethon/issues/1605
  chmod u=rwX,go=rX -R "$pkgdir"
  # make sure we don't install annoying files
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$_site_packages/tests/"
}
