# Maintainer: 
# Contriubutor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nile-git
pkgver=1.1.0.r0.g55287cd
pkgrel=2
pkgdesc="Unofficial Amazon Games client"
arch=('any')
url="https://github.com/imLinguin/nile"
license=('GPL-3.0-or-later')
depends=(
  'python-json5'
  'python-platformdirs'
  'python-protobuf'
  'python-pycryptodome'
  'python-requests'
  'python-zstandard'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/imLinguin/nile.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}${site_packages}"
  cp -r "${pkgname%-git}" "${pkgdir}${site_packages}"

  # Compile Python bytecode
  python -m compileall -d / "${pkgdir}${site_packages}"
  python -O -m compileall -d / "${pkgdir}${site_packages}"

  install -d "$pkgdir/usr/bin"
  ln -s "${site_packages}/${pkgname%-git}/cli.py" "$pkgdir/usr/bin/${pkgname%-git}"
}
