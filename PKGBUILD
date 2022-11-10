# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=awslogs
pkgver=0.14.0
pkgrel=4
pkgdesc="AWS CloudWatch logs for Humans™"
arch=('any')
license=('Apache')
url="https://github.com/jorgebastida/awslogs"
depends=('python>=3'
         'python-boto3'
         'python-jmespath'
         'python-termcolor'
         'python-dateutil')
makedepends=('python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jorgebastida/${pkgname}/archive/${pkgver}.tar.gz"
        'exlude-tests.patch::https://github.com/jorgebastida/awslogs/commit/4c43ec681ce17e427a5f33a054b4ef66baa98ee9.patch'
        'support-jmespath-1x.patch::https://github.com/jorgebastida/awslogs/commit/57861bed66e6a4ca6f24ef6487709e6b891746cc.patch')
sha512sums=('73f7d4e983b0a1658027aa88174ced0d2760823463c67832303be72b174ecdfbf6aabd73342634e233afd7736c57d397b55f0db89d0c59392145062de8868241'
            'f56c1861a334c32eff762bae73d8af85cb961a61137e5613e6d49258b10ed676721fb0925e9186d54dee68e8b63116829be1046e432854b1b161617c001564e9'
            '0d2b5b51913bc19e3674a0451c1faf1975206b34f7c9183863c9e26487039d53cb685295ddb754c9b4695468a2c8928aeb5793323ca42230c46740af6a1b74bb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # See: https://github.com/jorgebastida/awslogs/pull/324
  patch -Nfp1 < "$srcdir/exclude-tests.patch"
  # See: https://github.com/jorgebastida/awslogs/pull/380
  patch -Nfp1 < "$srcdir/support-jmespath-1x.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
