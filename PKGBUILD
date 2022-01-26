# Maintainer: Erhad Husovic <xdaemonx[at]protonmail[dot]ch>
# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=blink-qt
pkgname=blink
pkgver=5.1.8
pkgrel=3
pkgdesc='Fully featured, easy to use SIP client with a Qt based UI'
arch=('aarch64' 'x86_64')
url='https://icanblink.com'
license=('GPL-3+')
depends=(
  'icu'
  'libvncserver'
  'python-gevent'
  'python-gmpy2'
  'python-google-api-python-client'
  'python-oauth2client'
  'python-pyopenssl'
  'python-pyqt5'
  'python-service-identity'
  'python-sipsimple'
  'qt5-svg'
  'qt5-webkit'
  )
optdepends=('x11vnc: for screen sharing')
_commit=a54013c11bee521a224c81c021e1bf453320ca79 # 5.1.8
source=("$pkgname-$pkgver.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/$_commit.tar.gz" 'fix_for_python310.patch')
b2sums=(
	'7b0feab275f4c2abecb86784ce134aad7ef0129fc61aad7ef3ceb4ead61f1f7b0959e13faa4bfcb0705341e3d101034371f7714a14996e046ceffc96a3bbc878'
	'7f4d6ea14a19a0f5e120855621a5e275303abc8924b0047ea0db3b4dda11cdf501a809c0723708751faef6d3d05a469bfa21050dcddeeb7d71ecaff82b48b0ee'
)

prepare() {
  cd $_pkgname-$_commit
  patch --forward --strip=1 --input="${srcdir}/fix_for_python310.patch"
}

build() {
  cd $_pkgname-$_commit
  python3 setup.py build
}

package() {
  cd $_pkgname-$_commit
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop file
  install -Dm644 "debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
