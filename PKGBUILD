# Contributor: SZanko, szanko at protonmail dot com

pkgbase="mailchecker"
pkgname=(
	#"go-mailchecker"
	#"nodejs-mailchecker"
	#"php-mailchecker"
	"python-mailchecker"
	#"ruby-mailchecker"
	#"rust-mailchecker"
)
_pkgname="mailchecker"
pkgver="6.0.19"
pkgrel="1"
pkgdesc='Cross-language email validation. Backed by a database of over 30 000 throwable email domains.'
arch=('any')
url='https://github.com/FGRibreau/mailchecker/'
license=('MIT')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(
  'b2c58c93333351df52d53fb44602d38949373ce886907c596d715b24d8c3d01c'
)
makedepends=(
'python-setuptools'
'npm'
'python-installer'
'python-build'
#'rubygems'
)


build() {
  msg "Generate List"
  cd "$srcdir/${_pkgname}-${pkgver}"
  npm install && npm audit fix && npm run build

  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
#  sed -E -i "s/version[[:space:]]*=(.*)/version = '${pkgver}',/g" setup.py
  python -m build --wheel --no-isolation

  #msg "Building Ruby Gem"
  #cd "$srcdir/${_pkgname}-${pkgver}"
  #sed -E -i "s/spec.version[[:space:]]*=(.*)/spec.version = '${pkgver}'/g" *.gemspec
  #gem build *.gemspec
}


package_python-mailchecker() {
  depends=(
	'python'
  )
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-mailchecker/LICENSE.txt"
}

package_ruby-mailchecker() {
  depends=(
	'ruby'
  )
  local _gemdir="$('gem env gemdir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgbase-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgbase-$pkgver.gem"
}
