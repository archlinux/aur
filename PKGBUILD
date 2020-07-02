# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DXconvert
pkgname=dxconvert
pkgver=3.0.7
pkgrel=1
pkgdesc="A file conversion and manipulation toolkit for Yamaha FM synth patches"
arch=('any')
url="http://dxconvert.martintarenskeen.nl/"
license=('GPL3')
depends=('python')
optdepends=('castools: convert Cassette Interface data (DX100/27/21, DX9, TX81Z)'
            'python-rtmidi: MIDI input/output'
            'tk: dxconvert and txconvert GUI'
            'zbar: convert patches from QR codes to SysEx')
source=("http://home.kpn.nl/m.tarenskeen/download/sysex/${_name}/${_name}-${pkgver}.zip")
sha256sums=('6adef058809430f41eaa22cbcfb225fc61e2c2a583b9ce89f006a767d1a2a53c')


package() {
  cd "${srcdir}/${_name}-${pkgver}"
  local py_major_ver="$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')"
  # install Python package
  install -Dm644 DXconvert/* -t \
    "${pkgdir}/usr/lib/python${py_major_ver}/site-packages/DXconvert"
  # install scripts
  for py in *.py; do
    install -Dm755 "$py" "${pkgdir}/usr/bin/${py%.py}"
  done
  install -Dm755 midi_help.pyw "${pkgdir}/usr/bin/dxconvert-midi-help"
  for tool in Tools/*.py; do
    bn="${tool##*/}"
    install -Dm755 "$tool" "${pkgdir}/usr/bin/dxconvert-${bn%.py}"
  done
  # Install documentation
  install -Dm644 CHANGES.txt FORMATS.txt README*.txt Tools/README-Tools.txt \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
