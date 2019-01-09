# Maintainer: Jake <aur@ja-ke.tech>

pkgname=searx-py3
_pkgname=searx
pkgver=0.15.0
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine (python3 based)"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('openssl')
depends=(
        'python-certifi'
        'python-flask'
        'python-flask-babel'        
        'python-lxml'
        'python-idna'
        'python-pygments'
        'python-pyopenssl'
        'python-dateutil'        
        'python-yaml'
        'python-requests'
        'python-pysocks')
conflicts=('searx-git' 'searx')
backup=('etc/searx/settings.yml')
source=("https://github.com/asciimoo/searx/archive/v$pkgver.zip"
        'searx.sysusers'
        'searx.service')
sha512sums=('29b233897b4938b3262b01f7f32a0ff69481ed8934f9e0391571d7da261e4494a5e77f64b683292b5150cc50bb8ba74355c2edc526dd348b2fbd11600cb0592e'
            '0f4e134ffb7d36807a0591b92e10d2d74a790aeba50d90dc6bdff634353a1e9ed48c572dcf724483daa9eceb5505dc9b79a1b5a8c28a228b300a01b1eafcdc9f'
            '64ab805f7e0089d9b638c2972687ba60331304b3d63bfff138ce8b7903d999f40854067c384cafbc6c635afc335bd084b758cbb7c5cac397d97ed1f31e67ac6e')


package() {
  cd $srcdir/$_pkgname-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" $_pkgname/settings.yml

  python3.7 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python3.7/site-packages/{README.rst,requirements*,tests,searx}
  
  mkdir -p $pkgdir/etc/$_pkgname
  mv $pkgdir/usr/lib/python3.7/site-packages/$_pkgname/settings.yml $pkgdir/etc/$_pkgname/
  ln -s /etc/$_pkgname/settings.yml $pkgdir/usr/lib/python3.7/site-packages/$_pkgname/settings.yml

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
  install -Dm644 "${srcdir}/searx.sysusers" "${pkgdir}/usr/lib/sysusers.d/searx.conf"
}
