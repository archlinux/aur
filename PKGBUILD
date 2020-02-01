# Maintainer: Jake <aur@ja-ke.tech>

pkgname=searx
pkgver=0.16.0
pkgrel=1
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
        'searx.sysusers')
sha512sums=('3ae4e4c295830e65eefbd39ed9885b60a42a4d4db4d87c179ace76cf43f8c75d49f1363f019bedd135c0597191612e16592cacd159ae97a42a25dcc2fee9d00b'
            '6e1e7771e747e2bcb9cbc3e5ec9735461b6d791c0c0412e06e7dd802c18625edd0916de32164bf780c18ef7b6a87f55ed1e917377b3adb2bf53c0344f34b49e8'
            '6856e26451fe053d37c2ce4b9d5f3b35891dd8ec702c5256c02d04415124c57705abc497f12943948a85621bb0238d26c2c1f3a7bf42404a6ff1487c7655909e')

package() {
  cd $srcdir/$pkgname-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" $pkgname/settings.yml

  python3.8 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python3.8/site-packages/{README.rst,requirements*,searx}
  
  mkdir -p $pkgdir/etc/$pkgname
  mv $pkgdir/usr/lib/python3.8/site-packages/$pkgname/settings.yml $pkgdir/etc/$pkgname/
  ln -s /etc/$pkgname/settings.yml $pkgdir/usr/lib/python3.8/site-packages/$pkgname/settings.yml

  install -Dm644 "${srcdir}/searx.sysusers" "${pkgdir}/usr/lib/sysusers.d/searx.conf"
  install -Dm644 "${srcdir}/searx.ini" "${pkgdir}/etc/uwsgi/searx.ini"
}
