pkgname=paperwork-git
_pkgname=paperwork
pkgver=2.0.3+274+gb60a846c
pkgrel=1
pkgdesc="Personal document manager for GNOME to manage scanned documents and PDFs"
arch=(any)
url="https://openpaper.work/"
license=(GPL3)
depends=('gtk3'
         'libinsane'
         'libnotify'
         'poppler-glib'
         'python-cairo'
         'python-dateutil'
         'python-distro'
         'python-gobject'
         'python-levenshtein'
         'python-natsort'
         'python-numpy'
         'python-pillowfight'
         'python-pycountry'
         'python-pydbus'
         'python-pyenchant'
         'python-pyocr'
         'python-scikit-learn'
         'python-scipy'
         'python-setuptools'
         'python-simplebayes'
         'python-termcolor'
         'python-whoosh'
         'python-xdg')
makedepends=('git')
provides=('paperwork')
conflicts=('paperwork')
source=("git+https://gitlab.gnome.org/World/OpenPaperwork/paperwork.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  make version
  make l10n_compile
}

package() {
  cd $_pkgname
  for dir in openpaperwork-{core,gtk} paperwork-{backend,gtk}; do
    pushd $dir
    python3 setup.py install --root="$pkgdir" --optimize=1
    popd
  done

  PYTHONPATH=`echo "$pkgdir"/usr/lib/python*/site-packages/` \
    "$pkgdir"/usr/bin/paperwork-gtk install \
      --icon_base_dir="$pkgdir/usr/share/icons" \
      --data_base_dir="$pkgdir/usr/share"
}
