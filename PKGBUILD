# Maintainer:  koukourikos <ekoukourikos@freemail.gr>
# Contributor: jyantis <yantis@yantis.net>

pkgname=pypdfocr-git
pkgver=0.9.1
pkgrel=1
pkgdesc='Tesseract OCR based PDF Filing. Converts a non searchable PDF into a searchable PDF and more options including folder watching and automatically uploading to Evernote'
arch=('any')
url='https://github.com/virantha/pypdfocr'
license=('Apache')
depends=('python2'
         'python2-pillow'
         'python2-watchdog'
         'python2-pypdf2-git'
         'python2-reportlab'
         'tesseract'
         'ghostscript'
         'poppler'
         'tesseract-data-eng'
         'evernote-sdk-python'
         'python2-thrift'
         'python2-oauth2'
         'imagemagick'
         )
optdepends=('tesseract-data: For languages other than english')
source=('git+https://github.com/virantha/pypdfocr.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('pypdfocr')
conflicts=('pypdfocr')

pkgver() {
  cd pypdfocr
  printf "%s." "$(grep -R "__version__ = " pypdfocr/version.py | awk -F\" '{print $2}')" $_gitversion | sed 's/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pypdfocr

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd pypdfocr

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  # Fix to handle rotated documents in English
  # install -D -m644 /usr/share/tessdata/eng.traineddata "${pkgdir}/usr/share/tessdata/osd.traineddata"
}
# vim:set ts=2 sw=2 et:
