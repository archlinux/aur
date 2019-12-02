# Davide Depau <davide@depau.eu>

_pkgname=shcrt
pkgname=$_pkgname-git
pkgver=r36.f1ff4b3
pkgrel=1
pkgdesc="Replace proprietary SecureCRT software with a Bash script that parses its configs"
arch=('any')
depends=('bash' 'easybashgui' 'python' 'python-pycrypto')
url="https://github.com/Depau/shcrt"
license=('GPL3')
source=(${_pkgname}::git+https://github.com/Depau/shcrt.git)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${_pkgname}"
  
  install -dm755 "$pkgdir/usr/lib/shcrt"
  install -m755 shcrt "$pkgdir/usr/lib/shcrt/shcrt"
  install -m644 sftp_runners.sh "$pkgdir/usr/lib/shcrt/sftp_runners.sh"
  install -m755 crt2foss.py "$pkgdir/usr/lib/shcrt/crt2foss.py"
  install -m755 SecureCRTCipher.py "$pkgdir/usr/lib/shcrt/SecureCRTCipher.py"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /usr/lib/shcrt/shcrt "$pkgdir/usr/bin/shcrt"
  ln -sf /usr/lib/shcrt/crt2foss.py "$pkgdir/usr/bin/crt2foss"
  ln -sf /usr/lib/shcrt/SecureCRTCipher.py "$pkgdir/usr/bin/SecureCRTCipher.py"
}
