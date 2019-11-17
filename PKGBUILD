# Maintainer: Jake <aur@ja-ke.tech>

pkgname=searx
pkgver=0.15.0
pkgrel=3
pkgdesc="A privacy-respecting, hackable metasearch engine (python(3) based)"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('openssl')
depends=(
        'uwsgi'
        'uwsgi-plugin-python'
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
conflicts=('searx-git' )
replaces=('searx-py3')
backup=('etc/searx/settings.yml' 'etc/uwsgi/searx.ini')
source=("https://github.com/asciimoo/searx/archive/v$pkgver.zip"
        'searx.ini'
        'searx.sysusers'
        '3.8_escape.patch')
sha512sums=('29b233897b4938b3262b01f7f32a0ff69481ed8934f9e0391571d7da261e4494a5e77f64b683292b5150cc50bb8ba74355c2edc526dd348b2fbd11600cb0592e'
            '6e1e7771e747e2bcb9cbc3e5ec9735461b6d791c0c0412e06e7dd802c18625edd0916de32164bf780c18ef7b6a87f55ed1e917377b3adb2bf53c0344f34b49e8'
            '0f4e134ffb7d36807a0591b92e10d2d74a790aeba50d90dc6bdff634353a1e9ed48c572dcf724483daa9eceb5505dc9b79a1b5a8c28a228b300a01b1eafcdc9f'
            'b0d67d7f4af44c492eec48f4068c653c6c087fc4a3cfc7dc9e77a08445494e6c98b610a77a75fec07f7f32f549747061dd12ae4420445ab0755dfe78742a4e72')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i "../3.8_escape.patch"
}
            
            
package() {
  cd $srcdir/$pkgname-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" $pkgname/settings.yml

  python3.8 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python3.8/site-packages/{README.rst,requirements*,tests,searx}
  
  mkdir -p $pkgdir/etc/$pkgname
  mv $pkgdir/usr/lib/python3.8/site-packages/$pkgname/settings.yml $pkgdir/etc/$pkgname/
  ln -s /etc/$pkgname/settings.yml $pkgdir/usr/lib/python3.8/site-packages/$pkgname/settings.yml

  install -Dm644 "${srcdir}/searx.sysusers" "${pkgdir}/usr/lib/sysusers.d/searx.conf"
  install -Dm644 "${srcdir}/searx.ini" "${pkgdir}/etc/uwsgi/searx.ini"
}
