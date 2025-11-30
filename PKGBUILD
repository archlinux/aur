# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DXconvert
pkgname=${_name,,}
pkgver=3.2.4
pkgrel=1
pkgdesc='A file conversion and manipulation toolkit for Yamaha FM synth patches'
arch=(any)
url='https://dxconvert.martintarenskeen.nl/'
license=(GPL-3.0-only)
depends=(python)
optdepends=(
  # We can't package castools for our repo, since it has neither a source dist
  # nor a git tag for a current release.
  #'castools: convert Cassette Interface data (DX100/27/21, DX9, TX81Z)'
  'tk: dxconvert and txconvert GUI'
  'zbar: convert patches from QR codes to SysEx'
  'python-qrcode: convert patches from SysEx to QR codes'
)
groups=(pro-audio)
source=("https://dxconvert.martintarenskeen.nl/$_name-$pkgver.zip")
sha256sums=('38af18baa7b2d55ee4fc515b3f97e53bd11b2aa4b9c33e53f792493dfcf02bc2')

prepare() {
  cd $_name-$pkgver
  # Fix broken shebang
  sed -i -e 's|#!/env|#!/usr/bin/env|' dxconvert-gui.py
}

package() {
  cd $_name-$pkgver
  local py_major_ver="$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')"

  # install Python package
  install -Dm644 $_name/*.{gif,help,py} \
    -t "$pkgdir"/usr/lib/python$py_major_ver/site-packages/$_name
  python -m compileall -s "$pkgdir" \
    "$pkgdir"/usr/lib/python$py_major_ver/site-packages/$_name

  # install scripts in root dir
  for py in *.py; do
    install -Dm755 "$py" "$pkgdir"/usr/bin/${py%.py}
  done

  # install scripts in Tools dir
  for tool in Tools/*.py; do
    bn="${tool##*/}"
    install -Dm755 "$tool" "$pkgdir"/usr/bin/$pkgname-${bn%.py}
  done

  # Install documentation
  install -Dm644 CHANGES.txt FORMATS.txt README*.txt Tools/README-Tools.txt \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
