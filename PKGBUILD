# Maintainer: Andre <andre-arch@delorus.de>
pkgname=antfs-cli-git
_gitname=antfs-cli
pkgver=r52.afdc5ff
pkgrel=4
pkgdesc="A python library to download and upload files from ANT-FS compliant devices (Garmin products)."
arch=('i686' 'x86_64')
source=(git+https://github.com/Tigge/antfs-cli.git)
url="https://github.com/Tigge/antfs-cli"
license=("custom:${_gitname}")
depends=('python2-openant-git')
makedepends=('python2-setuptools')
conflicts=('garmin-forerunner-610-extractor-git')
optdepends=('fittotcx-git: Automatically convert FIT files into TCX files by scripting.' 
	    'gcpuploader: Automatically upload FIT files to garmin-connect by scripting.')
install=antfs-cli.install
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gitname}"

  python2 setup.py install --root="$pkgdir/"

  install -Dm644 README.md ${pkgdir}/usr/share/${_gitname}/README
  install -Dm644 SCRIPTING ${pkgdir}/usr/share/${_gitname}/SCRIPTING

  sed -i 's|fittotcx = "/path/to/FIT-to-TCX/fittotcx.py"|fittotcx= "/usr/bin/fittotcx"|' scripts/40-convert_to_tcx.py
  sed -i 's|gupload = "/path/to/bin/gupload.py"|gupload= "/usr/bin/gupload.py"|' scripts/40-upload_to_garmin_connect.py
  install -Dm644 scripts/40-convert_to_tcx.py ${pkgdir}/usr/share/${_gitname}/scripts/40-convert_to_tcx.py
  install -Dm644 scripts/40-upload_to_garmin_connect.py ${pkgdir}/usr/share/${_gitname}/scripts/40-upload_to_garmin_connect.py

  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${_gitname}/LICENSE
}
