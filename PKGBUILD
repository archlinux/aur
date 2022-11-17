# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DXconvert
pkgname=${_name,,}
pkgver=3.1.7
pkgrel=1
pkgdesc='A file conversion and manipulation toolkit for Yamaha FM synth patches'
arch=(any)
url='http://dxconvert.martintarenskeen.nl/'
license=(GPL3)
depends=(python)
optdepends=(
  'castools: convert Cassette Interface data (DX100/27/21, DX9, TX81Z)'
  'python-rtmidi: MIDI input/output'
  'tk: dxconvert and txconvert GUI'
  'zbar: convert patches from QR codes to SysEx'
)
groups=(pro-audio)
source=("http://home.kpn.nl/m.tarenskeen/download/sysex/$_name/$_name-$pkgver.zip")
sha256sums=('3c389ef5bacfe2610887c677f0607cc0aa80d9092c21fe8b945898c49b379c08')

package() {
  cd $_name-$pkgver
  local py_major_ver="$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')"

  # install Python package
  install -Dm644 DXconvert/* \
    -t "$pkgdir"/usr/lib/python$py_major_ver/site-packages/DXconvert

  # install scripts in root dir
  for py in *.py; do
    install -Dm755 "$py" "$pkgdir"/usr/bin/${py%.py}
  done

  # install MIDI configuration helper script
  install -Dm755 midi_help.pyw "$pkgdir"/usr/bin/dxconvert-midi-help

  # install scripts in Tools dir
  for tool in Tools/*.py; do
    bn="${tool##*/}"
    install -Dm755 "$tool" "$pkgdir"/usr/bin/dxconvert-${bn%.py}
  done

  # Install documentation
  install -Dm644 CHANGES.txt FORMATS.txt README*.txt Tools/README-Tools.txt \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
