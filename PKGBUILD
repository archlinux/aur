# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DXconvert
pkgname=${_name,,}
pkgver=3.2.2
pkgrel=1
pkgdesc='A file conversion and manipulation toolkit for Yamaha FM synth patches'
arch=(any)
url='http://dxconvert.martintarenskeen.nl/'
license=(GPL3)
depends=(python)
optdepends=(
  # We can't package castools for our repo, since it has neither a source dist
  # nor a git tag for a current release.
  #'castools: convert Cassette Interface data (DX100/27/21, DX9, TX81Z)'
  'tk: dxconvert and txconvert GUI'
  'zbar: convert patches from QR codes to SysEx'
)
groups=(pro-audio)
source=("https://dxconvert.martintarenskeen.nl/$_name-$pkgver.zip")
sha256sums=('adc3f1d3188e58ae99ab83286b53ad4a8fc077c6e0784dea01ad9f1d163f393d')

prepare() {
  cd $_name-$pkgver
  # Fix broken shebang
  sed -i -e 's|#!/env|#!/usr/bin/env|' dxconvert-gui.py
}

package() {
  cd $_name-$pkgver
  local py_major_ver="$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')"

  # install Python package
  install -Dm644 DXconvert/*.{gif,help,py} \
    -t "$pkgdir"/usr/lib/python$py_major_ver/site-packages/DXconvert

  # install scripts in root dir
  for py in *.py; do
    install -Dm755 "$py" "$pkgdir"/usr/bin/${py%.py}
  done

  # install scripts in Tools dir
  for tool in Tools/*.py; do
    bn="${tool##*/}"
    install -Dm755 "$tool" "$pkgdir"/usr/bin/dxconvert-${bn%.py}
  done

  # Install documentation
  install -Dm644 CHANGES.txt FORMATS.txt README*.txt Tools/README-Tools.txt \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
