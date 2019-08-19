# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=parsedmarc
pkgver=6.5.4
_commit=6efec4e6334bff28f7fd4ee89932d08307a70289 # Upstream does not tag releases - cherry-pick has commit message of release version
pkgrel=1
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=(any)
url=https://domainaware.github.io/parsedmarc
license=(Apache)
depends=('python-tqdm>=4.31.1'
         'rstcheck>=3.3.1'
         python-pygments
         'python-dnspython>=1.16.0'
         'python-expiringdict>=1.1.4'
         'python-urllib3<1.25'
         'python-urllib3>=1.21.1'
         'python-requests>=2.2.16.0'
         python-publicsuffix2
         'python-xmltodict>=0.12.0'
         'python-geoip2>=2.9.0'
         'python-imapclient>=2.1.0'
         'mailparser>=3.9.2'
         'python-dateparser>=0.7.1'
         'python-elasticsearch<7.0.0'
         'python-elasticsearch>=6.3.1'
         'python-elasticsearch-dsl<7.0.0'
         'python-elasticsearch-dsl>=6.3.1'
         'python-kafka>=1.4.4'
         'python-mailsuite>=1.1.0'
         python-nose
         python-pygments
         flake8
         python-collective-checkdocs
         python-jinja
         python-packaging
         python-imagesize
         python-sphinx-alabaster-theme
         python-babel
         'rstcheck>=3.3.1'
         python-sphinx
         python-sphinx_rtd_theme
         python-wheel
         python-codecov)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::https://github.com/domainaware/parsedmarc/archive/$_commit.tar.gz)
sha512sums=('a8ef754b9838c794afcffbf35620f48f83bf6aa7ebab1f2521bcc26cd481ae9761d80333fa2a67462993d1c30bc76293acf44ec2908b82390def1bd8a442070e')

build() {
  cd $pkgname-$_commit
  python setup.py build

  cd docs
  make man
}

check() {
  cd $pkgname-$_commit
  python tests.py || warning "Tests failed"
}

package() {
  cd $pkgname-$_commit
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 docs/_build/man/parsedmarc.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a samples "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
